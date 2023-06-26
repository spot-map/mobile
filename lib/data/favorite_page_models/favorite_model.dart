import 'package:freezed_annotation/freezed_annotation.dart';

import '../map_by_id_page_models/map_by_id_model.dart';

part 'favorite_model.freezed.dart';

part 'favorite_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
   @Default([]) List<FavoriteList> data
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) =>
      _$FavoriteModelFromJson(json);
}

@freezed
class FavoriteList with _$FavoriteList {
  const factory FavoriteList({
    int? id,
    Spot? spot
  }) = _FavoriteList;

  factory FavoriteList.fromJson(Map<String, Object?> json) =>
      _$FavoriteListFromJson(json);
}


