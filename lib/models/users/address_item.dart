
import 'package:json_annotation/json_annotation.dart';

import '../users/geolocation_item.dart';

part 'address_item.g.dart';
@JsonSerializable(explicitToJson: true)
class AddressItem {
  @JsonKey(name: 'geolocation')
  GeolocationItem geolocation;

  @JsonKey(defaultValue: '', name: 'city')
  String city;

  @JsonKey(defaultValue: '', name: 'street')
  String street;

  @JsonKey(defaultValue: 0, name: 'number')
  int number;

  @JsonKey(defaultValue: '', name: 'zipcode')
  String zipcode;



  AddressItem({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode
  });

  factory AddressItem.fromJson(Map<String, dynamic> json) =>
      _$AddressItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddressItemToJson(this);
}