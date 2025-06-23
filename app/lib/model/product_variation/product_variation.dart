import 'package:dia_flowers_assessment/model/product_attribute/product_attribute.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_variation.g.dart';

part 'product_variation.freezed.dart';

@freezed
class ProductVariation with _$ProductVariation {
  const factory ProductVariation({
    required int id,
    required final Map<String, dynamic> attributes,
    required final String price, // original price
    final String? discountedPrice,
    required final List<String> images,
  }) = _ProductVariation;

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationFromJson(json);
}
