import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/until/config/app_router.dart';
import 'package:ride_map/until/preferences/preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../until/theme/dark/app_colors_dark.dart';
import '../../../../until/theme/light/app_colors_light.dart';
import '../../screen/add_spot/add_spot_screen.dart';
import '../app_bar/app_bar.dart';

class MapWidget extends StatefulWidget {
  MapWidget(
      {Key? key, required this.currentUserLocation, required this.mapObjects})
      : super(key: key);

  final LatLng currentUserLocation;
  List<MapObject> mapObjects;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;
  Future<BicycleSessionResult>? result;
  BicycleSession? session;

  final List<BicycleSessionResult> results = [];


  Timer? timerRoute;
  int RouteId = 0;
  GlobalKey mapKey = GlobalKey();


  Future<void> requestRoutes(double lat, double lon, [bool? close]) async {
    RouteId += 1;
    timerRoute = await Timer.periodic(
        const Duration(seconds: 1),
            (timerRoute) async {
          var resultWithSession = YandexBicycle.requestRoutes(
              bicycleVehicleType: BicycleVehicleType.bicycle,
              points: [
                RequestPoint(
                    point: Point(latitude: widget.currentUserLocation.latitude,
                        longitude: widget.currentUserLocation.longitude),
                    requestPointType: RequestPointType.wayPoint),
                RequestPoint(
                    point: Point(
                      latitude: lat,
                      longitude: lon,),
                    requestPointType: RequestPointType.wayPoint),
              ]);
          result = resultWithSession.result;
          session = resultWithSession.session;
          await _handleResult(await result!);
        });
  }

  Future<void> _handleResult(BicycleSessionResult result) async {
    setState(() { results.add(result); });
    setState(() {
      result.routes!.asMap().forEach((i, route) {
        widget.mapObjects.add(PolylineMapObject(
          mapId: MapObjectId('route_${i}_polyline'),
          polyline: Polyline(points: route.geometry),
          strokeColor: Color(0xFf7BB4F4),
          strokeWidth: 3,
        ));
      });
    });
  }

  stopTimer() {
    timerRoute?.cancel();
  }

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
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: MyAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            size: 50,
            title: 'Главная',
            widgetRight: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddSpotScreen(
                                  currentUserLocation: widget
                                      .currentUserLocation,
                                )));
                  },
                  child: Icon(Icons.add,
                      size: 20,
                      color: Prefs.getBool('theme')!
                          ? AppColorDark().backButtonColor
                          : AppColorLight().backButtonColor),
                ),
              ),
            ],
          ),
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

