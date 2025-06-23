import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image.g.dart';

part 'product_image.freezed.dart';

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String url,
    required int isCover,
}) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
