import '../general_model.dart';

/// id : ""
/// image : ""
/// title : ""
/// dsc : ""
/// date : ""

class NotificationModel extends GeneralModel{
  NotificationModel({
      this.id, 
      this.image, 
      this.title, 
      this.dsc, 
      this.date,});

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    dsc = json['dsc'];
    date = json['date'];
  }
  String? id;
  String? image;
  String? title;
  String? dsc;
  String? date;
NotificationModel copyWith({  String? id,
  String? image,
  String? title,
  String? dsc,
  String? date,
}) => NotificationModel(  id: id ?? this.id,
  image: image ?? this.image,
  title: title ?? this.title,
  dsc: dsc ?? this.dsc,
  date: date ?? this.date,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['title'] = title;
    map['dsc'] = dsc;
    map['date'] = date;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return NotificationModel.fromJson(json);
  }

}