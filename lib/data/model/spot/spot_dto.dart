import 'package:json_annotation/json_annotation.dart';

part 'spot_dto.g.dart';

@JsonSerializable()
class SpotDto {
  SpotDto({
    required this.name,
    required this.coordinates,
    required this.description,
  });

  final String? name;
  final String? coordinates;
  final String? description;

  factory SpotDto.fromJson(Map<String, dynamic> json) =>
      _$SpotDtoFromJson(json);
}
