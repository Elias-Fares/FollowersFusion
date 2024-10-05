import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/custom_response.dart';
import '../../model/error_response/error_response.dart';

class DioExceptions implements Exception {
  late List<String> message;
  late int code;
  late CustomResponse customResponse;

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      message =
          _handleError(dioError.response!.statusCode!, dioError.response!.data);
      code = dioError.response!.statusCode!;
      customResponse = CustomResponse(code, null, message, false);
      return;
    }

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = ["Request to API server was cancelled"];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;
      case DioExceptionType.connectionTimeout:
        message = ["Connection timeout with API server"];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;
      case DioExceptionType.unknown:
        message = [
          "Connection to API server failed due to internet connection"
        ];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;
      case DioExceptionType.receiveTimeout:
        message = ["Receive timeout in connection with API server"];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;

      case DioExceptionType.sendTimeout:
        message = ["Send timeout in connection with API server"];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;
      default:
        message = ["Something went wrong"];
        code = -10;
        customResponse = CustomResponse(code, null, message, false);
        break;
    }
  }

  List<String> _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        final ErrorResponse errorResponse =
            ErrorResponse.fromJson(json.decode(error));

        if (errorResponse.messages != null &&
            errorResponse.messages!.isNotEmpty) {
          final List<String> message = [];
          errorResponse.messages?.forEach((element) {
            if (element != null) {
              message.add(element.toString());
            }
          });
          return message;
        } else if (errorResponse.message != null &&
            errorResponse.message!.isNotEmpty) {
          final List<String> message = [
            (errorResponse.message ?? "").toString()
          ];
          return message;
        }
        return [""];

      case 403:
        final ErrorResponse errorResponse =
            ErrorResponse.fromJson(json.decode(error));

        if (errorResponse.messages != null &&
            errorResponse.messages!.isNotEmpty) {
          final List<String> message = [];
          errorResponse.messages?.forEach((element) {
            if (element != null) {
              message.add(element.toString());
            }
          });
          return message;
        } else if (errorResponse.message != null &&
            errorResponse.message!.isNotEmpty) {
          final List<String> message = [
            (errorResponse.message ?? "").toString()
          ];
          return message;
        }
        return [""];
      case 404:
        return ["not found"];
      case 401:
        final ErrorResponse errorResponse =
            ErrorResponse.fromJson(json.decode(error));

        if (errorResponse.messages != null &&
            errorResponse.messages!.isNotEmpty) {
          final List<String> message = [];
          errorResponse.messages?.forEach((element) {
            if (element != null) {
              message.add(element.toString());
            }
          });
          return message;
        } else if (errorResponse.message != null &&
            errorResponse.message!.isNotEmpty) {
          final List<String> message = [
            (errorResponse.message ?? "").toString()
          ];
          return message;
        }
        return [""];

      case 422:
        final ErrorResponse errorResponse =
            ErrorResponse.fromJson(json.decode(error));
        if (errorResponse.messages != null &&
            errorResponse.messages!.isNotEmpty) {
          final List<String> message = [
            (errorResponse.message ?? "").toString()
          ];
          return message;
        } else if (errorResponse.message != null &&
            errorResponse.message!.isNotEmpty) {
          final List<String> message = [
            (errorResponse.message ?? "").toString()
          ];
          return message;
        }
        return [""];
      case 500:
        return ['Internal server error'];
      default:
        return ['Oops something went wrong'];
    }
  }

  @override
  String toString() => message.elementAt(0);

  CustomResponse getCustomResponse() =>
      CustomResponse(code, null, message, false);
}
