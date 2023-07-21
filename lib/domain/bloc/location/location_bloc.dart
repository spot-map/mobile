import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../data/map_page_models/map_model.dart';
import 'constants/location_enum.dart';

part 'location_event.dart';

part 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final MapProvider _provider = getIt.get<MapProvider>();
  MapModel spot;

  LocationBloc({required this.locationRepository, required this.spot})
      : super(LocationState(initLocation: LatLng(40.4167, 3.70325))) {
    on<GetLocation>(_getLocationEvent);
  }

  final LocationRepository locationRepository;

  void _getLocationEvent(GetLocation event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));
      var _currentLocation = await locationRepository.getCurrentLocation();
      final spots = await _provider.getSpot();
      emit(
        state.copyWith(
          currentUserLocation: _currentLocation,
          status: LocationStateStatus.success,
          spot: spots,
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
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
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
