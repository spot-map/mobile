// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapByIdModelImpl _$$MapByIdModelImplFromJson(Map<String, dynamic> json) =>
    _$MapByIdModelImpl(
      data: json['data'] == null
          ? null
          : Spot.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MapByIdModelImplToJson(_$MapByIdModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$SpotImpl _$$SpotImplFromJson(Map<String, dynamic> json) => _$SpotImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isInFavorite: json['isInFavorite'] as bool?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImagesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => ReactionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SpotImplToJson(_$SpotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isInFavorite': instance.isInFavorite,
      'images': instance.images,
      'reactions': instance.reactions,
    };
