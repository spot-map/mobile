import 'package:flutter/material.dart';
import 'package:location_repository/location_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.currentUserLocation,
  }) : super(key: key);

  final CurrentUserLocationEntity currentUserLocation;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;
  GlobalKey mapKey = GlobalKey();
  List<MapObject> mapObjects = [];

  _onMapCreated(YandexMapController yandexMapController) async {
    controller = yandexMapController;
    mapObjects.add(PlacemarkMapObject(
        mapId: MapObjectId('user location'),
        point: Point(
          latitude:  widget.currentUserLocation.latitude, // real geoLocation _geolocation!.latitude.toDouble()  44.507340
          longitude: widget.currentUserLocation.longitude, // real _geolocation!.longitude.toDouble()   33.598426
        ),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
                'assets/user_location.png'), scale: 0.2))));
    print('Object $mapObjects');
    await controller.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: Point(
            latitude:  widget.currentUserLocation.latitude, longitude:  widget.currentUserLocation.longitude),
            zoom: 14.5)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
              key: mapKey,
              mapObjects: mapObjects,
              onMapCreated: _onMapCreated,

          )
        ],
      ),
    );
  }
}
