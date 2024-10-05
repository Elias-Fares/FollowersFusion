
import '../general_model.dart';

/// category_id : 13
/// title : "T-shirts"
/// logo : ""
/// view_status : 1
/// level : 2
/// childs : [{"category_id":14,"parent_id":13,"title":"Basic Tees","logo":"","view_status":1,"level":3},{"category_id":15,"parent_id":13,"title":"Casual Long Sleeve Tees","logo":"","view_status":1,"level":3},{"category_id":16,"parent_id":13,"title":"Printed Tees","logo":"","view_status":1,"level":3}]

class CategoryModel extends GeneralModel {
  CategoryModel({
      this.categoryId, 
      this.title, 
      this.logo, 
      this.viewStatus, 
      this.level, 
      this.childs,});

  CategoryModel.fromJson(dynamic json) {
    categoryId = json['category_id'];
    title = json['title'];
    logo = json['logo'];
    viewStatus = json['view_status'];
    level = json['level'];
    if (json['childs'] != null) {
      childs = [];
      json['childs'].forEach((v) {
        childs?.add(CategoryModel.fromJson(v));
      });
    }
  }
  num? categoryId;
  String? title;
  String? logo;
  num? viewStatus;
  num? level;
  List<CategoryModel>? childs;
CategoryModel copyWith({  num? categoryId,
  String? title,
  String? logo,
  num? viewStatus,
  num? level,
  List<CategoryModel>? childs,
}) => CategoryModel(  categoryId: categoryId ?? this.categoryId,
  title: title ?? this.title,
  logo: logo ?? this.logo,
  viewStatus: viewStatus ?? this.viewStatus,
  level: level ?? this.level,
  childs: childs ?? this.childs,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['title'] = title;
    map['logo'] = logo;
    map['view_status'] = viewStatus;
    map['level'] = level;
    if (childs != null) {
      map['childs'] = childs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return CategoryModel.fromJson(json);
  }

}


/*
Child
 */
/// category_id : 14
/// parent_id : 13
/// title : "Basic Tees"
/// logo : ""
/// view_status : 1
/// level : 3

