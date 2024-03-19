import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_map/domain/entities/image_models/images_model.dart';
import 'package:ride_map/domain/entities/reactions_models/reactions_model.dart';

part 'map_by_id_model.freezed.dart';

part 'map_by_id_model.g.dart';

@freezed
class MapByIdModel with _$MapByIdModel {
  const factory MapByIdModel({Spot? data}) = _MapByIdModel;

  factory MapByIdModel.fromJson(Map<String, Object?> json) => _$MapByIdModelFromJson(json);
}

@freezed
class Spot with _$Spot {
  const factory Spot(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      bool? isInFavorite,
      @Default([]) List<ImagesModel>? images,
      @Default([]) List<ReactionsModel>? reactions}) = _Spot;

  factory Spot.fromJson(Map<String, Object?> json) => _$SpotFromJson(json);
}
