import 'package:freezed_annotation/freezed_annotation.dart';

import '../image_models/images_model.dart';
import '../reactions_models/reactions_model.dart';

part 'map_by_id_model.freezed.dart';

part 'map_by_id_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class MapByIdModel with _$MapByIdModel {
  const factory MapByIdModel({Spot? data}) = _MapByIdModel;

  factory MapByIdModel.fromJson(Map<String, Object?> json) =>
      _$MapByIdModelFromJson(json);
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
      @Default([]) List<Images>? images,
      @Default([]) List<Reactions>? reactions}) = _Spot;

  factory Spot.fromJson(Map<String, Object?> json) => _$SpotFromJson(json);
}
