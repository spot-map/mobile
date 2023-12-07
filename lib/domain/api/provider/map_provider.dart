import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/internal/entity/result.dart';

abstract class MapProvider {
  Future<MapModel> getSpot();

  Future<Result<bool>> addSpot(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getSpotById(int id);

  Future<void> addReactions(String text, int score, int spotId);

  Future<MapModel> searchSpot(String name);
}

class MapProviderImpl implements MapProvider {
  final IMapRepository _mapRepository = getIt();

  @override
  Future<MapModel> getSpot() => _mapRepository.getSpot();

  @override
  Future<Result<bool>> addSpot(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images) async{
    await _mapRepository.addSpot(name, address, description, latitude, longitude, images);
    return Result.success(true);
  }

  @override
  Future<MapByIdModel> getSpotById(int id) => _mapRepository.getSpotById(id);

  @override
  Future<void> addReactions(String text, int score, int spotId) => _mapRepository.addReactions(text, score, spotId);

  @override
  Future<MapModel> searchSpot(String name) => _mapRepository.searchSpot(name);
}
