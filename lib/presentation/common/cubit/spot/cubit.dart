import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/usecases/map_uses_case.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class MapCubit extends Cubit<MapState> {
  final MapUseCase _mapUseCase = getIt();

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

  void onSearchSpot(String name) async {
    final searchedSpot = await _mapUseCase.searchSpot(name);
    emit(state.copyWith(mapModel: searchedSpot, isLoading: false));
  }
}
