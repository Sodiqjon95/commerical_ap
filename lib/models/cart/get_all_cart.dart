import 'package:json_annotation/json_annotation.dart';
import 'cart_products.dart';

part 'get_all_cart.g.dart';

@JsonSerializable()
class CartItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'userId')
  int userId;

  @JsonKey(defaultValue: '', name: 'date')
  String date;

//Qarang bu yerda  CartProductItem listda keladi

  @JsonKey(defaultValue: [], name: 'products')
  List<CartProductsItem> products;

  @JsonKey(defaultValue: 0, name: '__v')
  int v;

  CartItem({
    required this.id,
    required this.userId,
    required this.products,
    required this.date,
    required this.v,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  String toString() => '''
      id:$id,
      userId: $userId,
      data: $date,
      products: $products,
      v:$v
  ''';
}

// flutter packages pub run build_runner build --delete-conflicting-outputs  sexirli kamanda ))
