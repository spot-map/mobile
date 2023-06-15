import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:location_repository/location_repository.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
// import 'package:ride_map/data/model/spot/map_model.dart';
import 'package:ride_map/domain/api/service/map_service.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/enum/location_enum.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'location_event.dart';

part 'location_state.dart';

final MapProvider _provider = MapProvider();

@Injectable()
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  List<MapObject> mapObjects = [];
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

      mapObjects.add(PlacemarkMapObject(
          mapId: const MapObjectId('user location'),
          point: Point(
            latitude:  _currentLocation.latitude,
            longitude: _currentLocation.longitude,
          ),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                  'assets/user_location.png'), scale: 0.2))));


      emit(
        state.copyWith(
          currentUserLocation: _currentLocation,
          status: LocationStateStatus.success,
          mapObjects: mapObjects
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
