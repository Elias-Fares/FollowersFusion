import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/get_device_details.dart';
import '../../core/messages/show_errors_message.dart';
import '../../data/dio/server_exception.dart';
import '../../data/repository.dart';
import '../../utlis/translation/translation.dart';

class AppLangController extends GetxController {
  final Repository repository = Get.find();

  AppLangController();

  late String appLangCon;

  final RxString langValue = "".obs;
  final RxBool loadingButton = false.obs;

  Future<void> getInitLang() async {
    if (kDebugMode) {
      print(Get.deviceLocale);
      print("=================");
      print(Get.locale);
    }
    final langDevice =
        (Get.deviceLocale ?? AppLanguageKeys.en).toString().split("_")[0];
    if (kDebugMode) {
      print(langDevice);
    }
    appLangCon = (repository.getAppLanguage());
    if (appLangCon.isEmpty) {
      appLangCon = (langDevice.isNotEmpty ? langDevice : AppLanguageKeys.en);
    }

    AppLanguageKeys.appLang.value = appLangCon;
    Get.updateLocale(Locale(appLangCon));
    // update();
  }

  Future<void> changeLang() async {
    if (AppLanguageKeys.appLang.value == langValue.value) {
      return;
    }
    loadingButton.value = true;
    String oldLang = AppLanguageKeys.appLang.value;
    AppLanguageKeys.appLang.value = langValue.value;

    try {
      final deviceDetails = await getDeviceDetails();
      final deviceId = deviceDetails[2] ?? '';

      // await repository.changeAppLang(lang: langValue.value, deviceId: deviceId);

      repository.setAppLanguage(lang: langValue.value);

      Get.updateLocale(Locale(langValue.value));
      loadingButton.value = false;
       // Get.offAllNamed(SplashScreen.routeName);

    } on ServerException catch (e) {
      loadingButton.value = false;
      AppLanguageKeys.appLang.value = oldLang;
      showServerMessages(e.error);
    } catch (e) {
      loadingButton.value = false;
      AppLanguageKeys.appLang.value = oldLang;
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //update();
  }
}
