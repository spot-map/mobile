import '../user_models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reactions_model.freezed.dart';

part 'reactions_model.g.dart';

@freezed
class Reactions with _$Reactions {
  const factory Reactions({int? id, String? text, int? score, User? user}) =
      _Reactions;

  factory Reactions.fromJson(Map<String, Object?> json) =>
      _$ReactionsFromJson(json);
}
