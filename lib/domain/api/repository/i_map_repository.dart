import 'package:ride_map/data/model/spot/spot_model.dart';

abstract class IMapRepository{
  Future<SpotModel> getSpot();
}