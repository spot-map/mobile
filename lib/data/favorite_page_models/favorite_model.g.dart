// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModel _$$FavoriteModelFromJson(Map<String, dynamic> json) =>
    _$FavoriteModel(
      favorite: (json['favorite'] as List<dynamic>?)
              ?.map((e) => FavoriteList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FavoriteModelToJson(_$FavoriteModel instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
    };

_$FavoriteList _$$FavoriteListFromJson(Map<String, dynamic> json) =>
    _$FavoriteList(
      id: json['id'] as int?,
      spot: json['spot'] == null
          ? null
          : Spot.fromJson(json['spot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoriteListToJson(_$FavoriteList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spot': instance.spot,
    };
