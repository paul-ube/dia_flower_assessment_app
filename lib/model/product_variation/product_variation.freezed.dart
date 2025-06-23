// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) {
  return _ProductVariation.fromJson(json);
}

/// @nodoc
mixin _$ProductVariation {
  int get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError; // original price
  String? get discountedPrice => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ProductVariation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariationCopyWith<ProductVariation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariationCopyWith<$Res> {
  factory $ProductVariationCopyWith(
          ProductVariation value, $Res Function(ProductVariation) then) =
      _$ProductVariationCopyWithImpl<$Res, ProductVariation>;
  @useResult
  $Res call(
      {int id,
      Map<String, dynamic> attributes,
      String price,
      String? discountedPrice,
      List<String> images});
}

/// @nodoc
class _$ProductVariationCopyWithImpl<$Res, $Val extends ProductVariation>
    implements $ProductVariationCopyWith<$Res> {
  _$ProductVariationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariationImplCopyWith<$Res>
    implements $ProductVariationCopyWith<$Res> {
  factory _$$ProductVariationImplCopyWith(_$ProductVariationImpl value,
          $Res Function(_$ProductVariationImpl) then) =
      __$$ProductVariationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Map<String, dynamic> attributes,
      String price,
      String? discountedPrice,
      List<String> images});
}

/// @nodoc
class __$$ProductVariationImplCopyWithImpl<$Res>
    extends _$ProductVariationCopyWithImpl<$Res, _$ProductVariationImpl>
    implements _$$ProductVariationImplCopyWith<$Res> {
  __$$ProductVariationImplCopyWithImpl(_$ProductVariationImpl _value,
      $Res Function(_$ProductVariationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? images = null,
  }) {
    return _then(_$ProductVariationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariationImpl implements _ProductVariation {
  const _$ProductVariationImpl(
      {required this.id,
      required final Map<String, dynamic> attributes,
      required this.price,
      this.discountedPrice,
      required final List<String> images})
      : _attributes = attributes,
        _images = images;

  factory _$ProductVariationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariationImplFromJson(json);

  @override
  final int id;
  final Map<String, dynamic> _attributes;
  @override
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final String price;
// original price
  @override
  final String? discountedPrice;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductVariation(id: $id, attributes: $attributes, price: $price, discountedPrice: $discountedPrice, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariationImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_attributes),
      price,
      discountedPrice,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of ProductVariation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariationImplCopyWith<_$ProductVariationImpl> get copyWith =>
      __$$ProductVariationImplCopyWithImpl<_$ProductVariationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariationImplToJson(
      this,
    );
  }
}

abstract class _ProductVariation implements ProductVariation {
  const factory _ProductVariation(
      {required final int id,
      required final Map<String, dynamic> attributes,
      required final String price,
      final String? discountedPrice,
      required final List<String> images}) = _$ProductVariationImpl;

  factory _ProductVariation.fromJson(Map<String, dynamic> json) =
      _$ProductVariationImpl.fromJson;

  @override
  int get id;
  @override
  Map<String, dynamic> get attributes;
  @override
  String get price; // original price
  @override
  String? get discountedPrice;
  @override
  List<String> get images;

  /// Create a copy of ProductVariation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariationImplCopyWith<_$ProductVariationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
