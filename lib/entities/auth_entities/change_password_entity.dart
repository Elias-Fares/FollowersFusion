import 'dart:convert';

/// old_password : ""
/// new_password : ""
/// c_password : ""

ChangePasswordEntity changePasswordEntityFromJson(String str) => ChangePasswordEntity.fromJson(json.decode(str));
String changePasswordEntityToJson(ChangePasswordEntity data) => json.encode(data.toJson());
class ChangePasswordEntity {
  ChangePasswordEntity({
      this.oldPassword, 
      this.newPassword, 
      this.cPassword,});

  ChangePasswordEntity.fromJson(dynamic json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
    cPassword = json['c_password'];
  }
  String? oldPassword;
  String? newPassword;
  String? cPassword;
ChangePasswordEntity copyWith({  String? oldPassword,
  String? newPassword,
  String? cPassword,
}) => ChangePasswordEntity(  oldPassword: oldPassword ?? this.oldPassword,
  newPassword: newPassword ?? this.newPassword,
  cPassword: cPassword ?? this.cPassword,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['old_password'] = oldPassword;
    map['new_password'] = newPassword;
    map['c_password'] = cPassword;
    return map;
  }

}