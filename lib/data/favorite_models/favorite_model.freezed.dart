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
  List<FavoriteList> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;

  @useResult
  $Res call({List<FavoriteList> data});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel> implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FavoriteList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteModelImplCopyWith<$Res> implements $FavoriteModelCopyWith<$Res> {
  factory _$$FavoriteModelImplCopyWith(_$FavoriteModelImpl value, $Res Function(_$FavoriteModelImpl) then) =
      __$$FavoriteModelImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<FavoriteList> data});
}

/// @nodoc
class __$$FavoriteModelImplCopyWithImpl<$Res> extends _$FavoriteModelCopyWithImpl<$Res, _$FavoriteModelImpl>
    implements _$$FavoriteModelImplCopyWith<$Res> {
  __$$FavoriteModelImplCopyWithImpl(_$FavoriteModelImpl _value, $Res Function(_$FavoriteModelImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FavoriteModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FavoriteList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteModelImpl implements _FavoriteModel {
  const _$FavoriteModelImpl({final List<FavoriteList> data = const []}) : _data = data;

  factory _$FavoriteModelImpl.fromJson(Map<String, dynamic> json) => _$$FavoriteModelImplFromJson(json);

  final List<FavoriteList> _data;

  @override
  @JsonKey()
  List<FavoriteList> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavoriteModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith =>
      __$$FavoriteModelImplCopyWithImpl<_$FavoriteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteModelImplToJson(
      this,
    );
  }
}

abstract class _FavoriteModel implements FavoriteModel {
  const factory _FavoriteModel({final List<FavoriteList> data}) = _$FavoriteModelImpl;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) = _$FavoriteModelImpl.fromJson;

  @override
  List<FavoriteList> get data;

  @override
  @JsonKey(ignore: true)
  _$$FavoriteModelImplCopyWith<_$FavoriteModelImpl> get copyWith => throw _privateConstructorUsedError;
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
  $FavoriteListCopyWith<FavoriteList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteListCopyWith<$Res> {
  factory $FavoriteListCopyWith(FavoriteList value, $Res Function(FavoriteList) then) =
      _$FavoriteListCopyWithImpl<$Res, FavoriteList>;

  @useResult
  $Res call({int? id, Spot? spot});

  $SpotCopyWith<$Res>? get spot;
}

/// @nodoc
class _$FavoriteListCopyWithImpl<$Res, $Val extends FavoriteList> implements $FavoriteListCopyWith<$Res> {
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
abstract class _$$FavoriteListImplCopyWith<$Res> implements $FavoriteListCopyWith<$Res> {
  factory _$$FavoriteListImplCopyWith(_$FavoriteListImpl value, $Res Function(_$FavoriteListImpl) then) =
      __$$FavoriteListImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int? id, Spot? spot});

  @override
  $SpotCopyWith<$Res>? get spot;
}

/// @nodoc
class __$$FavoriteListImplCopyWithImpl<$Res> extends _$FavoriteListCopyWithImpl<$Res, _$FavoriteListImpl>
    implements _$$FavoriteListImplCopyWith<$Res> {
  __$$FavoriteListImplCopyWithImpl(_$FavoriteListImpl _value, $Res Function(_$FavoriteListImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spot = freezed,
  }) {
    return _then(_$FavoriteListImpl(
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
class _$FavoriteListImpl implements _FavoriteList {
  const _$FavoriteListImpl({this.id, this.spot});

  factory _$FavoriteListImpl.fromJson(Map<String, dynamic> json) => _$$FavoriteListImplFromJson(json);

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
            other is _$FavoriteListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spot, spot) || other.spot == spot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, spot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteListImplCopyWith<_$FavoriteListImpl> get copyWith =>
      __$$FavoriteListImplCopyWithImpl<_$FavoriteListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteListImplToJson(
      this,
    );
  }
}

abstract class _FavoriteList implements FavoriteList {
  const factory _FavoriteList({final int? id, final Spot? spot}) = _$FavoriteListImpl;

  factory _FavoriteList.fromJson(Map<String, dynamic> json) = _$FavoriteListImpl.fromJson;

  @override
  int? get id;

  @override
  Spot? get spot;

  @override
  @JsonKey(ignore: true)
  _$$FavoriteListImplCopyWith<_$FavoriteListImpl> get copyWith => throw _privateConstructorUsedError;
}
