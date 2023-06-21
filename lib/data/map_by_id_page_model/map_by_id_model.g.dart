// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapByIdModel _$$_MapByIdModelFromJson(Map<String, dynamic> json) =>
    _$_MapByIdModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Spots.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MapByIdModelToJson(_$_MapByIdModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Spots _$$_SpotsFromJson(Map<String, dynamic> json) => _$_Spots(
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

Map<String, dynamic> _$$_SpotsToJson(_$_Spots instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'images': instance.images,
      'reactions': instance.reactions,
    };

_$_Images _$$_ImagesFromJson(Map<String, dynamic> json) => _$_Images(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$$_ImagesToJson(_$_Images instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'path': instance.path,
    };

_$_Reactions _$$_ReactionsFromJson(Map<String, dynamic> json) => _$_Reactions(
      id: json['id'] as int?,
      text: json['text'] as String?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$$_ReactionsToJson(_$_Reactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'score': instance.score,
    };
