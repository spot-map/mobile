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

Reactions _$ReactionsFromJson(Map<String, dynamic> json) {
  return _Reactions.fromJson(json);
}

/// @nodoc
mixin _$Reactions {
  int? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

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
  $Res call({int? id, String? text, int? score, User? user});

  $UserCopyWith<$Res>? get user;
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
abstract class _$$_ReactionsCopyWith<$Res> implements $ReactionsCopyWith<$Res> {
  factory _$$_ReactionsCopyWith(
          _$_Reactions value, $Res Function(_$_Reactions) then) =
      __$$_ReactionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? text, int? score, User? user});

  @override
  $UserCopyWith<$Res>? get user;
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
    Object? user = freezed,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reactions implements _Reactions {
  const _$_Reactions({this.id, this.text, this.score, this.user});

  factory _$_Reactions.fromJson(Map<String, dynamic> json) =>
      _$$_ReactionsFromJson(json);

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
    return 'Reactions(id: $id, text: $text, score: $score, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reactions &&
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
      {final int? id,
      final String? text,
      final int? score,
      final User? user}) = _$_Reactions;

  factory _Reactions.fromJson(Map<String, dynamic> json) =
      _$_Reactions.fromJson;

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
  _$$_ReactionsCopyWith<_$_Reactions> get copyWith =>
      throw _privateConstructorUsedError;
}
