import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/domain/api/service/map_service.dart';

@injectable
class MapProvider implements IMapRepository {
  final _mapService = MapService();

  @override
  Future<MapModel> getSpot() async {
    return _mapService.getSpot();
  }

  @override
  Future<MapByIdModel> getSpotById(int id) {
    return _mapService.getSpotById(id);
  }

  @override
  Future<void> addSpotToFavorite(int id) {
   return _mapService.addSpotToFavorite(id);
  }
}

class NetworkError extends Error {}
