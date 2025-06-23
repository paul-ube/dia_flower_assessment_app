// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      basePrice: json['base_price'] as String,
      discountedPrice: json['discounted_price'] as String?,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toInt(),
      coverImage: json['cover_image'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'base_price': instance.basePrice,
      'discounted_price': instance.discountedPrice,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'cover_image': instance.coverImage,
    };
