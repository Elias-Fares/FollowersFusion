import 'dart:convert';

import '../general_model.dart';

/// access_token : "3|oYvptRshUowzffRt8rffoGIBSVfxoubDAwX7iYuw"
/// expires_at : "2023-08-30T07:46:21.000000Z"
/// user_id : "99b6b882-28a4-49ff-9432-f6dcee6762f6"
/// user_name : "user2"

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel extends GeneralModel {
  AuthModel({
    this.accessToken,
    this.expiresAt,
    this.userId,
    this.userName,
    this.email,
  });

  AuthModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
    if (json['user_id'] != null) {
      userId = json['user_id'].toString();
    } else {
      userId = null;
    }
    userName = json['user_name'];
    email = json['email'];
  }

  String? accessToken;
  String? expiresAt;
  String? userId;
  String? userName;
  String? email;

  AuthModel copyWith({
    String? accessToken,
    String? expiresAt,
    String? userId,
    String? userName,
    String? email,
  }) =>
      AuthModel(
        accessToken: accessToken ?? this.accessToken,
        expiresAt: expiresAt ?? this.expiresAt,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
      );

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['expires_at'] = expiresAt;
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['email'] = email;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return AuthModel.fromJson(json);
  }
}
