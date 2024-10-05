
import 'package:get/get.dart' as getx;

import '../core/enums/params_type.dart';
import '../entities/base_entities/paginate_req_entity.dart';
import '../entities/profile/user_entity.dart';
import '../model/auth_models/auth_model.dart';
import '../model/cart_and_checkout/cart_item_model.dart';
import '../model/cart_and_checkout/cart_model.dart';
import '../model/custom_response.dart';
import '../entities/base_entities/paginate_req_entity.dart';
import '../model/category_model/category_model.dart';
import '../model/custom_response.dart';
import '../model/settings/user_model.dart';
import 'dio/dio_settings.dart';

class HttpHelper {
  DioSetting dioSetting = getx.Get.find();



  Future<CustomResponse> updateQuantityItemCart(
      {required String id, required int newQuantity}) async {
    final bodyData = {};
    final data = await dioSetting.postV2<CartItemModel>(
        subUrl: "", needToken: true, data: bodyData, model: CartItemModel());
    return data;
  }

  Future<CustomResponse> deleteItemCart({required String id}) async {
    final bodyData = {};
    final data =
        await dioSetting.postV2(subUrl: "", needToken: true, data: bodyData);
    return data;
  }





  Future<CustomResponse> login(
      {required String userName,required String password}) async {
    var mapData={
      "identifier":userName,
      "password":password
    };
    final data = await dioSetting.postV2<AuthModel>(
        subUrl: "auth/login",
        needToken: false,
        model: AuthModel(),
        data: mapData);
    return data;
  }

  Future<CustomResponse> loginSocial(
      {required String userName,required String accountId,

        String? image,String? phone,required String socialType,
        required String name
      }) async {
    var mapData={
      "name":name,
      "email":userName,
      "social_account_id":accountId,
      "social_type":socialType,
      "image":image??"",
      "phone":phone??""
    };
    final data = await dioSetting.postV2<AuthModel>(
        subUrl: "auth/social",
        needToken: false,
        model: AuthModel(),
        data: mapData);
    return data;
  }

  // Future<CustomResponse> refreshTokenUser({required String token}) async {
  //   try {
  //     final res = await dioSetting.post(
  //         subUrl: "auth/refreshToken", token: token, needToken: true);
  //
  //     if (res.success) {
  //       final data = baseResponseModelFromJson(res.object);
  //       final newToken = RefreshTokenModel.fromJson(data.data);
  //       if ((data.status ?? false) && newToken.accessToken != null) {
  //         return CustomResponse(res.statusCode, newToken, [], true);
  //       } else {
  //         throw ServerException(error: data.messages);
  //       }
  //     }
  //     return res;
  //   } on ServerException catch (e) {
  //     throw ServerException(error: e.error);
  //   }
  // }


  Future<CustomResponse> register(
      {required String userName,required String name,

        String? image,String? phone,required String password,
      }) async {
    var mapData={
      "name":name,
      "email":userName,
      "password":password,
      "image":image??"",
      "phone":phone??""
    };
    final data = await dioSetting.postV2<AuthModel>(
        subUrl: "auth/register",
        needToken: false,
        model: AuthModel(),
        data: mapData);
    return data;
  }



}
