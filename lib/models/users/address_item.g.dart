// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressItem _$AddressItemFromJson(Map<String, dynamic> json) => AddressItem(
      geolocation:
          GeolocationItem.fromJson(json['geolocation'] as Map<String, dynamic>),
      city: json['city'] as String? ?? '',
      street: json['street'] as String? ?? '',
      number: json['number'] as int? ?? 0,
      zipcode: json['zipcode'] as String? ?? '',
    );

Map<String, dynamic> _$AddressItemToJson(AddressItem instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation.toJson(),
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };
