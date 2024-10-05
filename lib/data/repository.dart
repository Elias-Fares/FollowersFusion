import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/constant.dart';

import '../entities/base_entities/paginate_req_entity.dart';
import '../entities/profile/user_entity.dart';
import '../model/custom_response.dart';
import '../core/enums/params_type.dart';
import '../entities/base_entities/paginate_req_entity.dart';
import '../model/custom_response.dart';
import 'get_storage_helper.dart';
import 'http_helper.dart';

class Repository {
  final HttpHelper _httpHelper = Get.find();
  final GetStorageHelper _getStorageHelper = Get.find();

  Repository();

  // Function in prefs
  void saveToken({required String token}) {
    _getStorageHelper.saveToken(token);
    LocalStaticVar.token = token;
  }

  String getToken() {
    return (_getStorageHelper.getToken());
  }

  void setAppLanguage({required String lang}) {
    _getStorageHelper.setAppLanguage(lang);
  }

  String getAppLanguage() {
    final lang = _getStorageHelper.getAppLanguage();
    return lang;
  }

  void setIsFirstOpen({required bool value}) {
    _getStorageHelper.setIsFirstOpen(value);
  }

  bool getIsFirstOpen() {
    final value = _getStorageHelper.getIsFirstOpen();
    return value;
  }

  Future<void> logoutPref() async {
    saveToken(token: '');
    LocalStaticVar.userId = "";
    LocalStaticVar.userName = "";
    LocalStaticVar.token = "";
  }

  Future<CustomResponse> login(
      {required String userName,required String password}) async {

   var data=await _httpHelper.login(userName: userName, password: password);
   return data;

  }

  Future<CustomResponse> loginSocial(
      {required String userName,required String accountId,
        String? image,String? phone,required String socialType,
        required String name
      })async{
    var data=await _httpHelper.loginSocial(userName: userName, accountId: accountId, socialType: socialType, name: name,
    image: image,phone: phone);
    return data;
  }


  Future<CustomResponse> register(
      {required String userName,required String name,

        String? image,String? phone,required String password,
      }) async {


    var data=await _httpHelper.register(
        userName: userName,
        name: name,
        password: password,
    phone: phone,image: image);

    return data;

  }





}
