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

  MapCubit() : super(const MapState()) {
    _onCreate();
  }

  _onCreate() {
    onGetSpots();
  }

  Future<void> onGetSpots() async {
    final spots = await _mapUseCase.getSpot();
    emit(state.copyWith(mapModel: spots, isLoading: false));
  }

  void onSearchSpot() async {
    final searchedSpot = await _mapUseCase.searchSpot(searchController.text);
    emit(state.copyWith(mapModel: searchedSpot, isLoading: false));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
