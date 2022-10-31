import 'package:equatable/equatable.dart';

class SpotData extends Equatable{
  String? name;
  String? coordinates;
  String? description;

  SpotData({this.name, this.coordinates, this.description});

  SpotData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coordinates = json['coordinates'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['coordinates'] = coordinates;
    data['description'] = description;
    return data;
  }

  @override
  List<Object?> get props => [name, coordinates, description];
}