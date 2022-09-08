import 'package:json_annotation/json_annotation.dart';

part 'cart_products.g.dart';


// "productId": 3,
// "quantity": 6
// }



@JsonSerializable(explicitToJson: true)
class CartProductsItem {
  @JsonKey(defaultValue: 0, name: 'productId')
  int productId;

  @JsonKey(defaultValue: 0, name: 'quantity')
  int quantity;

  CartProductsItem({
    required this.productId,
    required this.quantity,
  });

  factory CartProductsItem.fromJson(Map<String, dynamic> json) =>
      _$CartProductsItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductsItemToJson(this);
}