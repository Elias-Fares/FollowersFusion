import 'package:get/get.dart';

import '../../model/validator_models/password_validator_model.dart';
import '../../utlis/translation/local_keys.dart';
import '../widgets/style/color.dart';
import 'string_fun.dart';

class Validator {
  static String? emptyText(
      {required String? value,
      String validMessage = LocalKeys.field_required}) {
    if (value == null || value.trim().isEmpty) {
      return validMessage.tr;
    }
    return null;
  }

  static PasswordValidatorModel checkPassword(String value) {
    String password = value.trim();
    // RegExp numReg = RegExp(r".*[0-9].*");
    // RegExp letterReg = RegExp(r".*[A-Za-z].*");
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (password.isEmpty) {
      return PasswordValidatorModel(0, LocalKeys.plz_enter_valid_password);
    }
    // else if (password.length < 6) {
    //   return PasswordValidatorModel(
    //       1 / 4, LocalKeys.password_short, AppColors.red);
    // }
    else if (password.length < 8) {
      return PasswordValidatorModel(
          1 / 3, LocalKeys.password_acceptable_strong, AppColors.yellow);
    } else {
      if (!regExp.hasMatch(password)) {
        return PasswordValidatorModel(
            2 / 3, LocalKeys.password_good, AppColors.blue);
      } else {
        return PasswordValidatorModel(
            1, LocalKeys.password_strong, AppColors.lightGreen);
      }
    }
  }


  static String? validatePasswordForPasswordModel({required String value}) {
    if (!(value == LocalKeys.password_good || value ==
            LocalKeys.password_strong)) {
      return LocalKeys.validation_password_strong.tr;
    }
    return emptyText(value:value);
  }

  static String? numberValid(
      {required String value,
      String validMessage = LocalKeys.plz_enter_valid_number}) {
    if (!value.trim().isNum) {
      return validMessage.tr;
    }
    return null;
  }

  static String? phoneNumberValid(
      {required String? value,
      String validMessage = LocalKeys.plz_enter_valid_phone_number}) {
    if (value!=null) {
      String v = replaceArabicNumber(value);
      if (!v.trim().isPhoneNumber) {
        return validMessage.tr;
      }
      return null;
    }
    return validMessage.tr;

  }

  static String? emailValid(
      {required String? value,
      String validMessage = LocalKeys.plz_enter_valid_email}) {
    if (value == null || !value.trim().isEmail) {
      return validMessage.tr;
    }
    return null;
  }

  static String? matchPassword(
      {required String value1,
      required String value2,
      String validMessage = LocalKeys.password_not_match}) {
    if (value1.trim() != value2.trim() || value1.isEmpty || value2.isEmpty) {
      return validMessage.tr;
    }
    return null;
  }

  static String? customValidator(
      {required bool? condition,
      String validMessage = LocalKeys.field_required}) {
    if (condition ?? false) {
      return validMessage.tr;
    }
    return null;
  }
}
