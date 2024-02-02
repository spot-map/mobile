import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/data/map_models/map_model.dart';
import 'package:ride_map/data/result_model/result.dart';
import 'package:ride_map/domain/api/map_api.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class MapUseCase {
  Future<MapModel> getSpot();

  Future<Result<bool>> addSpot(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getSpotById(int id);

  Future<void> addReactions(String text, int score, int spotId);

  Future<MapModel> searchSpot(String name);
}

class MapUseCaseImpl implements MapUseCase {
  final MapApi _mapApi = getIt();

  @override
  Future<MapModel> getSpot() => _mapApi.getSpot();

  @override
  Future<Result<bool>> addSpot(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    final result = await _mapApi.addSpot(name, address, description, latitude, longitude, images);
   if(result.isSuccess){
     return Result.success(true);
   }
    return Result.success(false);
  }

  @override
  Future<MapByIdModel> getSpotById(int id) => _mapApi.getSpotById(id);

  @override
  Future<void> addReactions(String text, int score, int spotId) => _mapApi.addReactions(text, score, spotId);

  @override
  Future<MapModel> searchSpot(String name) => _mapApi.searchSpot(name);
}
