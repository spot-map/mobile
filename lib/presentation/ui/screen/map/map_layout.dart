import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location/bloc/location_bloc.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/map/map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../widget/bottom_sheet/bottom_sheet.dart';
import '../../widget/map/location_error/location_error_widget.dart';

class MapLayout extends StatelessWidget {
  const MapLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MapObject> mapObjects = [];
    return Scaffold(
      appBar: const MyAppBar(title: 'Главная',),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LocationBloc, LocationState>(
        buildWhen: (previous, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            mapObjects.add(PlacemarkMapObject(
                mapId: const MapObjectId('user location'),
                onTap: (PlacemarkMapObject self, Point point) =>  bottomSheet(context, point.toString()),
                point: Point(
                  latitude:  state.currentUserLocation.latitude,
                  longitude: state.currentUserLocation.longitude,
                ),
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/user_location.png'), scale: 0.2))));
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
