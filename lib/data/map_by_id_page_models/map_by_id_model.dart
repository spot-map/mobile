import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_by_id_model.freezed.dart';

part 'map_by_id_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class MapByIdModel with _$MapByIdModel {
  const factory MapByIdModel({
    Spot? data
  }) = _MapByIdModel;

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
      @Default([]) List<Images>? images,
      @Default([]) List<Reactions>? reactions}) = _Spot;

  factory Spot.fromJson(Map<String, Object?> json) => _$SpotFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    int? id,
    String? title,
    String? description,
    String? path,
  }) = _Images;

  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}

@freezed
class Reactions with _$Reactions {
  const factory Reactions({
    int? id,
    String? text,
    int? score,
  }) = _Reactions;

  factory Reactions.fromJson(Map<String, Object?> json) =>
      _$ReactionsFromJson(json);
}
