import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/constant.dart';

class GetStorageHelper extends GetxController{

  final box = GetStorage("MyPref");

  //for save&get token
  void saveToken(String token) {
    if (kDebugMode) {
      print("my token $token");
    }
    box.write(Constant.ACCESS_TOKEN, token);
  }

  String getToken() {
    return box.read(Constant.ACCESS_TOKEN) ?? "";
  }

  // for save&get app lang
  void setAppLanguage(String value)  {
    box.write(Constant.APP_LANGUAGE, value);
  }

  String getAppLanguage() {
    return box.read(Constant.APP_LANGUAGE) ?? "";
  }


  void setIsFirstOpen(bool value)  {
    box.write(Constant.FIRST_OPEN, value);
  }

  bool getIsFirstOpen() {
    return (box.read<bool>(Constant.FIRST_OPEN))??false;
  }

  void saveUserId({required String id}){
    box.write(Constant.APP_LANGUAGE, id);
  }

}