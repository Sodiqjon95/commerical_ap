// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductsItem _$CartProductsItemFromJson(Map<String, dynamic> json) =>
    CartProductsItem(
      productId: json['productId'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$CartProductsItemToJson(CartProductsItem instance) =>
    <String, dynamic>{

      'productId': instance.productId,
      'quantity': instance.quantity,
    };
