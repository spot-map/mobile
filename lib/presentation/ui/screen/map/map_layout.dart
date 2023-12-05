import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location_cubit/location_cubit.dart';
import 'package:ride_map/domain/bloc/spot_cubit/map_cubit.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/bottom_sheet.dart';
import 'package:ride_map/presentation/ui/widget/map/map_widget.dart';
import 'package:ride_map/until/yandex/map_object.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapLayout extends StatelessWidget {
  MapLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, locationState) {
          return BlocBuilder<MapCubit, MapState>(
            builder: (context, mapState) {
              for (var element in mapState.mapModel!.data) {
                mapObject!.add(PlacemarkMapObject(
                    mapId: MapObjectId('spot ${element.id}'),
                    onTap: (PlacemarkMapObject self, Point point) => bottomSheet(context, element.id!),
                    point: Point(
                      latitude: element.latitude!,
                      longitude: element.longitude!,
                    ),
                    icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('assets/spot_location.png'), scale: 0.2))));
              }

              return mapState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : MapWidget(
                      currentUserLocation: locationState.currentPosition!,
                      mapObjects: mapObject!,
                    );
            },
          );
        },
      ),
    );
  }
}
