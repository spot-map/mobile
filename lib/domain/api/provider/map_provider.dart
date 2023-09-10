import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class MapProvider {
  final _mapRepository = getIt.get<IMapRepository>();

  Future<MapModel> getSpot() => _mapRepository.getSpot();

  Future<void> addSpot(String name, String address, String description,
          double latitude, double longitude, List<XFile>? images) =>
      _mapRepository.addSpot(
          name, address, description, latitude, longitude, images);

  Future<MapByIdModel> getSpotById(int id) => _mapRepository.getSpotById(id);

  Future<void> addReactions(String text, int score, int spotId) =>
      _mapRepository.addReactions(text, score, spotId);

  Future<MapModel> searchSpot(String name) => _mapRepository.searchSpot(name);
}

class NetworkError extends Error {}
