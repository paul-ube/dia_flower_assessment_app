// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_attribute_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductAttributeOptions _$ProductAttributeOptionsFromJson(
    Map<String, dynamic> json) {
  return _ProductAttributeOptions.fromJson(json);
}

/// @nodoc
mixin _$ProductAttributeOptions {
  String get key => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this ProductAttributeOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAttributeOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAttributeOptionsCopyWith<ProductAttributeOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAttributeOptionsCopyWith<$Res> {
  factory $ProductAttributeOptionsCopyWith(ProductAttributeOptions value,
          $Res Function(ProductAttributeOptions) then) =
      _$ProductAttributeOptionsCopyWithImpl<$Res, ProductAttributeOptions>;
  @useResult
  $Res call({String key, String label});
}

/// @nodoc
class _$ProductAttributeOptionsCopyWithImpl<$Res,
        $Val extends ProductAttributeOptions>
    implements $ProductAttributeOptionsCopyWith<$Res> {
  _$ProductAttributeOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAttributeOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAttributeOptionsImplCopyWith<$Res>
    implements $ProductAttributeOptionsCopyWith<$Res> {
  factory _$$ProductAttributeOptionsImplCopyWith(
          _$ProductAttributeOptionsImpl value,
          $Res Function(_$ProductAttributeOptionsImpl) then) =
      __$$ProductAttributeOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String label});
}

/// @nodoc
class __$$ProductAttributeOptionsImplCopyWithImpl<$Res>
    extends _$ProductAttributeOptionsCopyWithImpl<$Res,
        _$ProductAttributeOptionsImpl>
    implements _$$ProductAttributeOptionsImplCopyWith<$Res> {
  __$$ProductAttributeOptionsImplCopyWithImpl(
      _$ProductAttributeOptionsImpl _value,
      $Res Function(_$ProductAttributeOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductAttributeOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
  }) {
    return _then(_$ProductAttributeOptionsImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAttributeOptionsImpl implements _ProductAttributeOptions {
  const _$ProductAttributeOptionsImpl({required this.key, required this.label});

  factory _$ProductAttributeOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAttributeOptionsImplFromJson(json);

  @override
  final String key;
  @override
  final String label;

  @override
  String toString() {
    return 'ProductAttributeOptions(key: $key, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAttributeOptionsImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, label);

  /// Create a copy of ProductAttributeOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAttributeOptionsImplCopyWith<_$ProductAttributeOptionsImpl>
      get copyWith => __$$ProductAttributeOptionsImplCopyWithImpl<
          _$ProductAttributeOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAttributeOptionsImplToJson(
      this,
    );
  }
}

abstract class _ProductAttributeOptions implements ProductAttributeOptions {
  const factory _ProductAttributeOptions(
      {required final String key,
      required final String label}) = _$ProductAttributeOptionsImpl;

  factory _ProductAttributeOptions.fromJson(Map<String, dynamic> json) =
      _$ProductAttributeOptionsImpl.fromJson;

  @override
  String get key;
  @override
  String get label;

  /// Create a copy of ProductAttributeOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAttributeOptionsImplCopyWith<_$ProductAttributeOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
