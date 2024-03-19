// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) => _$TokenModelImpl(
      data: json['data'] == null ? null : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) => <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) => <String, dynamic>{
      'token': instance.token,
    };
