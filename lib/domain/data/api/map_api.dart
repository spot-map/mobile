import 'package:image_picker/image_picker.dart';
import 'package:ride_map/domain/entities/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/domain/entities/map_models/map_model.dart';

abstract class MapApi {
  Future<MapModel> get();

  Future<MapByIdModel> create(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<MapByIdModel> getById(int id);

  Future<bool> comment(String text, int score, int spotId);

  Future<bool> addImage(int id, List<XFile>? images);

  Future<MapModel> search(String name);
}
