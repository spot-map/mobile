import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_model.freezed.dart';

part 'images_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

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
