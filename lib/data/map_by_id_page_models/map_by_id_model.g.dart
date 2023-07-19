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
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReactionsToJson(_$_Reactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'score': instance.score,
      'users': instance.users,
    };

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
