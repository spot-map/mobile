import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_model.freezed.dart';

part 'map_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class MapModel with _$MapModel {
  const factory MapModel({String? name, String? description}) = _MapModel;

  factory MapModel.fromJson(Map<String, Object?> json) =>
      _$MapModelFromJson(json);
}
