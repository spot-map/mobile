import 'package:flutter/material.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/untils/config/app_router.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  MapWidget(
      {Key? key, required this.currentUserLocation, required this.mapObjects})
      : super(key: key);

  final CurrentUserLocationEntity currentUserLocation;
  List<MapObject> mapObjects;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;
  GlobalKey mapKey = GlobalKey();

  _onMapCreated(YandexMapController yandexMapController) async {
    controller = yandexMapController;
    await controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(
            latitude: widget.currentUserLocation.latitude,
            longitude: widget.currentUserLocation.longitude),
        zoom: 14.5)));
    print('Object ${widget.mapObjects}');
    await controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(
            latitude: widget.currentUserLocation.latitude,
            longitude: widget.currentUserLocation.longitude),
        zoom: 17)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRouter.pushNamed('/listSpot');
          },
          child: const Icon(Icons.list),
        ),
        body: YandexMap(
          key: mapKey,
          mapType: MapType.map,
          mapObjects: widget.mapObjects,
          nightModeEnabled: Prefs.getBool('theme')!,
          onMapCreated: _onMapCreated,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          scrollGesturesEnabled: true,
          modelsEnabled: true,
          fastTapEnabled: false,
          mode2DEnabled: false,
        ));
  }
}
