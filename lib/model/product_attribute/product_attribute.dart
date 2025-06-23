import 'package:dia_flowers_assessment/model/product_attribute_options/product_attribute_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_attribute.g.dart';

part 'product_attribute.freezed.dart';

@freezed
class ProductAttribute with _$ProductAttribute {
  const factory ProductAttribute({
    required final String key,
    required final String label,
    required final List<ProductAttributeOptions> options,
  }) = _ProductAttribute;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeFromJson(json);
}
