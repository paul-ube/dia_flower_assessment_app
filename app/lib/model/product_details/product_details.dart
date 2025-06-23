import 'package:dia_flowers_assessment/model/product_attribute/product_attribute.dart';
import 'package:dia_flowers_assessment/model/product_image/product_image.dart';
import 'package:dia_flowers_assessment/model/product_variation/product_variation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details.freezed.dart';
part 'product_details.g.dart';

@freezed
class ProductDetails with _$ProductDetails {
  const factory ProductDetails({
    required final int id,
  required final String basePrice,
    final String? discountedPrice,
    required final double rating,
    required final double ratingCount,
    required final String name,
    required final String description,
    required List<ProductImage> images,
    required final List<ProductAttribute> attributes,
    required final List<ProductVariation> variations
}) = _ProductDetails;

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
}
