import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_map/data/user_models/user_model.dart';

part 'reactions_model.freezed.dart';

part 'reactions_model.g.dart';

@freezed
class ReactionsModel with _$ReactionsModel {
  const factory ReactionsModel({int? id, String? text, int? score, User? user}) =
      _ReactionsModel;

  factory ReactionsModel.fromJson(Map<String, Object?> json) =>
      _$ReactionsModelFromJson(json);
}
