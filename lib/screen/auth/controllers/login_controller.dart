

import 'package:flutter/foundation.dart';
import 'package:followers/screen/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app/controller/app_lang_controller.dart';
import '../../../core/constant.dart';
import '../../../core/messages/show_snack_bar_message.dart';
import '../../../data/repository.dart';
import '../welcome_screen.dart';

class LoginController extends GetxController{
  final Repository _repository = Get.find();
  final AppLangController _appLangController = Get.find();

  var isLoading=false.obs;



  Future<void>loginRQ({required String userName,required String password})async{
    isLoading.value=true;

    var response=await _repository.login(userName: userName, password: password);
    if(response.success){

      showSnackBarMessage(message: "success");
     // Get.to(()=>const MainScreen());

    }else{
      showSnackBarMessage(message: response.msg.elementAt(0));

    }
    isLoading.value=false;



  }

  Future<void> initSettings() async {
    try {
      await GetStorage.init("MyPref");
      await _appLangController.getInitLang();
      // await _repository.getBaseUrl();

      // Get.offAndToNamed(MainScreen.routName);
      final bool isFirstOpen = _repository.getIsFirstOpen();
      if (!isFirstOpen) {
        Get.offAndToNamed(LoginScreen.routeName);
        return;
      }
      if (Constant.baseUrl.isNotEmpty) {
        final String token=_repository.getToken();
        // await _repository.refreshTokenUser();
        _repository.saveToken(token: token);

        showSnackBarMessage(message: "success");

      }
    } catch (e) {
      if (kDebugMode) print(e);

      showSnackBarMessage(message: e.toString());
     // Get.offAndToNamed(MainScreen.routeName);
    }
  }

  Future<void> setIsFirstOpen({required bool value}) async {
    _repository.setIsFirstOpen(value: value);
    if (kDebugMode) {
      print(_repository.getIsFirstOpen());
    }
  }
}