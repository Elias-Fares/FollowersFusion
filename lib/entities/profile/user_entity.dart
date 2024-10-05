/// name : ""
/// email : ""
/// phone : ""
/// gender : ""
/// birthday : ""

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.birthday,});

  UserEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    birthday = json['birthday'];
  }
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? birthday;
UserEntity copyWith({  String? name,
  String? email,
  String? phone,
  String? gender,
  String? birthday,
}) => UserEntity(  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  gender: gender ?? this.gender,
  birthday: birthday ?? this.birthday,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['birthday'] = birthday;
    return map;
  }

}