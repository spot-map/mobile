import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/model/spot/spot_model.dart';
import 'package:ride_map/domain/api/service/map_service.dart';

part 'spot_event.dart';
part 'spot_state.dart';

final MapService service = MapService();

class SpotBloc extends Bloc<SpotEvent, SpotState> {
  SpotBloc() : super(SpotInitial()) {
    on<GetSpots>(_onGetSpots);
  }

  void _onGetSpots(GetSpots event, Emitter<SpotState> emit) async{
      emit(SpotLoading());
      final spots = await service.getSpot();
      emit(SpotLoaded(spots));
      if(spots.error != null){
        emit(SpotError(spots.error));
      }
  }
}
