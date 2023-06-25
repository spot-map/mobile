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
  return _FavoriteModel.fromJson(json);
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
abstract class _$$_FavoriteModelCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$_FavoriteModelCopyWith(
          _$_FavoriteModel value, $Res Function(_$_FavoriteModel) then) =
      __$$_FavoriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FavoriteList> favorite});
}

/// @nodoc
class __$$_FavoriteModelCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$_FavoriteModel>
    implements _$$_FavoriteModelCopyWith<$Res> {
  __$$_FavoriteModelCopyWithImpl(
      _$_FavoriteModel _value, $Res Function(_$_FavoriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
  }) {
    return _then(_$_FavoriteModel(
      favorite: null == favorite
          ? _value._favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as List<FavoriteList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteModel implements _FavoriteModel {
  const _$_FavoriteModel({final List<FavoriteList> favorite = const []})
      : _favorite = favorite;

  factory _$_FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteModelFromJson(json);

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
            other is _$_FavoriteModel &&
            const DeepCollectionEquality().equals(other._favorite, _favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_favorite));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      __$$_FavoriteModelCopyWithImpl<_$_FavoriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteModelToJson(
      this,
    );
  }
}

abstract class _FavoriteModel implements FavoriteModel {
  const factory _FavoriteModel({final List<FavoriteList> favorite}) =
      _$_FavoriteModel;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$_FavoriteModel.fromJson;

  @override
  List<FavoriteList> get favorite;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteList _$FavoriteListFromJson(Map<String, dynamic> json) {
  return _FavoriteList.fromJson(json);
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
abstract class _$$_FavoriteListCopyWith<$Res>
    implements $FavoriteListCopyWith<$Res> {
  factory _$$_FavoriteListCopyWith(
          _$_FavoriteList value, $Res Function(_$_FavoriteList) then) =
      __$$_FavoriteListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, Spot? spot});

  @override
  $SpotCopyWith<$Res>? get spot;
}

/// @nodoc
class __$$_FavoriteListCopyWithImpl<$Res>
    extends _$FavoriteListCopyWithImpl<$Res, _$_FavoriteList>
    implements _$$_FavoriteListCopyWith<$Res> {
  __$$_FavoriteListCopyWithImpl(
      _$_FavoriteList _value, $Res Function(_$_FavoriteList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spot = freezed,
  }) {
    return _then(_$_FavoriteList(
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
class _$_FavoriteList implements _FavoriteList {
  const _$_FavoriteList({this.id, this.spot});

  factory _$_FavoriteList.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteListFromJson(json);

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
            other is _$_FavoriteList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spot, spot) || other.spot == spot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, spot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteListCopyWith<_$_FavoriteList> get copyWith =>
      __$$_FavoriteListCopyWithImpl<_$_FavoriteList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteListToJson(
      this,
    );
  }
}

abstract class _FavoriteList implements FavoriteList {
  const factory _FavoriteList({final int? id, final Spot? spot}) =
      _$_FavoriteList;

  factory _FavoriteList.fromJson(Map<String, dynamic> json) =
      _$_FavoriteList.fromJson;

  @override
  int? get id;
  @override
  Spot? get spot;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteListCopyWith<_$_FavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}
