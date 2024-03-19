// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_by_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapByIdModel _$MapByIdModelFromJson(Map<String, dynamic> json) {
  return _MapByIdModel.fromJson(json);
}

/// @nodoc
mixin _$MapByIdModel {
  Spot? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapByIdModelCopyWith<MapByIdModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapByIdModelCopyWith<$Res> {
  factory $MapByIdModelCopyWith(MapByIdModel value, $Res Function(MapByIdModel) then) =
      _$MapByIdModelCopyWithImpl<$Res, MapByIdModel>;

  @useResult
  $Res call({Spot? data});

  $SpotCopyWith<$Res>? get data;
}

/// @nodoc
class _$MapByIdModelCopyWithImpl<$Res, $Val extends MapByIdModel> implements $MapByIdModelCopyWith<$Res> {
  _$MapByIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Spot?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpotCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SpotCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MapByIdModelImplCopyWith<$Res> implements $MapByIdModelCopyWith<$Res> {
  factory _$$MapByIdModelImplCopyWith(_$MapByIdModelImpl value, $Res Function(_$MapByIdModelImpl) then) =
      __$$MapByIdModelImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Spot? data});

  @override
  $SpotCopyWith<$Res>? get data;
}

/// @nodoc
class __$$MapByIdModelImplCopyWithImpl<$Res> extends _$MapByIdModelCopyWithImpl<$Res, _$MapByIdModelImpl>
    implements _$$MapByIdModelImplCopyWith<$Res> {
  __$$MapByIdModelImplCopyWithImpl(_$MapByIdModelImpl _value, $Res Function(_$MapByIdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$MapByIdModelImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Spot?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapByIdModelImpl implements _MapByIdModel {
  const _$MapByIdModelImpl({this.data});

  factory _$MapByIdModelImpl.fromJson(Map<String, dynamic> json) => _$$MapByIdModelImplFromJson(json);

  @override
  final Spot? data;

  @override
  String toString() {
    return 'MapByIdModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapByIdModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapByIdModelImplCopyWith<_$MapByIdModelImpl> get copyWith =>
      __$$MapByIdModelImplCopyWithImpl<_$MapByIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapByIdModelImplToJson(
      this,
    );
  }
}

abstract class _MapByIdModel implements MapByIdModel {
  const factory _MapByIdModel({final Spot? data}) = _$MapByIdModelImpl;

  factory _MapByIdModel.fromJson(Map<String, dynamic> json) = _$MapByIdModelImpl.fromJson;

  @override
  Spot? get data;

  @override
  @JsonKey(ignore: true)
  _$$MapByIdModelImplCopyWith<_$MapByIdModelImpl> get copyWith => throw _privateConstructorUsedError;
}

Spot _$SpotFromJson(Map<String, dynamic> json) {
  return _Spot.fromJson(json);
}

/// @nodoc
mixin _$Spot {
  int? get id => throw _privateConstructorUsedError;

  String? get name => throw _privateConstructorUsedError;

  String? get address => throw _privateConstructorUsedError;

  String? get description => throw _privateConstructorUsedError;

  double? get latitude => throw _privateConstructorUsedError;

  double? get longitude => throw _privateConstructorUsedError;

  bool? get isInFavorite => throw _privateConstructorUsedError;

  List<ImagesModel>? get images => throw _privateConstructorUsedError;

  List<ReactionsModel>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpotCopyWith<Spot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotCopyWith<$Res> {
  factory $SpotCopyWith(Spot value, $Res Function(Spot) then) = _$SpotCopyWithImpl<$Res, Spot>;

  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      bool? isInFavorite,
      List<ImagesModel>? images,
      List<ReactionsModel>? reactions});
}

/// @nodoc
class _$SpotCopyWithImpl<$Res, $Val extends Spot> implements $SpotCopyWith<$Res> {
  _$SpotCopyWithImpl(this._value, this._then);

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
    Object? images = freezed,
    Object? reactions = freezed,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotImplCopyWith<$Res> implements $SpotCopyWith<$Res> {
  factory _$$SpotImplCopyWith(_$SpotImpl value, $Res Function(_$SpotImpl) then) = __$$SpotImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      bool? isInFavorite,
      List<ImagesModel>? images,
      List<ReactionsModel>? reactions});
}

/// @nodoc
class __$$SpotImplCopyWithImpl<$Res> extends _$SpotCopyWithImpl<$Res, _$SpotImpl> implements _$$SpotImplCopyWith<$Res> {
  __$$SpotImplCopyWithImpl(_$SpotImpl _value, $Res Function(_$SpotImpl) _then) : super(_value, _then);

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
    Object? images = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$SpotImpl(
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
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotImpl implements _Spot {
  const _$SpotImpl(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.isInFavorite,
      final List<ImagesModel>? images = const [],
      final List<ReactionsModel>? reactions = const []})
      : _images = images,
        _reactions = reactions;

  factory _$SpotImpl.fromJson(Map<String, dynamic> json) => _$$SpotImplFromJson(json);

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
  final List<ImagesModel>? _images;

  @override
  @JsonKey()
  List<ImagesModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReactionsModel>? _reactions;

  @override
  @JsonKey()
  List<ReactionsModel>? get reactions {
    final value = _reactions;
    if (value == null) return null;
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Spot(id: $id, name: $name, address: $address, description: $description, latitude: $latitude, longitude: $longitude, isInFavorite: $isInFavorite, images: $images, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.latitude, latitude) || other.latitude == latitude) &&
            (identical(other.longitude, longitude) || other.longitude == longitude) &&
            (identical(other.isInFavorite, isInFavorite) || other.isInFavorite == isInFavorite) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._reactions, _reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, description, latitude, longitude, isInFavorite,
      const DeepCollectionEquality().hash(_images), const DeepCollectionEquality().hash(_reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotImplCopyWith<_$SpotImpl> get copyWith => __$$SpotImplCopyWithImpl<_$SpotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotImplToJson(
      this,
    );
  }
}

abstract class _Spot implements Spot {
  const factory _Spot(
      {final int? id,
      final String? name,
      final String? address,
      final String? description,
      final double? latitude,
      final double? longitude,
      final bool? isInFavorite,
      final List<ImagesModel>? images,
      final List<ReactionsModel>? reactions}) = _$SpotImpl;

  factory _Spot.fromJson(Map<String, dynamic> json) = _$SpotImpl.fromJson;

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
  List<ImagesModel>? get images;

  @override
  List<ReactionsModel>? get reactions;

  @override
  @JsonKey(ignore: true)
  _$$SpotImplCopyWith<_$SpotImpl> get copyWith => throw _privateConstructorUsedError;
}
