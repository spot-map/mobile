// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapByIdModel _$$_MapByIdModelFromJson(Map<String, dynamic> json) =>
    _$_MapByIdModel(
      data: json['data'] == null
          ? null
          : Spot.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MapByIdModelToJson(_$_MapByIdModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Spot _$$_SpotFromJson(Map<String, dynamic> json) => _$_Spot(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => Reactions.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SpotToJson(_$_Spot instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'images': instance.images,
      'reactions': instance.reactions,
    };
