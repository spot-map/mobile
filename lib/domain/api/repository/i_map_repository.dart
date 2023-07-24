import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';

abstract class IMapRepository {
  @module
  Future<MapModel> getSpot();

  @module
  Future<void> addSpot(String name, String address, String description, double latitude, double longitude);

  @module
  Future<MapByIdModel> getSpotById(int id);

  @module
  Future<void> addReactions(String text, double score, int spotId);
}
