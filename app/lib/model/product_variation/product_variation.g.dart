// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariationImpl _$$ProductVariationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariationImpl(
      id: (json['id'] as num).toInt(),
      attributes: json['attributes'] as Map<String, dynamic>,
      price: json['price'] as String,
      discountedPrice: json['discounted_price'] as String?,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ProductVariationImplToJson(
        _$ProductVariationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'price': instance.price,
      'discounted_price': instance.discountedPrice,
      'images': instance.images,
    };
