import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';

abstract class IMapRepository {
  @module
  Future<MapModel> getSpot();
}
