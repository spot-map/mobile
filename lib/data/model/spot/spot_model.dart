import 'spot_data.dart';

class SpotModel {
  List<SpotData>? data;
  String? error;

  SpotModel({this.data});

  SpotModel.withError(String message) {
    error = message;
  }

  SpotModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SpotData>[];
      json['data'].forEach((v) {
        data!.add(SpotData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

