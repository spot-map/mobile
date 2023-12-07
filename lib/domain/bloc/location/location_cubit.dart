import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/until/yandex/map_object.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  late StreamSubscription<Position> _positionStream;
  late LatLng? currentPosition;

  LocationCubit() : super(const LocationState()) {
    onGetLocation();
  }

  void onGetLocation() {
    Geolocator.checkPermission();
    if(Geolocator.checkPermission() == LocationPermission.denied){
      Geolocator.requestPermission();
    }
    _positionStream = Geolocator.getPositionStream().listen((event) {
      currentPosition = LatLng(event.latitude, event.longitude);
      addMapObject(latitude: event.latitude, longitude: event.longitude, objectId: 'user location', icon: 'assets/user_location.png');
      emit(state.copyWith(currentPosition: currentPosition));
    });
  }

  @override
  Future<void> close() {
    return Future.wait([
      _positionStream.cancel(),
    ]).then(
          (value) => super.close(),
    );
  }
}
