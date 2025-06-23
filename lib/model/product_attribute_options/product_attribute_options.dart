import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_attribute_options.freezed.dart';
part 'product_attribute_options.g.dart';


@freezed
class ProductAttributeOptions with _$ProductAttributeOptions {
  const factory ProductAttributeOptions({
    required String key,
    required String label,
}) = _ProductAttributeOptions;

  factory ProductAttributeOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeOptionsFromJson(json);
}
