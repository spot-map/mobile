import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_model.freezed.dart';

part 'map_model.g.dart';


@freezed
class MapModel with _$MapModel {
  const factory MapModel({@Default([]) List<Spots> data}) = _MapModel;

  factory MapModel.fromJson(Map<String, Object?> json) =>
      _$MapModelFromJson(json);
}

@freezed
class Spots with _$Spots {
  const factory Spots({
    int? id,
    String? name,
    String? address,
    String? description,
    double? latitude,
    double? longitude,
    bool? isInFavorite
  }) = _Spots;

  factory Spots.fromJson(Map<String, Object?> json) => _$SpotsFromJson(json);
}
