
import '../general_model.dart';

/// media_path : "/storage/HomeAds/Banner.png"
/// mime_type : null
/// original_extension : null
/// media_size : null
/// title : "Sale"
/// desc : "50%"
/// ad_id : 1
/// view_status : 1

class AddsModel extends GeneralModel {
  AddsModel({
      this.mediaPath, 
      this.mimeType, 
      this.originalExtension, 
      this.mediaSize, 
      this.title, 
      this.desc, 
      this.adId, 
      this.viewStatus,});

  AddsModel.fromJson(dynamic json) {
    mediaPath = json['media_path'];
    mimeType = json['mime_type'];
    originalExtension = json['original_extension'];
    mediaSize = json['media_size'];
    title = json['title'];
    desc = json['desc'];
    adId = json['ad_id'];
    viewStatus = json['view_status'];
  }
  String? mediaPath;
  dynamic mimeType;
  dynamic originalExtension;
  dynamic mediaSize;
  String? title;
  String? desc;
  num? adId;
  num? viewStatus;
AddsModel copyWith({  String? mediaPath,
  dynamic mimeType,
  dynamic originalExtension,
  dynamic mediaSize,
  String? title,
  String? desc,
  num? adId,
  num? viewStatus,
}) => AddsModel(  mediaPath: mediaPath ?? this.mediaPath,
  mimeType: mimeType ?? this.mimeType,
  originalExtension: originalExtension ?? this.originalExtension,
  mediaSize: mediaSize ?? this.mediaSize,
  title: title ?? this.title,
  desc: desc ?? this.desc,
  adId: adId ?? this.adId,
  viewStatus: viewStatus ?? this.viewStatus,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['media_path'] = mediaPath;
    map['mime_type'] = mimeType;
    map['original_extension'] = originalExtension;
    map['media_size'] = mediaSize;
    map['title'] = title;
    map['desc'] = desc;
    map['ad_id'] = adId;
    map['view_status'] = viewStatus;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return AddsModel.fromJson(json);
  }

}