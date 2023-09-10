import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/preferences/preferences.dart';

import '../provider/login_provider.dart';

@Injectable(as: IMapRepository)
class MapService implements IMapRepository {
  final dioClient = getIt.get<DioClient>();
  final _provider = getIt.get<AuthProvider>();

  @override
  Future<MapModel> getSpot() async {
    try {
      Response response = await dioClient.dio.get(ApiConstants.SPOT_LIST);

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
      Response response =
          await dioClient.dio.get('${ApiConstants.SPOT_BY_ID}/$id');
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
  Future<void> addReactions(String text, int score, int spotId) async {
    var reactionsObject = {"text": text, "score": score, "spot_id": spotId};
    Dev.log('Object $reactionsObject', name: 'Reactions Object');
    try {
      dioClient.dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      Dev.log('${Prefs.getString('token')}', name: 'TOKEN');
      Response response = await dioClient.dio.post(
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
        Dev.log('Error ${response.statusCode}',
            name: 'ADD REACTIONS, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> addSpot(String name, String address, String description,
      double latitude, double longitude, List<XFile>? images) async {
    var spotObject = {
      "name": name,
      "address": address,
      "description": description,
      "latitude": latitude,
      "longitude": longitude,
    };

    Dev.log('Object $spotObject', name: 'Spot Object');

    try {
      dioClient.dio.options.headers = {
        'Authorization': 'Bearer ${Prefs.getString('token')}',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      Response response = await dioClient.dio.post(ApiConstants.ADD_SPOT,
          data: spotObject,
          options: Options(
              followRedirects: false,
              validateStatus: (status) => status! < 500));

      if (response.statusCode == 201) {
        Dev.log('ADD SPOT ${response.data}', name: 'SPOT');
        await addImage(response.data['id'], images);
        return response.data;
      } else if (response.statusCode == 401 || response.statusCode == 500) {
        await _provider.refreshToken();
        return addSpot(name, address, description, latitude, longitude, images);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'ADD SPOT, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> addImage(int id, List<XFile>? images) async {
    dioClient.dio.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      List uploadImage = [];
      for (final image in images!) {
        uploadImage.add(image.path);
      }

      Dev.log(uploadImage, name: "IMAGES");

      FormData data = FormData.fromMap({"file": uploadImage});

      Response response = await dioClient.dio.post(
          '${ApiConstants.ADD_IMAGE_TO_SPOT}/$id',
          data: data,
          options: Options(
              followRedirects: false,
              validateStatus: (status) => status! < 500));

      if (response.statusCode == 201) {
        Dev.log('ADD SPOT ${response.data}', name: 'SPOT');
        return response.data;
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'ADD SPOT, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<MapModel> searchSpot(String name) async {
    try {
      Response response =
          await dioClient.dio.get('${ApiConstants.SEARCH_SPOT}/$name');

      if (response.statusCode == 200) {
        Dev.log(response.data, name: 'SEARCH SPOT API REQUEST');
        return MapModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'SPOT API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
