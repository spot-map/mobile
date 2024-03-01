// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapModel _$MapModelFromJson(Map<String, dynamic> json) {
  return _MapModel.fromJson(json);
}

/// @nodoc
mixin _$MapModel {
  List<Spots> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapModelCopyWith<MapModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapModelCopyWith<$Res> {
  factory $MapModelCopyWith(MapModel value, $Res Function(MapModel) then) =
      _$MapModelCopyWithImpl<$Res, MapModel>;
  @useResult
  $Res call({List<Spots> data});
}

/// @nodoc
class _$MapModelCopyWithImpl<$Res, $Val extends MapModel>
    implements $MapModelCopyWith<$Res> {
  _$MapModelCopyWithImpl(this._value, this._then);

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
              as List<Spots>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapModelImplCopyWith<$Res>
    implements $MapModelCopyWith<$Res> {
  factory _$$MapModelImplCopyWith(
          _$MapModelImpl value, $Res Function(_$MapModelImpl) then) =
      __$$MapModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Spots> data});
}

/// @nodoc
class __$$MapModelImplCopyWithImpl<$Res>
    extends _$MapModelCopyWithImpl<$Res, _$MapModelImpl>
    implements _$$MapModelImplCopyWith<$Res> {
  __$$MapModelImplCopyWithImpl(
      _$MapModelImpl _value, $Res Function(_$MapModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MapModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Spots>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapModelImpl implements _MapModel {
  const _$MapModelImpl({final List<Spots> data = const []}) : _data = data;

  factory _$MapModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapModelImplFromJson(json);

  final List<Spots> _data;
  @override
  @JsonKey()
  List<Spots> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MapModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapModelImplCopyWith<_$MapModelImpl> get copyWith =>
      __$$MapModelImplCopyWithImpl<_$MapModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapModelImplToJson(
      this,
    );
  }
}

abstract class _MapModel implements MapModel {
  const factory _MapModel({final List<Spots> data}) = _$MapModelImpl;

  factory _MapModel.fromJson(Map<String, dynamic> json) =
      _$MapModelImpl.fromJson;

  @override
  List<Spots> get data;
  @override
  @JsonKey(ignore: true)
  _$$MapModelImplCopyWith<_$MapModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Spots _$SpotsFromJson(Map<String, dynamic> json) {
  return _Spots.fromJson(json);
}

/// @nodoc
mixin _$Spots {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool? get isInFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotsCopyWith<Spots> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotsCopyWith<$Res> {
  factory $SpotsCopyWith(Spots value, $Res Function(Spots) then) =
      _$SpotsCopyWithImpl<$Res, Spots>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      bool? isInFavorite});
}

/// @nodoc
class _$SpotsCopyWithImpl<$Res, $Val extends Spots>
    implements $SpotsCopyWith<$Res> {
  _$SpotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isInFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isInFavorite: freezed == isInFavorite
          ? _value.isInFavorite
          : isInFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotsImplCopyWith<$Res> implements $SpotsCopyWith<$Res> {
  factory _$$SpotsImplCopyWith(
          _$SpotsImpl value, $Res Function(_$SpotsImpl) then) =
      __$$SpotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      bool? isInFavorite});
}

/// @nodoc
class __$$SpotsImplCopyWithImpl<$Res>
    extends _$SpotsCopyWithImpl<$Res, _$SpotsImpl>
    implements _$$SpotsImplCopyWith<$Res> {
  __$$SpotsImplCopyWithImpl(
      _$SpotsImpl _value, $Res Function(_$SpotsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isInFavorite = freezed,
  }) {
    return _then(_$SpotsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isInFavorite: freezed == isInFavorite
          ? _value.isInFavorite
          : isInFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotsImpl implements _Spots {
  const _$SpotsImpl(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.isInFavorite});

  factory _$SpotsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? description;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final bool? isInFavorite;

  @override
  String toString() {
    return 'Spots(id: $id, name: $name, address: $address, description: $description, latitude: $latitude, longitude: $longitude, isInFavorite: $isInFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isInFavorite, isInFavorite) ||
                other.isInFavorite == isInFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, description,
      latitude, longitude, isInFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotsImplCopyWith<_$SpotsImpl> get copyWith =>
      __$$SpotsImplCopyWithImpl<_$SpotsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotsImplToJson(
      this,
    );
  }
}

abstract class _Spots implements Spots {
  const factory _Spots(
      {final int? id,
      final String? name,
      final String? address,
      final String? description,
      final double? latitude,
      final double? longitude,
      final bool? isInFavorite}) = _$SpotsImpl;

  factory _Spots.fromJson(Map<String, dynamic> json) = _$SpotsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get description;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool? get isInFavorite;
  @override
  @JsonKey(ignore: true)
  _$$SpotsImplCopyWith<_$SpotsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
