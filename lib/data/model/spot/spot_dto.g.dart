// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotDto _$SpotDtoFromJson(Map<String, dynamic> json) => SpotDto(
      name: json['name'] as String?,
      coordinates: json['coordinates'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SpotDtoToJson(SpotDto instance) => <String, dynamic>{
      'name': instance.name,
      'coordinates': instance.coordinates,
      'description': instance.description,
    };
