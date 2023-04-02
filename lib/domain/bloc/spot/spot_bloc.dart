import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/spot_model/spot_model.dart';
import 'package:ride_map/domain/api/service/map_service.dart';

part 'spot_event.dart';

part 'spot_state.dart';

@injectable
class SpotBloc extends Bloc<SpotEvent, SpotState> {
  final MapService service = MapService();
  SpotModel spotModel;

  SpotBloc(this.spotModel) : super(SpotState(spot: spotModel)) {
    on<GetSpots>(_onGetSpots);
  }

  void _onGetSpots(GetSpots event, Emitter<SpotState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final spots = await service.getSpot();
    emit(state.copyWith(status: RequestStatus.loading));
    // if (spots.error != null) {
    //   emit(state.copyWith(status: RequestStatus.failure));
    // }
  }
}
