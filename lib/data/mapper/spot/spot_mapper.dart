import 'package:ride_map/data/model/spot/spot_data.dart';
import 'package:ride_map/data/model/spot/spot_dto.dart';

class SpotMapper{
  static SpotData toModel (SpotDto dto) => SpotData(
    name: dto.name,
    coordinates: dto.coordinates,
    description: dto.description
  );
}