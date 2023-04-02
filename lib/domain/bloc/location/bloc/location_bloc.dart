import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:location_repository/location_repository.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:ride_map/data/model/spot/spot_model.dart';
import 'package:ride_map/domain/api/service/map_service.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/enum/location_enum.dart';

part 'location_event.dart';

part 'location_state.dart';

final MapService service = MapService();
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    required this.locationRepository,
  }) : super(LocationState()) {
    on<GetLocation>(_getLocationEvent);
  }

  final LocationRepository locationRepository;

  void _getLocationEvent(GetLocation event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));

      var _currentLocation = await locationRepository.getCurrentLocation();


      emit(
        state.copyWith(
          currentUserLocation: _currentLocation,
          status: LocationStateStatus.success,
        ),
      );
    } on CurrentLocationFailure catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.error,
        ),
      );
      addError(e);
    }
  }
}
