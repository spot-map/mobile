// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) => _$FavoriteModelImpl(
      data: (json['data'] as List<dynamic>?)?.map((e) => FavoriteList.fromJson(e as Map<String, dynamic>)).toList() ??
          const [],
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) => <String, dynamic>{
      'data': instance.data,
    };

_$FavoriteListImpl _$$FavoriteListImplFromJson(Map<String, dynamic> json) => _$FavoriteListImpl(
      id: json['id'] as int?,
      spot: json['spot'] == null ? null : Spot.fromJson(json['spot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoriteListImplToJson(_$FavoriteListImpl instance) => <String, dynamic>{
      'id': instance.id,
      'spot': instance.spot,
    };
