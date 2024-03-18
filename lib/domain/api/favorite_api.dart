import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';

abstract class FavoriteApi {
  Future<bool> add(int id);

  Future<FavoriteModel> get();

  Future<bool> delete(int id);
}

class FavoriteApiImpl implements FavoriteApi {
  final Dio _client = getIt();

  @override
  Future<bool> add(int id) async {
    final response = await _client.post(
      ApiConstants.FAVORITE,
      data: {'spot_id': id},
    );
    return response.data;
  }

  @override
  Future<FavoriteModel> get() async {
    final response = await _client.get(
      ApiConstants.FAVORITE,
    );
    return FavoriteModel.fromJson(response.data);
  }

  @override
  Future<bool> delete(int id) async {
    final response = await _client.delete(
      '${ApiConstants.FAVORITE}/$id',
    );
    return response.data;
  }
}
