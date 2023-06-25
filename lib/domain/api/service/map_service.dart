import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

@Injectable(as: IMapRepository)
class MapService extends IMapRepository {
  final Dio _dio = Dio();
  @override
  Future<MapModel> getSpot() async {
    try {
      Response response = await _dio
          .get(ApiConstants.MAP, options: Options(method: 'GET'));

      if (response.statusCode == 200) {
        Dev.log('SPOTS ${response.data}', name: 'GET SPOTS API REQUEST');
        return MapModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'SPOT API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<MapByIdModel> getSpotById(int id) async {
    try {
      Dev.log('GET SPOT BY ID $id', name: 'GET SPOT BY ID');
      Dev.log('RESPONSE TO ${ApiConstants.SPOT_BY_ID}/$id', name: 'RESPONSE');
      Response response =
          await _dio.get('${ApiConstants.SPOT_BY_ID}/$id');
      if (response.statusCode == 200) {
        Dev.log('SPOT ${response.data}', name: 'GET SPOT BY ID');
        return MapByIdModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'SPOT BY ID API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addSpotToFavorite(int id) async {
    try {
      var spotObject = {'spot_id': id};

      _dio.options.headers ={
        'Authorization': 'Bearer ${Prefs.getString('token')!.replaceAll('"', '')}',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF8',
        HttpHeaders.acceptHeader: 'application/json',
      };

      Dev.log('RESPONSE TO ${ApiConstants.FAVORITE}', name: 'RESPONSE');
      Response response =
          await _dio.post(ApiConstants.FAVORITE, data: spotObject,options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
          ),);
      Dev.log('${_dio.options.headers.entries} ${_dio.options.headers.keys} ${_dio.options.headers.values}');
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
}
