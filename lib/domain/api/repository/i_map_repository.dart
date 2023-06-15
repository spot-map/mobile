import 'package:injectable/injectable.dart';
import 'package:ride_map/data/spot_model/map_model.dart';


abstract class IMapRepository{
  @module
  Future<MapModel> getSpot();
}