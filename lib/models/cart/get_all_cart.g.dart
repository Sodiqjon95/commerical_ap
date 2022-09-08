// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => CartProductsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      date: json['date'] as String? ?? '',
      v: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'products': instance.products,
      '__v': instance.v,
    };
