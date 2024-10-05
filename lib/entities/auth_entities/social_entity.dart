/// name : ""
/// email : ""
/// image : ""
/// phone : ""
/// social_account_id : ""
/// social_type : ""

class SocialEntity {
  SocialEntity({
      this.name, 
      this.email, 
      this.image, 
      this.phone, 
      this.socialAccountId, 
      this.socialType,});

  SocialEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    socialAccountId = json['social_account_id'];
    socialType = json['social_type'];
  }
  String? name;
  String? email;
  String? image;
  String? phone;
  String? socialAccountId;
  String? socialType;
SocialEntity copyWith({  String? name,
  String? email,
  String? image,
  String? phone,
  String? socialAccountId,
  String? socialType,
}) => SocialEntity(  name: name ?? this.name,
  email: email ?? this.email,
  image: image ?? this.image,
  phone: phone ?? this.phone,
  socialAccountId: socialAccountId ?? this.socialAccountId,
  socialType: socialType ?? this.socialType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['image'] = image;
    map['phone'] = phone;
    map['social_account_id'] = socialAccountId;
    map['social_type'] = socialType;
    return map;
  }

}