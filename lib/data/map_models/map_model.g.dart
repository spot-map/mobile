// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapModelImpl _$$MapModelImplFromJson(Map<String, dynamic> json) => _$MapModelImpl(
      data: (json['data'] as List<dynamic>?)?.map((e) => Spots.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
    );

Map<String, dynamic> _$$MapModelImplToJson(_$MapModelImpl instance) => <String, dynamic>{
      'data': instance.data,
    };

_$SpotsImpl _$$SpotsImplFromJson(Map<String, dynamic> json) => _$SpotsImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isInFavorite: json['isInFavorite'] as bool?,
    );

Map<String, dynamic> _$$SpotsImplToJson(_$SpotsImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isInFavorite': instance.isInFavorite,
    };
