import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/common/theme/base/app_color.dart';
import 'package:ride_map/presentation/ui/screens/map/cubit.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/page/common_scaffold.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.currentUserLocation,
    required this.mapObjects,
    // required this.bottomSheet
  }) : super(key: key);

  final LatLng currentUserLocation;
  final List<MapObject> mapObjects;

  // final Widget bottomSheet;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;

  _onMapCreated(YandexMapController yandexMapController) async {
    controller = yandexMapController;
    await controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(latitude: widget.currentUserLocation.latitude, longitude: widget.currentUserLocation.longitude),
        zoom: 14.5)));
    print('Object ${widget.mapObjects}');
    await controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(latitude: widget.currentUserLocation.latitude, longitude: widget.currentUserLocation.longitude),
        zoom: 17)));
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      message: context.read<MapCubit>().messageStream,
      onMessage: (message) {
        snackBar(message: message, context: context, isError: true);
      },
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      // bottomSheet: widget.bottomSheet,
      appBar: MyAppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        isMapScreen: true,
        size: 50,
        title: 'Главная',
        widgetRight: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.addSpot, extra: widget.currentUserLocation);
              },
              child: Icon(Icons.add, size: 20, color: context.colors.backButtonColor),
            ),
          ),
        ],
      ),
      child: YandexMap(
        mapType: MapType.map,
        mapObjects: widget.mapObjects,
        onMapCreated: _onMapCreated,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        scrollGesturesEnabled: true,
        modelsEnabled: true,
        fastTapEnabled: false,
        mode2DEnabled: false,
      ),
    );
  }
}
