import '../general_model.dart';

/// id : ""
/// name : ""
/// image : ""
/// price : ""
/// quantity : ""

class CartItemModel extends GeneralModel {
  CartItemModel({
      this.id, 
      this.name, 
      this.image, 
      this.price, 
      this.quantity,});

  CartItemModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
  }
  String? id;
  String? name;
  String? image;
  String? price;
  String? quantity;
CartItemModel copyWith({  String? id,
  String? name,
  String? image,
  String? price,
  String? quantity,
}) => CartItemModel(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
  price: price ?? this.price,
  quantity: quantity ?? this.quantity,
);
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }

  @override
  GeneralModel fromJson(json) {
    return CartItemModel.fromJson(json);
  }

}