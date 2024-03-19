import 'package:dio/dio.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/domain/data/api/favorite_api.dart';
import 'package:ride_map/domain/entities/favorite_models/favorite_model.dart';

class FavoriteApiImpl implements FavoriteApi {
  final Dio _client = getIt();

  @override
  Future<bool> add(int id) async {
    final response = await _client.post(
      '/favorite',
      data: {'spot_id': id},
    );
    return response.data;
  }

  @override
  Future<FavoriteModel> get() async {
    final response = await _client.get(
      '/favorite',
    );
    return FavoriteModel.fromJson(response.data);
  }

  @override
  Future<bool> delete(int id) async {
    final response = await _client.delete(
      '/favorite/$id',
    );
    return response.data;
  }
}
