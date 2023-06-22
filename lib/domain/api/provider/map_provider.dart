import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/domain/api/service/map_service.dart';

@injectable
class MapProvider implements IMapRepository {
  final _mapService = MapService();

  // Future<MapModel> getMap() async{
  //   return _mapService.getSpot();
  // }

  @override
  Future<MapModel> getSpot() async {
    return _mapService.getSpot();
  }
}

class NetworkError extends Error {}
