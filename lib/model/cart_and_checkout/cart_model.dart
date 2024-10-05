
import '../general_model.dart';
import 'cart_item_model.dart';

/// subtotal : ""
/// discount : ""
/// tax : ""
/// items : [{}]
/// total : ""

class CartModel extends GeneralModel {
  CartModel({
    this.subtotal,
    this.discount,
    this.tax,
    this.items,
    this.total,
  });

  CartModel.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    discount = json['discount'];
    tax = json['tax'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(CartItemModel.fromJson(v));
      });
    }
    total = json['total'];
  }

  String? subtotal;
  String? discount;
  String? tax;
  List<CartItemModel>? items;
  String? total;

  CartModel copyWith({
    String? subtotal,
    String? discount,
    String? tax,
    List<CartItemModel>? items,
    String? total,
  }) =>
      CartModel(
        subtotal: subtotal ?? this.subtotal,
        discount: discount ?? this.discount,
        tax: tax ?? this.tax,
        items: items ?? this.items,
        total: total ?? this.total,
      );

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['discount'] = discount;
    map['tax'] = tax;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return CartModel.fromJson(json);
  }
}
