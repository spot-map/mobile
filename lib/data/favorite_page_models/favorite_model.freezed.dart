// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  List<FavoriteList> get favorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
          FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call({List<FavoriteList> favorite});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as List<FavoriteList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteModelCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$FavoriteModelCopyWith(
          _$FavoriteModel value, $Res Function(_$FavoriteModel) then) =
      __$$FavoriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FavoriteList> favorite});
}

/// @nodoc
class __$$FavoriteModelCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$FavoriteModel>
    implements _$$FavoriteModelCopyWith<$Res> {
  __$$FavoriteModelCopyWithImpl(
      _$FavoriteModel _value, $Res Function(_$FavoriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
  }) {
    return _then(_$FavoriteModel(
      favorite: null == favorite
          ? _value._favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as List<FavoriteList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteModel implements FavoriteModel {
  const _$FavoriteModel({final List<FavoriteList> favorite = const []})
      : _favorite = favorite;

  factory _$FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteModelFromJson(json);

  final List<FavoriteList> _favorite;
  @override
  @JsonKey()
  List<FavoriteList> get favorite {
    if (_favorite is EqualUnmodifiableListView) return _favorite;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorite);
  }

  @override
  String toString() {
    return 'FavoriteModel(favorite: $favorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteModel &&
            const DeepCollectionEquality().equals(other._favorite, _favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_favorite));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteModelCopyWith<_$FavoriteModel> get copyWith =>
      __$$FavoriteModelCopyWithImpl<_$FavoriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteModelToJson(
      this,
    );
  }
}

abstract class FavoriteModel implements FavoriteModel {
  const factory FavoriteModel({final List<FavoriteList> favorite}) =
      _$FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteModel.fromJson;

  @override
  List<FavoriteList> get favorite;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteModelCopyWith<_$FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteList _$FavoriteListFromJson(Map<String, dynamic> json) {
  return FavoriteList.fromJson(json);
}

/// @nodoc
mixin _$FavoriteList {
  int? get id => throw _privateConstructorUsedError;
  Spot? get spot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteListCopyWith<FavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteListCopyWith<$Res> {
  factory $FavoriteListCopyWith(
          FavoriteList value, $Res Function(FavoriteList) then) =
      _$FavoriteListCopyWithImpl<$Res, FavoriteList>;
  @useResult
  $Res call({int? id, Spot? spot});

  $SpotCopyWith<$Res>? get spot;
}

/// @nodoc
class _$FavoriteListCopyWithImpl<$Res, $Val extends FavoriteList>
    implements $FavoriteListCopyWith<$Res> {
  _$FavoriteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spot = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      spot: freezed == spot
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as Spot?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpotCopyWith<$Res>? get spot {
    if (_value.spot == null) {
      return null;
    }

    return $SpotCopyWith<$Res>(_value.spot!, (value) {
      return _then(_value.copyWith(spot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteListCopyWith<$Res>
    implements $FavoriteListCopyWith<$Res> {
  factory _$$FavoriteListCopyWith(
          _$FavoriteList value, $Res Function(_$FavoriteList) then) =
      __$$FavoriteListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, Spot? spot});

  @override
  $SpotCopyWith<$Res>? get spot;
}

/// @nodoc
class __$$FavoriteListCopyWithImpl<$Res>
    extends _$FavoriteListCopyWithImpl<$Res, _$FavoriteList>
    implements _$$FavoriteListCopyWith<$Res> {
  __$$FavoriteListCopyWithImpl(
      _$FavoriteList _value, $Res Function(_$FavoriteList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spot = freezed,
  }) {
    return _then(_$FavoriteList(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      spot: freezed == spot
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as Spot?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteList implements FavoriteList {
  const _$FavoriteList({this.id, this.spot});

  factory _$FavoriteList.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteListFromJson(json);

  @override
  final int? id;
  @override
  final Spot? spot;

  @override
  String toString() {
    return 'FavoriteList(id: $id, spot: $spot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spot, spot) || other.spot == spot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, spot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteListCopyWith<_$FavoriteList> get copyWith =>
      __$$FavoriteListCopyWithImpl<_$FavoriteList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteListToJson(
      this,
    );
  }
}

abstract class FavoriteList implements FavoriteList {
  const factory FavoriteList({final int? id, final Spot? spot}) =
      _$FavoriteList;

  factory FavoriteList.fromJson(Map<String, dynamic> json) =
      _$FavoriteList.fromJson;

  @override
  int? get id;
  @override
  Spot? get spot;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteListCopyWith<_$FavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}
