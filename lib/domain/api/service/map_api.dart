import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/usecases/auth_uses_case.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/internal/entity/result.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/preferences/preferences.dart';

abstract class MapApi {
  Future<MapModel> getSpot();

  Future<Result<bool>> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getSpotById(int id);

  Future<void> addReactions(String text, int score, int spotId);

  Future<void> addImage(int id, List<XFile>? images);

  Future<MapModel> searchSpot(String name);
}


class MapApiImpl implements MapApi {
  final Dio _client = getIt();
  final AuthUseCase _provider = getIt();

  @override
  Future<MapModel> getSpot() async {
    try {
      Response response = await _client.get(ApiConstants.SPOT_LIST);

      if (response.statusCode == 200) {
        Dev.log('SPOTS ${response.data}', name: 'GET SPOTS API REQUEST');
        return MapModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'SPOT API ERROR, ${response.statusCode}');
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
      Response response = await _client.get('${ApiConstants.SPOT_BY_ID}/$id');
      if (response.statusCode == 200) {
        Dev.log('SPOT ${response.data}', name: 'GET SPOT BY ID');
        return MapByIdModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'SPOT BY ID API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addReactions(String text, int score, int spotId) async {
    var reactionsObject = {"text": text, "score": score, "spot_id": spotId};
    Dev.log('Object $reactionsObject', name: 'Reactions Object');
    try {
      _client.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      Dev.log('${Prefs.getString('token')}', name: 'TOKEN');
      Response response = await _client.post(
        ApiConstants.REACTIONS,
        data: reactionsObject,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        Dev.log('ADD REACTIONS ${response.data}', name: 'REACTIONS');
        return response.data;
      } else {
        Dev.log('Error ${response.statusCode}', name: 'ADD REACTIONS, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<Result<bool>> addSpot(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    try {
      _client.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      Response response = await _client.post(ApiConstants.ADD_SPOT,
          data: {
            "name": name,
            "address": address,
            "description": description,
            "latitude": latitude,
            "longitude": longitude,
          },
          options: Options(followRedirects: false, validateStatus: (status) => status! < 500));

      if (response.statusCode == 201) {
        Dev.log('ADD SPOT ${response.data}', name: 'SPOT');
        Dev.log('ID ${response.data['data']['id']}', name: 'SPOT ID');
        await addImage(response.data['data']['id'], images);
        return Result.success(true);
      } else if (response.statusCode == 401 || response.statusCode == 500) {
        await _provider.refreshToken();
        return addSpot(name, address, description, latitude, longitude, images);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'ADD SPOT, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<Result<bool>> addImage(int id, List<XFile>? images) async {
    _client.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      FormData formData = FormData.fromMap({
        "title": 'Test',
        "description": 'Test',
      });

      for (final image in images!) {
        formData.files.addAll([MapEntry("files[]", await MultipartFile.fromFile(image.path))]);
      }

      Response response = await _client.post('${ApiConstants.ADD_IMAGE_TO_SPOT}/$id',
          data: formData, options: Options(followRedirects: false, validateStatus: (status) => status! < 500));

      if (response.statusCode == 200) {
        Dev.log('ADD IMAGE ${response.data}', name: 'SPOT IMAGE');
        return Result.success(true);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'ADD IMAGE, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<MapModel> searchSpot(String name) async {
    try {
      Response response = await _client.get('${ApiConstants.SEARCH_SPOT}/$name');

      if (response.statusCode == 200) {
        Dev.log(response.data, name: 'SEARCH SPOT API REQUEST');
        return MapModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}', name: 'SPOT API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
