import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapProvider _provider = getIt();

  MapCubit() : super(const MapState()) {
    _onCreate();
  }

  _onCreate() {
    onGetSpots();
  }

  Future<void> onGetSpots() async {
    final spots = await _provider.getSpot();
    emit(state.copyWith(mapModel: spots, isLoading: false));
  }

  void onSearchSpot(String name) async {
    final searchedSpot = await _provider.searchSpot(name);
    emit(state.copyWith(mapModel: searchedSpot, isLoading: false));
  }
}