

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

class FavoriteService implements IFavoriteRepository{
  final Dio _dio = Dio();
  @override
  Future<void> addSpotToFavorite(int id) async {
    try {
      var spotObject = {'spot_id': id};
      _dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')!.replaceAll('"', '')}',
      };

      Response response = await _dio.post(
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
  Future<FavoriteModel> getFavoriteList() async{
    try{
      _dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')!.replaceAll('"', '')}',
      };

      Response response = await _dio.get(
        ApiConstants.FAVORITE,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        Dev.log('FAVORITE ${response.data}', name: 'FAVORITE LIST');
        return FavoriteModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'FAVORITE LIST API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    }on DioError catch (e){
      throw Exception(e.toString());
    } catch (e){
      throw Exception(e.toString());
    }
  }

}