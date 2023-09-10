import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location/location_bloc.dart';
import 'package:ride_map/presentation/ui/widget/map/map_widget.dart';
import 'package:ride_map/until/dev.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


import '../../widget/bottom_sheet/bottom_sheet.dart';
import '../../widget/map/location_error/location_error_widget.dart';

class MapLayout extends StatelessWidget {
  const MapLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<MapObject> mapObjects = [];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LocationBloc, LocationState>(
        buildWhen: (previous, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            Dev.log('SPOTS ${state.spot!.data.length}');

            for (var element in state.spot!.data) {
              mapObjects.add(PlacemarkMapObject(
                  mapId: MapObjectId('spot ${element.id}'),
                  onTap: (PlacemarkMapObject self, Point point) =>
                      bottomSheet(context, element.id!),
                  point: Point(
                    latitude: element.latitude!,
                    longitude: element.longitude!,
                  ),
                  icon: PlacemarkIcon.single(PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                          'assets/spot_location.png'),
                      scale: 0.2))));
            }

            mapObjects.add(PlacemarkMapObject(
                mapId: const MapObjectId('user location'),
                point: Point(
                  latitude: state.currentUserLocation.latitude,
                  longitude: state.currentUserLocation.longitude,
                ),
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/user_location.png'),
                    scale: 0.2))));
            return MapWidget(
              currentUserLocation: state.currentUserLocation,
              mapObjects: mapObjects,
            );
          }
          if (state.status.isError) {
            return LocationErrorWidget(
              errorMessage: state.errorMessage,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
