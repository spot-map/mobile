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
abstract class _$$_MapModelCopyWith<$Res> implements $MapModelCopyWith<$Res> {
  factory _$$_MapModelCopyWith(
          _$_MapModel value, $Res Function(_$_MapModel) then) =
      __$$_MapModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Spots> data});
}

/// @nodoc
class __$$_MapModelCopyWithImpl<$Res>
    extends _$MapModelCopyWithImpl<$Res, _$_MapModel>
    implements _$$_MapModelCopyWith<$Res> {
  __$$_MapModelCopyWithImpl(
      _$_MapModel _value, $Res Function(_$_MapModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_MapModel(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Spots>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapModel implements _MapModel {
  const _$_MapModel({final List<Spots> data = const []}) : _data = data;

  factory _$_MapModel.fromJson(Map<String, dynamic> json) =>
      _$$_MapModelFromJson(json);

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
            other is _$_MapModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapModelCopyWith<_$_MapModel> get copyWith =>
      __$$_MapModelCopyWithImpl<_$_MapModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapModelToJson(
      this,
    );
  }
}

abstract class _MapModel implements MapModel {
  const factory _MapModel({final List<Spots> data}) = _$_MapModel;

  factory _MapModel.fromJson(Map<String, dynamic> json) = _$_MapModel.fromJson;

  @override
  List<Spots> get data;
  @override
  @JsonKey(ignore: true)
  _$$_MapModelCopyWith<_$_MapModel> get copyWith =>
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
      double? longitude});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpotsCopyWith<$Res> implements $SpotsCopyWith<$Res> {
  factory _$$_SpotsCopyWith(_$_Spots value, $Res Function(_$_Spots) then) =
      __$$_SpotsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$_SpotsCopyWithImpl<$Res> extends _$SpotsCopyWithImpl<$Res, _$_Spots>
    implements _$$_SpotsCopyWith<$Res> {
  __$$_SpotsCopyWithImpl(_$_Spots _value, $Res Function(_$_Spots) _then)
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
  }) {
    return _then(_$_Spots(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Spots implements _Spots {
  const _$_Spots(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.latitude,
      this.longitude});

  factory _$_Spots.fromJson(Map<String, dynamic> json) =>
      _$$_SpotsFromJson(json);

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
  String toString() {
    return 'Spots(id: $id, name: $name, address: $address, description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spots &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, address, description, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpotsCopyWith<_$_Spots> get copyWith =>
      __$$_SpotsCopyWithImpl<_$_Spots>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpotsToJson(
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
      final double? longitude}) = _$_Spots;

  factory _Spots.fromJson(Map<String, dynamic> json) = _$_Spots.fromJson;

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
  @JsonKey(ignore: true)
  _$$_SpotsCopyWith<_$_Spots> get copyWith =>
      throw _privateConstructorUsedError;
}
