// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImagesModel _$ImagesModelFromJson(Map<String, dynamic> json) {
  return _ImagesModel.fromJson(json);
}

/// @nodoc
mixin _$ImagesModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesModelCopyWith<ImagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesModelCopyWith<$Res> {
  factory $ImagesModelCopyWith(
          ImagesModel value, $Res Function(ImagesModel) then) =
      _$ImagesModelCopyWithImpl<$Res, ImagesModel>;
  @useResult
  $Res call({int? id, String? title, String? description, String? path});
}

/// @nodoc
class _$ImagesModelCopyWithImpl<$Res, $Val extends ImagesModel>
    implements $ImagesModelCopyWith<$Res> {
  _$ImagesModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ImagesModelImplCopyWith<$Res>
    implements $ImagesModelCopyWith<$Res> {
  factory _$$ImagesModelImplCopyWith(
          _$ImagesModelImpl value, $Res Function(_$ImagesModelImpl) then) =
      __$$ImagesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? description, String? path});
}

/// @nodoc
class __$$ImagesModelImplCopyWithImpl<$Res>
    extends _$ImagesModelCopyWithImpl<$Res, _$ImagesModelImpl>
    implements _$$ImagesModelImplCopyWith<$Res> {
  __$$ImagesModelImplCopyWithImpl(
      _$ImagesModelImpl _value, $Res Function(_$ImagesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? path = freezed,
  }) {
    return _then(_$ImagesModelImpl(
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
class _$ImagesModelImpl implements _ImagesModel {
  const _$ImagesModelImpl({this.id, this.title, this.description, this.path});

  factory _$ImagesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesModelImplFromJson(json);

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
    return 'ImagesModel(id: $id, title: $title, description: $description, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesModelImpl &&
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
  _$$ImagesModelImplCopyWith<_$ImagesModelImpl> get copyWith =>
      __$$ImagesModelImplCopyWithImpl<_$ImagesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesModelImplToJson(
      this,
    );
  }
}

abstract class _ImagesModel implements ImagesModel {
  const factory _ImagesModel(
      {final int? id,
      final String? title,
      final String? description,
      final String? path}) = _$ImagesModelImpl;

  factory _ImagesModel.fromJson(Map<String, dynamic> json) =
      _$ImagesModelImpl.fromJson;

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
  _$$ImagesModelImplCopyWith<_$ImagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
