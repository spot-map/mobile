import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';

part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({Data? data}) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json) => _$TokenModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data(
      {String? token}) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}