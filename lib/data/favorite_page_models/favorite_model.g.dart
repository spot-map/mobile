// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteModel _$$_FavoriteModelFromJson(Map<String, dynamic> json) =>
    _$_FavoriteModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => FavoriteList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FavoriteModelToJson(_$_FavoriteModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_FavoriteList _$$_FavoriteListFromJson(Map<String, dynamic> json) =>
    _$_FavoriteList(
      id: json['id'] as int?,
      spot: json['spot'] == null
          ? null
          : Spot.fromJson(json['spot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FavoriteListToJson(_$_FavoriteList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spot': instance.spot,
    };
