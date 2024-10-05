
import '../general_model.dart';

/// name : "BOSS"
/// logo : "/storage/Brands/brand (5).png"

class BrandModel extends GeneralModel {
  BrandModel({
      this.name, 
      this.logo,});

  BrandModel.fromJson(dynamic json) {
    name = json['name'];
    logo = json['logo'];
  }
  String? name;
  String? logo;
BrandModel copyWith({  String? name,
  String? logo,
}) => BrandModel(  name: name ?? this.name,
  logo: logo ?? this.logo,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['logo'] = logo;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
     return BrandModel.fromJson(json);
  }

}