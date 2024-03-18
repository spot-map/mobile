import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/data/map_models/map_model.dart';
import 'package:ride_map/data/result_entity/result.dart';
import 'package:ride_map/domain/api/map_api.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class MapUseCase {
  Future<Result<MapModel>> getSpot();

  Future<Result<MapByIdModel>> getSpotById(int id);

  Future<Result<MapModel>> searchSpot(String name);

  Future<Result<bool>> addReactions(String text, int score, int spotId);

  Future<Result<MapByIdModel>> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<Result<bool>> addImage(int id, List<XFile>? images);
}

class MapUseCaseImpl implements MapUseCase {
  final MapApi _mapApi = getIt();

  @override
  Future<Result<MapModel>> getSpot() async {
    late final MapModel map;
    try {
      map = await _mapApi.getSpot();
    } catch (e, s) {
      log('$e, $s', name: 'getSpot');
      return Result.failure("Не удалось получить спот.");
    }
    return Result.success(map);
  }

  @override
  Future<Result<MapByIdModel>> getSpotById(int id) async {
    late final MapByIdModel byId;
    try {
      byId = await _mapApi.getSpotById(id);
    } catch (e, s) {
      log('$e, $s', name: 'getSpotById');
      return Result.failure('Не удалость получить спот по Id.');
    }
    return Result.success(byId);
  }

  @override
  Future<Result<MapModel>> searchSpot(String name) async {
    late final MapModel map;
    try {
      map = await _mapApi.searchSpot(name);
    } catch (e, s) {
      log('$e, $s', name: 'searchSpot');
      return Result.failure('Не удалость найти спот.');
    }
    return Result.success(map);
  }

  @override
  Future<Result<MapByIdModel>> addSpot(String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    late final MapByIdModel addedSpot;
    try {
      addedSpot = await _mapApi.addSpot(name, address, description, latitude, longitude, images);
    } catch (e, s) {
      log('$e, $s', name: 'addSpot');
      return Result.failure('Не удалость создать спот.');
    }
    return Result.success(addedSpot);
  }

  @override
  Future<Result<bool>> addReactions(String text, int score, int spotId) async{
    late final bool isReactionAdded;
    try{
      isReactionAdded = await _mapApi.addReactions(text, score, spotId);
    }catch(e,s){
      log('$e, $s', name: 'addReaction');
      return Result.failure('Не отправить отправить реакцию');
    }

    return Result.success(isReactionAdded);
  }

  @override
  Future<Result<bool>> addImage(int id, List<XFile>? images) async {
    late final bool imageAdded;
    try {
      imageAdded = await _mapApi.addImage(id, images);
    } catch (e, s) {
      log('$e, $s', name: 'addImage');
      return Result.failure('Не удалость добавить изображение.');
    }

    return Result.success(imageAdded);
  }
}
