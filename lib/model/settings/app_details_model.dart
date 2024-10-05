
import '../general_model.dart';

/// id : 1
/// logo : "/storage/AppSetting/logo.png"
/// name : "E-Commerce App"
/// email : "info@email.com"
/// phone : "info@email.com"
/// desc : ""

class AppDetailsModel extends GeneralModel {
  AppDetailsModel({
      this.id, 
      this.logo, 
      this.name, 
      this.email, 
      this.phone, 
      this.desc,});

  AppDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    desc = json['desc'];
  }
  num? id;
  String? logo;
  String? name;
  String? email;
  String? phone;
  String? desc;
AppDetailsModel copyWith({  num? id,
  String? logo,
  String? name,
  String? email,
  String? phone,
  String? desc,
}) => AppDetailsModel(  id: id ?? this.id,
  logo: logo ?? this.logo,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  desc: desc ?? this.desc,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo'] = logo;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['desc'] = desc;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return AppDetailsModel.fromJson(json);
  }

}