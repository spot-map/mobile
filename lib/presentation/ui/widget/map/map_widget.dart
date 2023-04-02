import 'package:flutter/material.dart';
import 'package:location_repository/location_repository.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController? controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            styleString:
                'mapbox://styles/iwasyourtomb/cladyfnht000h14pdrzooa5bm',
            accessToken: dotenv.get('MAPBOX_ACCESS_TOKEN'),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            trackCameraPosition: true,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.currentUserLocation.latitude,
                  widget.currentUserLocation.longitude,
                ),
                zoom: 9.0),
            onMapClick: (_, latlng) async {
              await mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    bearing: 10.0,
                    target: LatLng(
                      latlng.latitude,
                      latlng.longitude,
                    ),
                    tilt: 30.0,
                    zoom: 12.0,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
