import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';


import '../../utlis/translation/translation.dart';
import '../constant.dart';
import '../messages/show_snack_bar_message.dart';
import '../widgets/bars/sub_app_bar.dart';
import '../widgets/button/buttons/loading_button.dart';
import '../widgets/style/color.dart';
import '../widgets/text/base_text.dart';
import 'payment_response.dart';
import 'text_input.dart';

class CardDetailsScreen extends StatefulWidget {
  static const name = "/card-details";


  const CardDetailsScreen({super.key,});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "card_details"),
      body: Column(
        children: [
          Expanded(
            child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      TextInput(
                        name: 'cardNumber',
                        hint: "card_number",
                        inputType: TextInputType.number,
                        maxLength: 16,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.creditCard(),
                        ]),
                      ),
                      const SizedBox.square(dimension: 16),
                      TextInput(
                        name: 'expiryMonth',
                        hint:"expiry_month",
                        inputType: TextInputType.number,
                        maxLength: 2,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(1),
                          FormBuilderValidators.maxLength(2),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.integer(),
                        ]),
                      ),
                      const SizedBox.square(dimension: 16),
                      TextInput(
                        name: 'expiryYear',
                        hint: "expiry_year",
                        inputType: TextInputType.number,
                        maxLength: 2,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(2),
                          FormBuilderValidators.maxLength(2),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.integer(),
                          FormBuilderValidators.min(
                            DateTime.now().year - 2000,
                          ),
                        ]),
                      ),
                      const SizedBox.square(dimension: 16),
                      TextInput(
                        name: 'cvv',
                        hint: "security_code",
                        inputType: TextInputType.number,
                        maxLength: 4,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(3),
                          FormBuilderValidators.maxLength(4),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.integer(),
                        ]),
                      ),
                      const SizedBox.square(dimension: 16),
                      TextInput(
                        name: 'cardHolderName',
                        hint: "card_holder_name",
                        inputType: TextInputType.name,
                        validator: FormBuilderValidators.required(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: LoadingButton(
              onPressed: _pay,
              loading: _isLoading,
              elevation: 0,
              height: 54.h,
              child: BaseText(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                size: 14,
                title: "pay",
              ),
              borderRadius: 12,
              color: Theme.of(context).hintColor
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pay() async {
    try {
      final formState = _formKey.currentState;
      if (formState != null) {
        if (formState.validate()) {
          formState.save();

          final formData = formState.value;

          // final paymentMethodId =
          //     ModalRoute.of(context)!.settings.arguments as int;


          final map =
          ModalRoute.of(context)!.settings.arguments as Map;
          final paymentMethodId =map["paymentMethodId"];
          final price =map["price"];

          final amount = double.parse(price);

          setState(() => _isLoading = true);


          //TODO Get User Id And User Name
          // var repository = sl<IRepository>();
          //
          // final userId = await repository.getServerID();
          // final username = await repository.getName();

          final userId="";
          final username="";




          var request = MFExecutePaymentRequest(
           paymentMethodId: paymentMethodId,
            customerName: '$username $userId',
            invoiceValue:amount
          );

          var mfCardInfo = MFCard(
            number: formData['cardNumber'],
            expiryMonth: formData['expiryMonth'],
            expiryYear: formData['expiryYear'],
            securityCode: formData['cvv'],
            cardHolderName: formData['cardHolderName'],
            // bypass3DS: false,
            // saveToken: false,
          );



          var directPaymentRequest = MFDirectPaymentRequest(
              executePaymentRequest: request,
              token: null,
               bypass3DS: false,
              saveToken: false,
              card: mfCardInfo);
          //old
          //     (String invoiceId, dynamic result) {
          //   if (result.isSuccess()) {
          //     final paymentResponse = PaymentResponse(
          //       invoiceId: invoiceId,
          //       amount: TempVariable.offerPrice,
          //       paymentStatus: paymentSuccessStatus,
          //       paymentId: result.response!.mfPaymentStatusResponse!
          //           .invoiceTransactions!.first.paymentId,
          //       jsonObject: result.response!.toJson().toString(),
          //     );
          //
          //     Navigator.of(context).pop(paymentResponse);
          //
          //     setState(() => _isLoading = false);
          //   } else {
          //     toastMsg(result.error!.message, isError: true);
          //
          //     final paymentResponse = PaymentResponse(
          //       invoiceId: invoiceId,
          //       amount: TempVariable.offerPrice,
          //       paymentStatus: paymentErrorStatus,
          //       errorMessage: result.error!.message,
          //     );
          //
          //     Navigator.of(context).pop(paymentResponse);
          //
          //     setState(() => _isLoading = false);
          //   }
          // },





          var mainInvoiceId="";
          //new
          MFSDK.executeDirectPayment(
            directPaymentRequest,
            _isEnglish ? MFLanguage.ENGLISH : MFLanguage.ARABIC,(invoiceId){
            mainInvoiceId=invoiceId;
          }

          ).then((value) {
            if (value.mfPaymentStatusResponse!=null) {
                  final paymentResponse = PaymentResponse(
                    invoiceId: value.mfPaymentStatusResponse!.invoiceId.toString(),
                    amount: price,
                    //ask here where can i get the status
                    //TODO Ask about paymentStatus form where
                    paymentStatus: value.mfPaymentStatusResponse!.invoiceStatus!,
                    paymentId: value.mfPaymentStatusResponse!
                        .invoiceTransactions!.first.paymentId,
                    jsonObject: value.mfPaymentStatusResponse!.toJson().toString(),
                  );
                  Navigator.of(context).pop(paymentResponse);
              //
                  setState(() => _isLoading = false);
            }


            else {
              showSnackBarMessage(message: "unknown error empty response ");


              final paymentResponse = PaymentResponse(
                invoiceId:mainInvoiceId ,
                amount:  price,
                paymentStatus: Constant.paymentErrorStatus,
                errorMessage: "unknown error empty response",
              );

              Navigator.of(context).pop(paymentResponse);

              setState(() => _isLoading = false);
            }
            debugPrint(value.toString());

          })
              .catchError((error) {
            showSnackBarMessage(message: "unknown error");


                final paymentResponse = PaymentResponse(
                  invoiceId:mainInvoiceId ,
                  amount: price,
                  paymentStatus: Constant.paymentErrorStatus,
                  errorMessage: error?.message??"unknown error",
                );

                Navigator.of(context).pop(paymentResponse);
            debugPrint(error.message);
                setState(() => _isLoading = false);


              });
        }
      }
    } catch (e) {
      log(e.toString());

      showSnackBarMessage(message: "generic_error_message");

      setState(() => _isLoading = false);
    }
  }

  static bool get _isEnglish => AppLanguageKeys.appLang.value==AppLanguageKeys.en;
}
