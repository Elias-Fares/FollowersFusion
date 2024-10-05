import 'dart:convert';

class BaseResponseModel {
  bool? status;
  List<dynamic>? messages;
  dynamic data;
  int? code;

  BaseResponseModel({this.status, this.messages, this.code, this.data});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messages = json['messages'];
    code = json['code'];

    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> baseResponseModelJson = <String, dynamic>{};
    baseResponseModelJson['status'] = status;
    baseResponseModelJson['messages'] = messages;
    baseResponseModelJson['code'] = code;
    baseResponseModelJson['data'] = data;
    return baseResponseModelJson;
  }
}

BaseResponseModel baseResponseModelFromJson(String str) =>
    BaseResponseModel.fromJson(json.decode(str));

String baseResponseModelToJson(BaseResponseModel data) => json.encode(data.toJson());
