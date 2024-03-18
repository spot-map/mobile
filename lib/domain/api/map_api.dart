import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/data/map_models/map_model.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';

abstract class MapApi {
  Future<MapModel> getSpot();

  Future<MapByIdModel> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getSpotById(int id);

  Future<bool> addReactions(String text, int score, int spotId);

  Future<bool> addImage(int id, List<XFile>? images);

  Future<MapModel> searchSpot(String name);
}

class MapApiImpl implements MapApi {
  final Dio _client = getIt();

  @override
  Future<MapModel> getSpot() async {
    Response response = await _client.get(ApiConstants.MAP);
    return MapModel.fromJson(response.data);
  }

  @override
  Future<MapByIdModel> getSpotById(int id) async {
    final response = await _client.get('${ApiConstants.SPOT_BY_ID}/$id');
    return MapByIdModel.fromJson(response.data);
  }

  @override
  Future<bool> addReactions(String text, int score, int spotId) async {
    final response = await _client.post(
      ApiConstants.REACTIONS,
      data: {"text": text, "score": score, "spot_id": spotId},
    );
    return response.data;
  }

  @override
  Future<MapByIdModel> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    final response = await _client.post(ApiConstants.ADD_SPOT, data: {
      "name": name,
      "address": address,
      "description": description,
      "latitude": latitude,
      "longitude": longitude,
    });
    return MapByIdModel.fromJson(response.data);
  }

  @override
  Future<bool> addImage(int id, List<XFile>? images) async {
    FormData formData = FormData.fromMap({
      "title": 'Test',
      "description": 'Test',
    });

    for (final image in images!) {
      formData.files.addAll([MapEntry("files[]", await MultipartFile.fromFile(image.path))]);
    }
    final response = await _client.post('${ApiConstants.ADD_IMAGE_TO_SPOT}/$id', data: formData, options: Options(followRedirects: false, validateStatus: (status) => status! < 500));

    return response.data;
  }

  @override
  Future<MapModel> searchSpot(String name) async {
    final response = await _client.get('${ApiConstants.SEARCH_SPOT}/$name');
    return MapModel.fromJson(response.data);
  }
}
