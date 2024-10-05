import 'package:get/get.dart';

import '../../res.dart';
import '../../utlis/translation/local_keys.dart';

enum PaymentMethodType { mada, visa, master, stcPay, amex }

extension PaymentMethodTypeExtension on PaymentMethodType {
  getValue() {
    switch (this) {
      case PaymentMethodType.mada:
        return "mada";
      case PaymentMethodType.visa:
        return "visa";
      case PaymentMethodType.master:
        return "master";
      case PaymentMethodType.stcPay:
        return "stc_pay";
      case PaymentMethodType.amex:
        return "amex";
    }
  }

  getName() {
    switch (this) {
      case PaymentMethodType.mada:
        return LocalKeys.mada_payment_type.tr;
      case PaymentMethodType.visa:
        return LocalKeys.visa_payment_type.tr;
      case PaymentMethodType.master:
        return LocalKeys.master_payment_type.tr;
      case PaymentMethodType.stcPay:
        return LocalKeys.stc_payment_type.tr;
      case PaymentMethodType.amex:
        return LocalKeys.amex_payment_type.tr;
    }
  }

  getImgPath() {
    switch (this) {
      case PaymentMethodType.mada:
        return Res.madaPaymentMethod;
      case PaymentMethodType.visa:
        return Res.visaPaymentMethod;
      case PaymentMethodType.master:
        return Res.masterCardPaymentMethod;
      case PaymentMethodType.stcPay:
        return Res.stcPaymentMethod;
      case PaymentMethodType.amex:
        return Res.expressMethod;
    }
  }
}
