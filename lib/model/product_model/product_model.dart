

import '../brand_model/brand_model.dart';
import '../category_model/category_model.dart';
import '../general_model.dart';

/// title : "Cozy Comfort Sweater"
/// desc : "Experience the ultimate in warmth and style with our Cozy Comfort Sweater.\n                            This stylish and versatile sweater is designed for comfort, featuring a soft blend of high-quality materials that keep you cozy on chilly days.\n                            The timeless design makes it a perfect addition to any wardrobe, whether you're heading to the office or relaxing at home.\n                            Experience the ultimate in warmth and style with our Cozy Comfort Sweater. This stylish and versatile sweater is designed for comfort,\n                            featuring a soft blend of high-quality materials that keep you cozy on chilly days. The timeless design makes it a perfect addition to any wardrobe,\n                            whether you're heading to the office or relaxing at home.\n                            The timeless design makes it a perfect addition to any wardrobe, whether you're heading to the office or relaxing at home."
/// origin_price : "69.99"
/// has_offer : 1
/// final_price : "49.99"
/// sold_count : 4
/// media_path : "/storage/Products/p1.png"
/// mime_type : "image"
/// original_extension : "png"
/// media_size : "70"
/// image_alt : "Cozy Comfort Sweater"
/// brand_id : 6
/// category_id : 14
/// store_id : 6
/// brand : {"id":6,"logo":"/storage/Brands/brand (5).png","name":"BOSS","view_status":1}
/// category : {"category_id":14,"parent_id":13,"title":"Basic Tees","logo":"","view_status":1,"level":3}
/// store : null

class ProductModel extends GeneralModel {
  ProductModel({
      this.title, 
      this.desc, 
      this.originPrice, 
      this.hasOffer, 
      this.finalPrice, 
      this.soldCount, 
      this.mediaPath, 
      this.mimeType, 
      this.originalExtension, 
      this.mediaSize, 
      this.imageAlt, 
      this.brandId, 
      this.categoryId, 
      this.storeId, 
      this.brand, 
      this.category, 
      this.store,});

  ProductModel.fromJson(dynamic json) {
    title = json['title'];
    desc = json['desc'];
    originPrice = json['origin_price'];
    hasOffer = json['has_offer'];
    finalPrice = json['final_price'];
    soldCount = json['sold_count'];
    mediaPath = json['media_path'];
    mimeType = json['mime_type'];
    originalExtension = json['original_extension'];
    mediaSize = json['media_size'];
    imageAlt = json['image_alt'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    storeId = json['store_id'];
    brand = json['brand'] != null ? BrandModel.fromJson(json['brand']) : null;
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    store = json['store'];
  }
  String? title;
  String? desc;
  String? originPrice;
  num? hasOffer;
  String? finalPrice;
  num? soldCount;
  String? mediaPath;
  String? mimeType;
  String? originalExtension;
  String? mediaSize;
  String? imageAlt;
  num? brandId;
  num? categoryId;
  num? storeId;
  BrandModel? brand;
  CategoryModel? category;
  dynamic store;
ProductModel copyWith({  String? title,
  String? desc,
  String? originPrice,
  num? hasOffer,
  String? finalPrice,
  num? soldCount,
  String? mediaPath,
  String? mimeType,
  String? originalExtension,
  String? mediaSize,
  String? imageAlt,
  num? brandId,
  num? categoryId,
  num? storeId,
  BrandModel? brand,
  CategoryModel? category,
  dynamic store,
}) => ProductModel(  title: title ?? this.title,
  desc: desc ?? this.desc,
  originPrice: originPrice ?? this.originPrice,
  hasOffer: hasOffer ?? this.hasOffer,
  finalPrice: finalPrice ?? this.finalPrice,
  soldCount: soldCount ?? this.soldCount,
  mediaPath: mediaPath ?? this.mediaPath,
  mimeType: mimeType ?? this.mimeType,
  originalExtension: originalExtension ?? this.originalExtension,
  mediaSize: mediaSize ?? this.mediaSize,
  imageAlt: imageAlt ?? this.imageAlt,
  brandId: brandId ?? this.brandId,
  categoryId: categoryId ?? this.categoryId,
  storeId: storeId ?? this.storeId,
  brand: brand ?? this.brand,
  category: category ?? this.category,
  store: store ?? this.store,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['desc'] = desc;
    map['origin_price'] = originPrice;
    map['has_offer'] = hasOffer;
    map['final_price'] = finalPrice;
    map['sold_count'] = soldCount;
    map['media_path'] = mediaPath;
    map['mime_type'] = mimeType;
    map['original_extension'] = originalExtension;
    map['media_size'] = mediaSize;
    map['image_alt'] = imageAlt;
    map['brand_id'] = brandId;
    map['category_id'] = categoryId;
    map['store_id'] = storeId;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['store'] = store;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
   return ProductModel.fromJson(json);
  }

}

/// category_id : 14
/// parent_id : 13
/// title : "Basic Tees"
/// logo : ""
/// view_status : 1
/// level : 3

// class Category {
//   Category({
//       this.categoryId,
//       this.parentId,
//       this.title,
//       this.logo,
//       this.viewStatus,
//       this.level,});
//
//   Category.fromJson(dynamic json) {
//     categoryId = json['category_id'];
//     parentId = json['parent_id'];
//     title = json['title'];
//     logo = json['logo'];
//     viewStatus = json['view_status'];
//     level = json['level'];
//   }
//   num? categoryId;
//   num? parentId;
//   String? title;
//   String? logo;
//   num? viewStatus;
//   num? level;
// Category copyWith({  num? categoryId,
//   num? parentId,
//   String? title,
//   String? logo,
//   num? viewStatus,
//   num? level,
// }) => Category(  categoryId: categoryId ?? this.categoryId,
//   parentId: parentId ?? this.parentId,
//   title: title ?? this.title,
//   logo: logo ?? this.logo,
//   viewStatus: viewStatus ?? this.viewStatus,
//   level: level ?? this.level,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['category_id'] = categoryId;
//     map['parent_id'] = parentId;
//     map['title'] = title;
//     map['logo'] = logo;
//     map['view_status'] = viewStatus;
//     map['level'] = level;
//     return map;
//   }
//
// }

/// id : 6
/// logo : "/storage/Brands/brand (5).png"
/// name : "BOSS"
/// view_status : 1

// class Brand {
//   Brand({
//       this.id,
//       this.logo,
//       this.name,
//       this.viewStatus,});
//
//   Brand.fromJson(dynamic json) {
//     id = json['id'];
//     logo = json['logo'];
//     name = json['name'];
//     viewStatus = json['view_status'];
//   }
//   num? id;
//   String? logo;
//   String? name;
//   num? viewStatus;
// Brand copyWith({  num? id,
//   String? logo,
//   String? name,
//   num? viewStatus,
// }) => Brand(  id: id ?? this.id,
//   logo: logo ?? this.logo,
//   name: name ?? this.name,
//   viewStatus: viewStatus ?? this.viewStatus,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['logo'] = logo;
//     map['name'] = name;
//     map['view_status'] = viewStatus;
//     return map;
//   }
//
// }