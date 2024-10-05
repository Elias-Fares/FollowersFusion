import 'dart:convert';

import 'package:dio/dio.dart';



/// name : ""
/// email : ""
/// phone : ""
/// gender : ""
/// password : ""

RegisterEntity registerEntityFromJson(String str) => RegisterEntity.fromJson(json.decode(str));
String registerEntityToJson(RegisterEntity data) => json.encode(data.toJson());
class RegisterEntity {
  RegisterEntity({
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.countryCode,
      this.image="",
      this.password,});

  RegisterEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    password = json['password'];
    countryCode = json['country_code'];
    image = json['image'];
  }
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? password;
  String? countryCode;
  String? image;
RegisterEntity copyWith({  String? name,
  String? email,
  String? phone,
  String? gender,
  String? password,
  String? countryCode,
  String? image,
}) => RegisterEntity(  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  gender: gender ?? this.gender,
  password: password ?? this.password,
  countryCode: countryCode ?? this.countryCode,
  image: image ?? this.image,
);
  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['password'] = password;
    map['country_code'] = countryCode;
    if (image != null && image!.isNotEmpty) {
      String fileName = image!.split('/').last;
      map ['image']= await MultipartFile.fromFile(image!, filename: fileName);}
    return map;
  }


}