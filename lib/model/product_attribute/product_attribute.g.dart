// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductAttributeImpl _$$ProductAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductAttributeImpl(
      key: json['key'] as String,
      label: json['label'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) =>
              ProductAttributeOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductAttributeImplToJson(
        _$ProductAttributeImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'options': instance.options,
    };
