
import 'dart:io';
import 'package:followers/core/payment_methods_widget/payment_helper.dart';
import 'package:followers/core/payment_methods_widget/payment_method_button.dart';
import 'package:followers/core/payment_methods_widget/payment_response.dart';
import 'package:followers/utlis/translation/local_keys.dart';
import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

import 'package:collection/collection.dart';

import '../../utlis/translation/translation.dart';
import '../messages/show_snack_bar_message.dart';
import '../widgets/style/color.dart';
import 'payment_response.dart';

class PaymentMethodsWidget extends StatefulWidget {
  final String price;
  final Function(PaymentResponse paymentResponse) onResponse;

  const PaymentMethodsWidget({super.key, required this.onResponse,
  required this.price});

  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
  bool _isLoading = true;
  bool _isInit = false;
  List<MFPaymentMethod> paymentMethods = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInit) {
      _initiatePayment();
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_isLoading) {
          return Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          );
        }

        final visaMethod = getPaymentMethod('visa');
        final madaMethod = getPaymentMethod('mada');
        final stcMethod = getPaymentMethod('stc');
        final appleMethod = getPaymentMethod('apple');

        return Column(
          children: [
            Row(
              children: [
                if (visaMethod != null)
                  Expanded(
                    child: PaymentMethodButton(
                      id: visaMethod.paymentMethodId!,
                      imageUrl: visaMethod.imageUrl!,
                      backgroundColor: AppColors.grey.withOpacity(0.10),
                      onTap: () => PaymentHelper.executePayment(
                        context: context,
                        price: widget.price,
                        isDirectPayment: visaMethod.isDirectPayment!,
                        paymentMethodId: visaMethod.paymentMethodId!,
                        onResponse: widget.onResponse,
                      ),
                    ),
                  ),
                if (visaMethod != null && madaMethod != null)
                  const SizedBox.square(dimension: 12),
                if (madaMethod != null)
                  Expanded(
                    child: PaymentMethodButton(
                      id: madaMethod.paymentMethodId!,
                      imageUrl: madaMethod.imageUrl!,
                      backgroundColor: AppColors.blue.withOpacity(0.20),
                      onTap: () => PaymentHelper.executePayment(
                        context: context,
                        price: widget.price,
                        isDirectPayment: madaMethod.isDirectPayment!,
                        paymentMethodId: madaMethod.paymentMethodId!,
                        onResponse: widget.onResponse,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox.square(dimension: 12),
            if (Platform.isIOS)
              Row(
                children: [
                  if (stcMethod != null)
                    Expanded(
                      child: PaymentMethodButton(
                        id: stcMethod.paymentMethodId!,
                        imageUrl: stcMethod.imageUrl!,
                        backgroundColor: AppColors.purple.withOpacity(0.20),
                        onTap: () => PaymentHelper.executePayment(
                          context: context,
                          price: widget.price,
                          isDirectPayment: stcMethod.isDirectPayment!,
                          paymentMethodId: stcMethod.paymentMethodId!,
                          onResponse: widget.onResponse,
                        ),
                      ),
                    ),
                  if (stcMethod != null && appleMethod != null)
                    const SizedBox.square(dimension: 12),
                  if (appleMethod != null)
                    Expanded(
                      child: PaymentMethodButton(
                        id: appleMethod.paymentMethodId!,
                        imageUrl: appleMethod.imageUrl!,
                        backgroundColor: AppColors.black.withOpacity(0.85),
                        onTap: () => PaymentHelper.executePayment(
                          context: context,
                          price: widget.price,
                          isDirectPayment: appleMethod.isDirectPayment!,
                          paymentMethodId: appleMethod.paymentMethodId!,
                          onResponse: widget.onResponse,
                        ),
                      ),
                    ),
                ],
              )
            else if (Platform.isAndroid && stcMethod != null)
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: PaymentMethodButton(
                      id: stcMethod.paymentMethodId!,
                      imageUrl: stcMethod.imageUrl!,
                      backgroundColor: AppColors.purple.withOpacity(0.20),
                      onTap: () => PaymentHelper.executePayment(
                        context: context,
                        price: widget.price,
                        isDirectPayment: stcMethod.isDirectPayment!,
                        paymentMethodId: stcMethod.paymentMethodId!,
                        onResponse: widget.onResponse,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              )
          ],
        );
      },
    );
  }

  MFPaymentMethod? getPaymentMethod(String name) {
    return paymentMethods.firstWhereOrNull(
        (method) => method.paymentMethodEn!.toLowerCase().contains(name));
  }

  static bool get _isEnglish => AppLanguageKeys.appLang.value==AppLanguageKeys.en;

  Future<void> _initiatePayment() async {
    try {
      final amount = double.parse(widget.price);

      MFSDK.setUpActionBar(
        toolBarTitle: LocalKeys.apply_filter,
        toolBarTitleColor: Colors.black.toString(),
        toolBarBackgroundColor: Colors.white.toString(),
        isShowToolBar: true,
      );

      //old
      // var request = MFInitiatePaymentRequest(
      //   amount,
      //   MFCurrencyISO.SAUDIARABIA_SAR,
      // );

      //new
      MFInitiatePaymentRequest request = MFInitiatePaymentRequest(
          invoiceAmount: amount, currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

      //old
      // MFSDK.initiatePayment(
      //   request,
      //   _isEnglish ? MFAPILanguage.EN : MFAPILanguage.AR,
      //   (MFResult<MFInitiatePaymentResponse> result) {
      //     if (result.isSuccess()) {
      //
      //       setState(() {
      //         if (result.response==null || (result.response!=null && result.response!.paymentMethods == null)) {
      //           toastMsg(
      //             AppLocalizations.of(context)!
      //                 .translate("generic_error_message"),
      //             isError: true,
      //           );
      //         } else {
      //           paymentMethods =
      //               result.response!.paymentMethods!.where((method) {
      //             return ![
      //               method.paymentMethodId,
      //               method.isDirectPayment,
      //               method.imageUrl,
      //               method.paymentMethodEn,
      //               method.paymentMethodAr
      //             ].contains(null);
      //           }).toList();
      //
      //           if (Platform.isAndroid) {
      //             paymentMethods.removeWhere(
      //               (element) => element.paymentMethodEn!
      //                   .toLowerCase()
      //                   .contains('apple'),
      //             );
      //           }
      //         }
      //         _isLoading = false;
      //       });
      //     } else {
      //       if (result.error?.message == null) {
      //         toastMsg(
      //           AppLocalizations.of(context)!
      //               .translate("generic_error_message"),
      //           isError: true,
      //         );
      //       }
      //       else {
      //         toastMsg(result.error!.message, isError: true);
      //       }
      //       setState(() => _isLoading = false);
      //     }
      //   },
      // );

      //new
      await MFSDK
          .initiatePayment(request, _isEnglish ? MFLanguage.ENGLISH: MFLanguage.ARABIC,)
          .then((value) {


          setState(() {
            //paymentMethods
            if (value.paymentMethods==null ||
                value.paymentMethods!.isEmpty||
                (value.paymentMethods!.elementAt(0).paymentMethodId==null)) {
              showSnackBarMessage(message: "generic_error_message");

            } else {
               paymentMethods =
                  value.paymentMethods!.where((method) {
                    return ![
                      method.paymentMethodId,
                      method.isDirectPayment,
                      method.imageUrl,
                      method.paymentMethodEn,
                      method.paymentMethodAr
                    ].contains(null);
                  }).toList();

              if (Platform.isAndroid) {
                paymentMethods.removeWhere(
                      (element) => element.paymentMethodEn!
                      .toLowerCase()
                      .contains('apple'),
                );
              }
            }
            _isLoading = false;
          });

            debugPrint(value.toString());
          })
          .catchError((error) {

            if(error==null || error.message==null) {
              showSnackBarMessage(message: "generic_error_message");


            } else{
              showSnackBarMessage(message: error!.message);

            }



        setState(() => _isLoading = false);

            debugPrint(error.message);
          });
    } catch (_) {

      showSnackBarMessage(message: "generic_error_message");

      setState(() => _isLoading = false);
    }
  }
}
