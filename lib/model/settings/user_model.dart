import '../general_model.dart';

/// account_type : "user"
/// name : "user user"
/// email : "user2@gmail.com"
/// phone : "+966454545445"
/// image : ""
/// gender : "male"

class UserModel extends GeneralModel{
  UserModel({
      this.accountType, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.gender,});

  UserModel.fromJson(dynamic json) {
    accountType = json['account_type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    gender = json['gender'];
  }
  String? accountType;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? gender;
UserModel copyWith({  String? accountType,
  String? name,
  String? email,
  String? phone,
  String? image,
  String? gender,
}) => UserModel(  accountType: accountType ?? this.accountType,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  image: image ?? this.image,
  gender: gender ?? this.gender,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_type'] = accountType;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['gender'] = gender;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return UserModel.fromJson(json);
  }

}