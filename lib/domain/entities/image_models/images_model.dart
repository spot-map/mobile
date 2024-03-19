import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_model.freezed.dart';

part 'images_model.g.dart';

@freezed
class ImagesModel with _$ImagesModel {
  const factory ImagesModel({
    int? id,
    String? title,
    String? description,
    String? path,
  }) = _ImagesModel;

  factory ImagesModel.fromJson(Map<String, Object?> json) => _$ImagesModelFromJson(json);
}
