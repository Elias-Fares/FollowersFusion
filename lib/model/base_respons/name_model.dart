import 'dart:convert';



NameModel nameModelFromJson(String str) => NameModel.fromJson(json.decode(str));
String nameModelToJson(NameModel data) => json.encode(data.toJson());
class NameModel {
  NameModel({
      this.id, 
      this.name,});

  NameModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
NameModel copyWith({  int? id,
  String? name,
}) => NameModel(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}