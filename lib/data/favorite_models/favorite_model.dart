import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';

part 'favorite_model.freezed.dart';

part 'favorite_model.g.dart';

@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({@Default([]) List<FavoriteList> data}) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) => _$FavoriteModelFromJson(json);
}

@freezed
class FavoriteList with _$FavoriteList {
  const factory FavoriteList({int? id, Spot? spot}) = _FavoriteList;

  factory FavoriteList.fromJson(Map<String, Object?> json) => _$FavoriteListFromJson(json);
}
