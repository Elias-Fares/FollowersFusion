/// name : ""
/// value : ""

class NameValueEntity {
  NameValueEntity({
      this.name, 
      this.value,});

  NameValueEntity.fromJson(dynamic json) {
    name = json['name'];
    value = json['value'];
  }
  String? name;
  String? value;
NameValueEntity copyWith({  String? name,
  String? value,
}) => NameValueEntity(  name: name ?? this.name,
  value: value ?? this.value,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    return map;
  }

}