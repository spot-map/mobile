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
  Spots? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapByIdModelCopyWith<MapByIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapByIdModelCopyWith<$Res> {
  factory $MapByIdModelCopyWith(
          MapByIdModel value, $Res Function(MapByIdModel) then) =
      _$MapByIdModelCopyWithImpl<$Res, MapByIdModel>;
  @useResult
  $Res call({Spots? data});

  $SpotsCopyWith<$Res>? get data;
}

/// @nodoc
class _$MapByIdModelCopyWithImpl<$Res, $Val extends MapByIdModel>
    implements $MapByIdModelCopyWith<$Res> {
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
              as Spots?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpotsCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SpotsCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapByIdModelCopyWith<$Res>
    implements $MapByIdModelCopyWith<$Res> {
  factory _$$_MapByIdModelCopyWith(
          _$_MapByIdModel value, $Res Function(_$_MapByIdModel) then) =
      __$$_MapByIdModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Spots? data});

  @override
  $SpotsCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_MapByIdModelCopyWithImpl<$Res>
    extends _$MapByIdModelCopyWithImpl<$Res, _$_MapByIdModel>
    implements _$$_MapByIdModelCopyWith<$Res> {
  __$$_MapByIdModelCopyWithImpl(
      _$_MapByIdModel _value, $Res Function(_$_MapByIdModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_MapByIdModel(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Spots?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapByIdModel implements _MapByIdModel {
  const _$_MapByIdModel({this.data});

  factory _$_MapByIdModel.fromJson(Map<String, dynamic> json) =>
      _$$_MapByIdModelFromJson(json);

  @override
  final Spots? data;

  @override
  String toString() {
    return 'MapByIdModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapByIdModel &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapByIdModelCopyWith<_$_MapByIdModel> get copyWith =>
      __$$_MapByIdModelCopyWithImpl<_$_MapByIdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapByIdModelToJson(
      this,
    );
  }
}

abstract class _MapByIdModel implements MapByIdModel {
  const factory _MapByIdModel({final Spots? data}) = _$_MapByIdModel;

  factory _MapByIdModel.fromJson(Map<String, dynamic> json) =
      _$_MapByIdModel.fromJson;

  @override
  Spots? get data;
  @override
  @JsonKey(ignore: true)
  _$$_MapByIdModelCopyWith<_$_MapByIdModel> get copyWith =>
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
  List<Images>? get images => throw _privateConstructorUsedError;
  List<Reactions>? get reactions => throw _privateConstructorUsedError;

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
      List<Images>? images,
      List<Reactions>? reactions});
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reactions>?,
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
      double? longitude,
      List<Images>? images,
      List<Reactions>? reactions});
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
    Object? images = freezed,
    Object? reactions = freezed,
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
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reactions>?,
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
      this.longitude,
      final List<Images>? images = const [],
      final List<Reactions>? reactions = const []})
      : _images = images,
        _reactions = reactions;

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
  final List<Images>? _images;
  @override
  @JsonKey()
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Reactions>? _reactions;
  @override
  @JsonKey()
  List<Reactions>? get reactions {
    final value = _reactions;
    if (value == null) return null;
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Spots(id: $id, name: $name, address: $address, description: $description, latitude: $latitude, longitude: $longitude, images: $images, reactions: $reactions)';
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
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      description,
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_reactions));

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
      final double? longitude,
      final List<Images>? images,
      final List<Reactions>? reactions}) = _$_Spots;

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
  List<Images>? get images;
  @override
  List<Reactions>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_SpotsCopyWith<_$_Spots> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call({int? id, String? title, String? description, String? path});
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagesCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$_ImagesCopyWith(_$_Images value, $Res Function(_$_Images) then) =
      __$$_ImagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? description, String? path});
}

/// @nodoc
class __$$_ImagesCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$_Images>
    implements _$$_ImagesCopyWith<$Res> {
  __$$_ImagesCopyWithImpl(_$_Images _value, $Res Function(_$_Images) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_Images(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Images implements _Images {
  const _$_Images({this.id, this.title, this.description, this.path});

  factory _$_Images.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? path;

  @override
  String toString() {
    return 'Images(id: $id, title: $title, description: $description, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Images &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesCopyWith<_$_Images> get copyWith =>
      __$$_ImagesCopyWithImpl<_$_Images>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagesToJson(
      this,
    );
  }
}

abstract class _Images implements Images {
  const factory _Images(
      {final int? id,
      final String? title,
      final String? description,
      final String? path}) = _$_Images;

  factory _Images.fromJson(Map<String, dynamic> json) = _$_Images.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesCopyWith<_$_Images> get copyWith =>
      throw _privateConstructorUsedError;
}

Reactions _$ReactionsFromJson(Map<String, dynamic> json) {
  return _Reactions.fromJson(json);
}

/// @nodoc
mixin _$Reactions {
  int? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactionsCopyWith<Reactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionsCopyWith<$Res> {
  factory $ReactionsCopyWith(Reactions value, $Res Function(Reactions) then) =
      _$ReactionsCopyWithImpl<$Res, Reactions>;
  @useResult
  $Res call({int? id, String? text, int? score});
}

/// @nodoc
class _$ReactionsCopyWithImpl<$Res, $Val extends Reactions>
    implements $ReactionsCopyWith<$Res> {
  _$ReactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReactionsCopyWith<$Res> implements $ReactionsCopyWith<$Res> {
  factory _$$_ReactionsCopyWith(
          _$_Reactions value, $Res Function(_$_Reactions) then) =
      __$$_ReactionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? text, int? score});
}

/// @nodoc
class __$$_ReactionsCopyWithImpl<$Res>
    extends _$ReactionsCopyWithImpl<$Res, _$_Reactions>
    implements _$$_ReactionsCopyWith<$Res> {
  __$$_ReactionsCopyWithImpl(
      _$_Reactions _value, $Res Function(_$_Reactions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? score = freezed,
  }) {
    return _then(_$_Reactions(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reactions implements _Reactions {
  const _$_Reactions({this.id, this.text, this.score});

  factory _$_Reactions.fromJson(Map<String, dynamic> json) =>
      _$$_ReactionsFromJson(json);

  @override
  final int? id;
  @override
  final String? text;
  @override
  final int? score;

  @override
  String toString() {
    return 'Reactions(id: $id, text: $text, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reactions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactionsCopyWith<_$_Reactions> get copyWith =>
      __$$_ReactionsCopyWithImpl<_$_Reactions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReactionsToJson(
      this,
    );
  }
}

abstract class _Reactions implements Reactions {
  const factory _Reactions(
      {final int? id, final String? text, final int? score}) = _$_Reactions;

  factory _Reactions.fromJson(Map<String, dynamic> json) =
      _$_Reactions.fromJson;

  @override
  int? get id;
  @override
  String? get text;
  @override
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$_ReactionsCopyWith<_$_Reactions> get copyWith =>
      throw _privateConstructorUsedError;
}
