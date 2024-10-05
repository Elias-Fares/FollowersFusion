import 'dart:convert';

class BaseUrlModel {
  String? url;
  String? mediaUrl;

  BaseUrlModel({this.url});

  BaseUrlModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    mediaUrl = json['media_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['media_url'] = mediaUrl;
    return data;
  }
}

BaseUrlModel baseUrlModelFromJson(String str) =>
    BaseUrlModel.fromJson(json.decode(str));

String baseUrlModelToJson(BaseUrlModel data) => json.encode(data.toJson());
