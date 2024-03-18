import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_models/map_model.dart';
import 'package:ride_map/domain/usecases/api/map.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class MapCubit extends Cubit<MapState> {
  final MapUseCase _mapUseCase = getIt();
  final TextEditingController searchController = TextEditingController();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  MapCubit() : super(const MapState()) {
    _onCreate();
  }

  _onCreate() {
    onGetSpots();
  }

  Future<void> onGetSpots() async {
    final spots = await _mapUseCase.get();
    if (spots.isSuccess) {
      emit(state.copyWith(mapModel: spots.value, isLoading: false));
    } else {
      _messageController.add(spots.message);
      return;
    }
  }

  void onSearchSpot() async {
    final searchedSpot = await _mapUseCase.search(searchController.text);
    if (searchedSpot.isSuccess) {
      emit(state.copyWith(mapModel: searchedSpot.value, isLoading: false));
    } else {
      _messageController.add(searchedSpot.message);
      return;
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    _messageController.close();
    return super.close();
  }
}
