// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DishEntity _$DishEntityFromJson(Map<String, dynamic> json) {
  return _DishEntity.fromJson(json);
}

/// @nodoc
mixin _$DishEntity {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String? get decription => throw _privateConstructorUsedError;
  List<String>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishEntityCopyWith<DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishEntityCopyWith<$Res> {
  factory $DishEntityCopyWith(
          DishEntity value, $Res Function(DishEntity) then) =
      _$DishEntityCopyWithImpl<$Res, DishEntity>;
  @useResult
  $Res call(
      {String name,
      String url,
      num price,
      String? decription,
      List<String>? ingredients});
}

/// @nodoc
class _$DishEntityCopyWithImpl<$Res, $Val extends DishEntity>
    implements $DishEntityCopyWith<$Res> {
  _$DishEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? price = null,
    Object? decription = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      decription: freezed == decription
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DishEntityCopyWith<$Res>
    implements $DishEntityCopyWith<$Res> {
  factory _$$_DishEntityCopyWith(
          _$_DishEntity value, $Res Function(_$_DishEntity) then) =
      __$$_DishEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String url,
      num price,
      String? decription,
      List<String>? ingredients});
}

/// @nodoc
class __$$_DishEntityCopyWithImpl<$Res>
    extends _$DishEntityCopyWithImpl<$Res, _$_DishEntity>
    implements _$$_DishEntityCopyWith<$Res> {
  __$$_DishEntityCopyWithImpl(
      _$_DishEntity _value, $Res Function(_$_DishEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? price = null,
    Object? decription = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$_DishEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      decription: freezed == decription
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DishEntity implements _DishEntity {
  _$_DishEntity(
      {required this.name,
      required this.url,
      required this.price,
      required this.decription,
      required final List<String>? ingredients})
      : _ingredients = ingredients;

  factory _$_DishEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DishEntityFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final num price;
  @override
  final String? decription;
  final List<String>? _ingredients;
  @override
  List<String>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DishEntity(name: $name, url: $url, price: $price, decription: $decription, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DishEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.decription, decription) ||
                other.decription == decription) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url, price, decription,
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      __$$_DishEntityCopyWithImpl<_$_DishEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DishEntityToJson(
      this,
    );
  }
}

abstract class _DishEntity implements DishEntity {
  factory _DishEntity(
      {required final String name,
      required final String url,
      required final num price,
      required final String? decription,
      required final List<String>? ingredients}) = _$_DishEntity;

  factory _DishEntity.fromJson(Map<String, dynamic> json) =
      _$_DishEntity.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  num get price;
  @override
  String? get decription;
  @override
  List<String>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
