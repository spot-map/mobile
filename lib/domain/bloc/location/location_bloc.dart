import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/untils/enum/location_enum.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../data/map_page_models/map_model.dart';

part 'location_event.dart';

part 'location_state.dart';

final MapProvider _provider = MapProvider();

@Injectable()
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  List<MapObject> mapObjects = [];

  MapModel spot;

  LocationBloc({required this.locationRepository, required this.spot}) : super(LocationState()) {
    on<GetLocation>(_getLocationEvent);
  }

  final LocationRepository locationRepository;

  void _getLocationEvent(GetLocation event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));
      var _currentLocation = await locationRepository.getCurrentLocation();
      final spots = await _provider.getMap();
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
    }
  }
}