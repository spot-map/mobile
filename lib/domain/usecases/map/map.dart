import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/domain/data/api/map_api.dart';
import 'package:ride_map/domain/entities/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/domain/entities/map_models/map_model.dart';
import 'package:ride_map/domain/entities/common/result.dart';

abstract class MapUseCase {
  Future<Result<MapModel>> get();

  Future<Result<MapByIdModel>> getById(int id);

  Future<Result<MapModel>> search(String name);

  Future<Result<bool>> comment(String text, int score, int spotId);

  Future<Result<MapByIdModel>> create(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images);

  Future<Result<bool>> addImage(int id, List<XFile>? images);
}

class MapUseCaseImpl implements MapUseCase {
  final MapApi _mapApi = getIt();

  @override
  Future<Result<MapModel>> get() async {
    late final MapModel map;
    try {
      map = await _mapApi.get();
    } catch (e, s) {
      log('$e, $s', name: 'getSpot');
      return Result.failure("Не удалось получить спот.");
    }
    return Result.success(map);
  }

  @override
  Future<Result<MapByIdModel>> getById(int id) async {
    late final MapByIdModel byId;
    try {
      byId = await _mapApi.getById(id);
    } catch (e, s) {
      log('$e, $s', name: 'getSpotById');
      return Result.failure('Не удалость получить спот по Id.');
    }
    return Result.success(byId);
  }

  @override
  Future<Result<MapModel>> search(String name) async {
    late final MapModel map;
    try {
      map = await _mapApi.search(name);
    } catch (e, s) {
      log('$e, $s', name: 'searchSpot');
      return Result.failure('Не удалость найти спот.');
    }
    return Result.success(map);
  }

  @override
  Future<Result<MapByIdModel>> create(
      String name, String address, String description, double latitude, double longitude, List<XFile>? images) async {
    late final MapByIdModel addedSpot;
    try {
      addedSpot = await _mapApi.create(name, address, description, latitude, longitude, images);
    } catch (e, s) {
      log('$e, $s', name: 'addSpot');
      return Result.failure('Не удалость создать спот.');
    }
    return Result.success(addedSpot);
  }

  @override
  Future<Result<bool>> comment(String text, int score, int spotId) async {
    late final bool isCommented;
    try {
      isCommented = await _mapApi.comment(text, score, spotId);
    } catch (e, s) {
      log('$e, $s', name: 'addReaction');
      return Result.failure('Не отправить отправить реакцию');
    }

    return Result.success(isCommented);
  }

  @override
  Future<Result<bool>> addImage(int id, List<XFile>? images) async {
    late final bool isImageAdded;
    try {
      isImageAdded = await _mapApi.addImage(id, images);
    } catch (e, s) {
      log('$e, $s', name: 'addImage');
      return Result.failure('Не удалость добавить изображение.');
    }

    return Result.success(isImageAdded);
  }
}
