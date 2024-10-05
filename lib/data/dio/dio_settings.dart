import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/constant.dart';
import '../../entities/base_entities/page_entity.dart';
import '../../entities/base_entities/paginate_req_entity.dart';
import '../../model/base_respons/base_respons_model.dart';
import '../../model/base_respons/page_model.dart';
import '../../model/custom_response.dart';
import '../../model/general_model.dart';
import '../../utlis/translation/translation.dart';
import 'dio_exception.dart';

class DioSetting {
  final Dio dioProject = Get.find(tag: PROJECT_API);
  final Dio dioGoogle = Get.find(tag: GOOGLE_API);

  final CookieJar cookieJar = CookieJar();
  final CookieJar cookieJarGoogle = CookieJar();

  DioSetting() {
    dioProject.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true));
    dioProject.interceptors.add(CookieManager(cookieJar));

    dioGoogle.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true));
    dioGoogle.interceptors.add(CookieManager(cookieJarGoogle));
  }

  Future<CustomResponse> get(
      {required String subUrl,
      String? token,
      String? url,
      bool needToken = false,
      Map<String, dynamic>? queryParameters}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.get(
          "${url ?? "${Constant.baseUrl}/api/v1/app"}/$subUrl",
          queryParameters: queryParameters);
      return CustomResponse(response.statusCode!, response.data, [""], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> getPagination<T extends GeneralModel>(
      {required String subUrl,
      String? token,
      String? url,
      required dynamic model,
      required PaginateReqEntity paginateReqEntity,
      bool needToken = false,
      Map<String, dynamic>? queryParameters}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.get(
          "${url ?? "${Constant.baseUrl}/api/v1/app"}/$subUrl",
          queryParameters: queryParameters);

      final baseResponse = baseResponseModelFromJson(response.data);
      if (baseResponse.status == null || !baseResponse.status!) {
        return CustomResponse(response.statusCode!, "",
            baseResponse.messages!.cast<String>(), false);
      }
      final pageData = PageModel.fromJson(baseResponse.data);
      final List<T> dataList = [];
      pageData.data?.forEach((orderModel) {
        dataList.add(model.fromJson(orderModel));
      });
      int totalPage =
          ((pageData.total ?? 10) / paginateReqEntity.perPage).ceil();
      var result = PageEntity<T>(data: dataList, totalPage: totalPage);

      return CustomResponse(response.statusCode!, result, [""], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> getV2<T extends GeneralModel>(
      {required String subUrl,
      String? token,
      String? url,
      required dynamic model,
      bool needToken = false,
      bool isListOfModel = false,
      Map<String, dynamic>? queryParameters}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.get(
          "${url ?? "${Constant.baseUrl}/api/v1/app"}/$subUrl",
          queryParameters: queryParameters);

      final baseResponse = baseResponseModelFromJson(response.data);
      if (baseResponse.status == null || !baseResponse.status!) {
        return CustomResponse(response.statusCode!, "",
            baseResponse.messages!.cast<String>(), false);
      }

      if (isListOfModel) {
        final List<T> dataList = [];
        baseResponse.data?.forEach((orderModel) {
          dataList.add(model.fromJson(orderModel));
        });
        return CustomResponse(response.statusCode!, dataList,
            baseResponse.messages!.cast<String>(), true);
      }

      final result = model.fromJson(baseResponse.data);
      return CustomResponse(response.statusCode!, result,
          baseResponse.messages!.cast<String>(), true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    }
  }

  Future<CustomResponse> post(
      {required String subUrl,
      dynamic data,
      String? token,
      String? url,
      bool needToken = false,
      Map<String, dynamic>? queryParameters}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.post(
          "${url ?? "${Constant.baseUrl}/api/v1/app"}/$subUrl",
          data: data,
          queryParameters: queryParameters);
      final baseResponse = baseResponseModelFromJson(response.data);
      return CustomResponse(response.statusCode!, response.data,
          baseResponse.messages!.cast<String>(), baseResponse.status!);
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).getCustomResponse();
      if (kDebugMode) {
        print(error);
      }
      return error;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> postV2<T>(
      {required String subUrl,
      dynamic data,
      String? token,
      String? url,
        dynamic model,
      bool isListOfModel = false,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.post(
          "${url ?? "${Constant.baseUrl}/api/v1/app"}/$subUrl",
          data: data,
          queryParameters: queryParameters);
      final baseResponse = baseResponseModelFromJson(response.data);


      if (model==null) {
        return CustomResponse(response.statusCode!, response.data,
            baseResponse.messages!.cast<String>(), baseResponse.status!);
      }

      if (isListOfModel) {
        final List<T> dataList = [];
        baseResponse.data?.forEach((orderModel) {
          dataList.add(model.fromJson(orderModel));
        });
        return CustomResponse(response.statusCode!, dataList,
            baseResponse.messages!.cast<String>(), true);
      }

      final result = model.fromJson(baseResponse.data);
      return CustomResponse(response.statusCode!, result,
          baseResponse.messages!.cast<String>(), true);
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).getCustomResponse();
      if (kDebugMode) {
        print(error);
      }
      return error;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> delete(
      {required String subUrl,
      dynamic data,
      String? token,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.delete("${Constant.baseUrl}/$subUrl",
          data: data, queryParameters: queryParameters);
      return CustomResponse(response.statusCode!, response.data, [""], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> put(
      {required String subUrl,
      dynamic data,
      String? token,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;
    try {
      var response = await dioProject.put("${Constant.baseUrl}/$subUrl",
          data: data, queryParameters: queryParameters);
      return CustomResponse(response.statusCode!, response, [""], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> getGoogle(
      {required String subUrl, Map<String, dynamic>? queryParameters}) async {
    try {
      var response =
          await dioGoogle.get(subUrl, queryParameters: queryParameters);
      return CustomResponse(response.statusCode!, response.data, [], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }

  Future<CustomResponse> postGoogle(
      {required String subUrl,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dioGoogle.post(subUrl,
          data: data, queryParameters: queryParameters);
      return CustomResponse(response.statusCode!, response.data, [], true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DioExceptions.fromDioError(e).getCustomResponse();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse(-1, [], ["server_error".tr], false);
    }
  }
}
