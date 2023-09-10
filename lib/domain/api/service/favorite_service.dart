import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';

import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/preferences/preferences.dart';

@Injectable(as: IFavoriteRepository)
class FavoriteService implements IFavoriteRepository{
  final dioClient = getIt.get<DioClient>();
  final _provider = getIt.get<AuthProvider>();

  @override
  Future<void> addSpotToFavorite(int id) async {
    try {
      Dev.log('PREFS ${Prefs.getString('token')}', name: 'PREFS');
      var spotObject = {'spot_id': id};

      dioClient.dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
      };
      Response response = await dioClient.dio.post(
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
      } else if (response.statusCode == 401 || response.statusCode == 500) {
        await _provider.refreshToken();
        return addSpotToFavorite(id);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'ADD SPOT TO FAVORITE, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FavoriteModel> getFavoriteList() async {
    try {
      dioClient.dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
      };
      Dev.log('${Prefs.getString('token')}', name: 'TOKEN');
      Response response = await dioClient.dio.get(
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
        await _provider.refreshToken();
        return getFavoriteList();
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'FAVORITE LIST API ERROR, ${response.statusCode}');
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
      dioClient.dio.options.headers = {
        'Authorization':
            'Bearer ${Prefs.getString('token')!.replaceAll('"', '')}',
      };
      Dev.log('${Prefs.getString('token')}', name: 'TOKEN');
      Response response = await dioClient.dio.delete(
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
        Dev.log('Error ${response.statusCode}',
            name: 'FAVORITE DELETED ERROR, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}