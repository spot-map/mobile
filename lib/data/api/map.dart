import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/url/urls.dart';
import 'package:ride_map/domain/data/api/map_api.dart';
import 'package:ride_map/domain/entities/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/domain/entities/map_models/map_model.dart';

class MapApiImpl implements MapApi {
  final Dio _client = getIt();

  @override
  Future<MapModel> get() async {
    final response = await _client.get('${ApiConstants.SPOT}/index');
    return MapModel.fromJson(response.data);
  }

  @override
  Future<MapByIdModel> getById(int id) async {
    final response = await _client.get('${ApiConstants.SPOT}/show/$id');
    return MapByIdModel.fromJson(response.data);
  }

  @override
  Future<bool> comment(String text, int score, int spotId) async {
    final response = await _client.post(
      '/reaction',
      data: {"text": text, "score": score, "spot_id": spotId},
    );
    return response.data;
  }

  @override
  Future<MapByIdModel> create(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    final response = await _client.post('${ApiConstants.SPOT}/create', data: {
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
    final response = await _client.post('/image/add/$id',
        data: formData, options: Options(followRedirects: false, validateStatus: (status) => status! < 500));

    return response.data;
  }

  @override
  Future<MapModel> search(String name) async {
    final response = await _client.get('${ApiConstants.SPOT}/search/$name');
    return MapModel.fromJson(response.data);
  }
}
