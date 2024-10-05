import 'dart:convert';

import '../general_model.dart';

/// access_token : ""
/// expires_at : ""
/// user_id : 1
/// user_name : ""

RefreshTokenModel refreshTokenModelFromJson(String str) =>
    RefreshTokenModel.fromJson(json.decode(str));

String refreshTokenModelToJson(RefreshTokenModel data) =>
    json.encode(data.toJson());

class RefreshTokenModel extends GeneralModel{
  RefreshTokenModel({
    String? accessToken,
    String? expiresAt,
    String? userId,
    String? userName,
  }) {
    _accessToken = accessToken;
    _expiresAt = expiresAt;
    _userId = userId;
    _userName = userName;
  }

  RefreshTokenModel.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _expiresAt = json['expires_at'];
    _userId = json['user_id'];
    _userName = json['user_name'];
  }

  String? _accessToken;
  String? _expiresAt;
  String? _userId;
  String? _userName;

  RefreshTokenModel copyWith({
    String? accessToken,
    String? expiresAt,
    String? userId,
    String? userName,
  }) =>
      RefreshTokenModel(
        accessToken: accessToken ?? _accessToken,
        expiresAt: expiresAt ?? _expiresAt,
        userId: userId ?? _userId,
        userName: userName ?? _userName,
      );

  String? get accessToken => _accessToken;

  String? get expiresAt => _expiresAt;

  String? get userId => _userId;

  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['expires_at'] = _expiresAt;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return RefreshTokenModel.fromJson(json);
  }
}
