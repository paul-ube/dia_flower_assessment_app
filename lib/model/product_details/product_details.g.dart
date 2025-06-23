// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailsImpl _$$ProductDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ProductDetailsImpl(
      id: (json['id'] as num).toInt(),
      basePrice: json['base_price'] as String,
      discountedPrice: json['discounted_price'] as String?,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toDouble(),
      name: json['name'] as String,
      description: json['description'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      variations: (json['variations'] as List<dynamic>)
          .map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductDetailsImplToJson(
        _$ProductDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_price': instance.basePrice,
      'discounted_price': instance.discountedPrice,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'attributes': instance.attributes,
      'variations': instance.variations,
    };
