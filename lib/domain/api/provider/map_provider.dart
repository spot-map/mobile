import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/service/map_service.dart';
import '../../../data/map_model/map_model.dart';


@Injectable()
class MapProvider{
  final _mapService = MapService();

  Future<MapModel> getMap() async{
    return _mapService.getSpot();
  }
}

class NetworkError extends Error {}