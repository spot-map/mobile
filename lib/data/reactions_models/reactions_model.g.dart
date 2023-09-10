// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reactions _$$_ReactionsFromJson(Map<String, dynamic> json) => _$_Reactions(
      id: json['id'] as int?,
      text: json['text'] as String?,
      score: json['score'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReactionsToJson(_$_Reactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'score': instance.score,
      'user': instance.user,
    };
