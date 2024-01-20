// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReactionsModelImpl _$$ReactionsModelImplFromJson(Map<String, dynamic> json) =>
    _$ReactionsModelImpl(
      id: json['id'] as int?,
      text: json['text'] as String?,
      score: json['score'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReactionsModelImplToJson(
        _$ReactionsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'score': instance.score,
      'user': instance.user,
    };
