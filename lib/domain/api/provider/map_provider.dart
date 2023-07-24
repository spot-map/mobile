import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class MapProvider  {
  final _mapService = getIt.get<IMapRepository>();

  Future<MapModel> getSpot() async {
    return _mapService.getSpot();
  }

  Future<MapByIdModel> getSpotById(int id) {
    return _mapService.getSpotById(id);
  }

  Future<void> addReactions(String text, double score, int spotId){
    return _mapService.addReactions(text, score, spotId);
  }

  Future<void> addSpot(String name, String address, String description, double latitude, double longitude){
    return _mapService.addSpot(name, address, description, latitude, longitude);
  }

}

class NetworkError extends Error {}
