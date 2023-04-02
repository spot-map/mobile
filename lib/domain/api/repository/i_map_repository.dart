import 'package:injectable/injectable.dart';
import 'package:ride_map/data/spot_model/spot_model.dart';


abstract class IMapRepository{
  @module
  Future<SpotModel> getSpot();
}