// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReactionsModel _$ReactionsModelFromJson(Map<String, dynamic> json) {
  return _ReactionsModel.fromJson(json);
}

/// @nodoc
mixin _$ReactionsModel {
  int? get id => throw _privateConstructorUsedError;

  String? get text => throw _privateConstructorUsedError;

  int? get score => throw _privateConstructorUsedError;

  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReactionsModelCopyWith<ReactionsModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionsModelCopyWith<$Res> {
  factory $ReactionsModelCopyWith(ReactionsModel value, $Res Function(ReactionsModel) then) =
      _$ReactionsModelCopyWithImpl<$Res, ReactionsModel>;

  @useResult
  $Res call({int? id, String? text, int? score, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReactionsModelCopyWithImpl<$Res, $Val extends ReactionsModel> implements $ReactionsModelCopyWith<$Res> {
  _$ReactionsModelCopyWithImpl(this._value, this._then);

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
    Object? user = freezed,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReactionsModelImplCopyWith<$Res> implements $ReactionsModelCopyWith<$Res> {
  factory _$$ReactionsModelImplCopyWith(_$ReactionsModelImpl value, $Res Function(_$ReactionsModelImpl) then) =
      __$$ReactionsModelImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int? id, String? text, int? score, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ReactionsModelImplCopyWithImpl<$Res> extends _$ReactionsModelCopyWithImpl<$Res, _$ReactionsModelImpl>
    implements _$$ReactionsModelImplCopyWith<$Res> {
  __$$ReactionsModelImplCopyWithImpl(_$ReactionsModelImpl _value, $Res Function(_$ReactionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? score = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ReactionsModelImpl(
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReactionsModelImpl implements _ReactionsModel {
  const _$ReactionsModelImpl({this.id, this.text, this.score, this.user});

  factory _$ReactionsModelImpl.fromJson(Map<String, dynamic> json) => _$$ReactionsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? text;
  @override
  final int? score;
  @override
  final User? user;

  @override
  String toString() {
    return 'ReactionsModel(id: $id, text: $text, score: $score, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, score, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactionsModelImplCopyWith<_$ReactionsModelImpl> get copyWith =>
      __$$ReactionsModelImplCopyWithImpl<_$ReactionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReactionsModelImplToJson(
      this,
    );
  }
}

abstract class _ReactionsModel implements ReactionsModel {
  const factory _ReactionsModel({final int? id, final String? text, final int? score, final User? user}) =
      _$ReactionsModelImpl;

  factory _ReactionsModel.fromJson(Map<String, dynamic> json) = _$ReactionsModelImpl.fromJson;

  @override
  int? get id;

  @override
  String? get text;

  @override
  int? get score;

  @override
  User? get user;

  @override
  @JsonKey(ignore: true)
  _$$ReactionsModelImplCopyWith<_$ReactionsModelImpl> get copyWith => throw _privateConstructorUsedError;
}
