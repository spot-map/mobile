import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/internal/entity/result.dart';

abstract class IMapRepository {
  Future<MapModel> getSpot();

  Future<Result<bool>> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getSpotById(int id);

  Future<void> addReactions(String text, int score, int spotId);

  Future<void> addImage(int id, List<XFile>? images);

  Future<MapModel> searchSpot(String name);
}
