import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/bloc/location/location_bloc.dart';
import 'package:ride_map/untils/enum/location_enum.dart';

part 'spot_event.dart';
part 'spot_state.dart';

final MapProvider _provider = MapProvider();

class SpotBloc extends Bloc<SpotEvent, SpotState> {
  MapModel? spot;
  int id = 1;
  SpotBloc({required this.spot}) : super(SpotState()) {
    on<GetSpotList>(_onGetSpotList);
  }


  void _onGetSpotList(GetSpotList event, Emitter<SpotState> emit) async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));
      final spots = await _provider.getMap();
      emit(
        state.copyWith(
          status: LocationStateStatus.success,
          spot: spots,
        ),
      );
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
