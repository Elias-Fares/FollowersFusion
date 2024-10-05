import 'dart:developer';

import 'package:followers/core/payment_methods_widget/payment_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';


import '../../utlis/translation/translation.dart';
import '../constant.dart';
import '../messages/show_snack_bar_message.dart';
import 'card_details_screen.dart';

class PaymentHelper {
  static void initializePaymentSDK() {
    MFSDK.init(
      kDebugMode ? Constant.myFatorahTestToken : Constant.myFatorahLiveToken,
      MFCountry.SAUDIARABIA,
      kDebugMode ? MFEnvironment.TEST : MFEnvironment.LIVE,
    );
  }

  static void executePayment({
    required BuildContext context,
    required bool isDirectPayment,
    required int paymentMethodId,
    required String price,
    required Function(PaymentResponse paymentResponse) onResponse,
  }) async {
    if (isDirectPayment) {
      print("driect");
      var map ={
        "paymentMethodId":paymentMethodId,
        "price":price,
      };
      final response = await Navigator.of(context).pushNamed(
        CardDetailsScreen.name,


        arguments: map,
      );

      if (response != null) {
        onResponse(response as PaymentResponse);
      }
    } else {

      //TODO Get User Id And User Name
      // var repository = sl<IRepository>();
      //
      // final userId = await repository.getServerID();
      // final username = await repository.getName();

      final userId="";
      final username="";
      // var request = MFExecutePaymentRequest(
      //    paymentMethodId,
      //    double.parse(TempVariable.offerPrice),
      //
      // );

      var request = MFExecutePaymentRequest(
          paymentMethodId: paymentMethodId,
          customerName: '$username $userId',
          invoiceValue:double.parse(price)
      );

      request.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;


      //old
      // onPaymentResponse: (
      //     String invoiceId,
      //     MFResult<MFPaymentStatusResponse> result,
      //     ) {
      //   log("the payment1 ="+result.toString());
      //
      //   if (result.isSuccess()) {
      //     final paymentResponse = PaymentResponse(
      //       invoiceId: invoiceId,
      //       amount: TempVariable.offerPrice,
      //       paymentStatus: paymentSuccessStatus,
      //       paymentId: result.response!.invoiceTransactions!.first.paymentId,
      //       jsonObject: result.response!.toJson().toString(),
      //     );
      //
      //     onResponse(paymentResponse);
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
      //     onResponse(paymentResponse);
      //   }
      // },



      var mainInvoiceId="";
      MFSDK.executePayment(
        request,
        _isEnglish ? MFLanguage.ENGLISH : MFLanguage.ARABIC,
              (invoiceId) {
                mainInvoiceId=invoiceId;
            debugPrint(invoiceId);
          }).then((value){

        if (value.invoiceId!=null) {
          final paymentResponse = PaymentResponse(
            invoiceId: value.invoiceId.toString(),
            amount: price,
            //TODO Ask about paymentStatus form where
            paymentStatus:value.invoiceStatus??"",
            paymentId: value.invoiceTransactions!.first.paymentId,
            jsonObject: value.toJson().toString(),
          );

          onResponse(paymentResponse);
        }else{
          showSnackBarMessage(message:"unknown error empty response");
          final paymentResponse = PaymentResponse(
            invoiceId: mainInvoiceId,
            amount: price,
            paymentStatus: Constant.paymentErrorStatus,
            errorMessage: "unknown error empty response",
          );
          onResponse(paymentResponse);
        }
        debugPrint(value.toString());

      }

      ).catchError((error){

        if(error!=null && error.message!=null) {
        showSnackBarMessage(message:error.message );
        }
        else{
          showSnackBarMessage(message:"unknown error empty response" );
        }

        //
        final paymentResponse = PaymentResponse(
          invoiceId: mainInvoiceId,
          amount: price,
          paymentStatus: Constant.paymentErrorStatus,
          errorMessage: error?.message??"unknown error empty response"
        );

        onResponse(paymentResponse);
      });
    }
  }

  static bool get _isEnglish => AppLanguageKeys.appLang.value==AppLanguageKeys.en;
}
