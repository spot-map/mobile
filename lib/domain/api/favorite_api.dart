import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/domain/usecases/api/auth.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';

abstract class FavoriteApi {
  Future<void> addSpotToFavorite(int id);

  Future<FavoriteModel> getFavoriteList();

  Future<void> deleteSpotFromFavorite(int id);
}

class FavoriteApiImpl implements FavoriteApi {
  final Dio _client = getIt();
  final AuthUseCase _auth = getIt();
  final TokenStorage _tokenStorage = getIt();

  @override
  Future<void> addSpotToFavorite(int id) async {
    try {
      Dev.log('TOKEN ${_tokenStorage.accessToken}', name: 'TOKEN');
      var spotObject = {'spot_id': id};

      _client.options.headers = {
        'Authorization': 'Bearer ${_tokenStorage.accessToken}',
      };
      Response response = await _client.post(
        ApiConstants.FAVORITE,
        data: spotObject,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 201) {
        Dev.log('SPOT ${response.data}', name: 'ADD SPOT TO FAVORITE');
        return response.data;
      } else if (response.statusCode == 401) {
        await _auth.refreshToken();
        return addSpotToFavorite(id);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'ADD SPOT TO FAVORITE, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FavoriteModel> getFavoriteList() async {
    try {
      _client.options.headers = {
        'Authorization': 'Bearer ${_tokenStorage.accessToken}',
      };
      Dev.log('${_tokenStorage.accessToken}', name: 'TOKEN');
      Response response = await _client.get(
        ApiConstants.FAVORITE,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        Dev.log('FAVORITE ${response.data}', name: 'FAVORITE LIST');
        return FavoriteModel.fromJson(response.data);
      } else if (response.statusCode == 401 || response.statusCode == 500) {
        await _auth.refreshToken();
        return getFavoriteList();
      } else {
        Dev.log('Error ${response.statusCode}', name: 'FAVORITE LIST API ERROR, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteSpotFromFavorite(int id) async {
    try {
      _client.options.headers = {
        'Authorization': 'Bearer ${_tokenStorage.accessToken}',
      };
      Dev.log('${_tokenStorage.accessToken}', name: 'TOKEN');
      Response response = await _client.delete(
        '${ApiConstants.FAVORITE}/$id',
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        Dev.log('FAVORITE DELETED ${response.data}', name: 'FAVORITE DELETED');
        return response.data;
      } else {
        Dev.log('Error ${response.statusCode}', name: 'FAVORITE DELETED ERROR, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
