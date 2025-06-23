import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required final int id,
    required final String name,
    required final String description,
    required final String basePrice, // original price, make it string to avoid rounding issues
    final String? discountedPrice,
    required final double rating,
    required final int ratingCount,
    required String coverImage,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
