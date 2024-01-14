import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_map/presentation/common/assets/app_assets.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/cubit/spot/cubit.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/ui/screen/map/map_widget.dart';
import 'package:ride_map/until/yandex/map_object.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const path = 'map';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, locationState) {
        return BlocBuilder<MapCubit, MapState>(
          builder: (context, mapState) {
            if (!mapState.isLoading) {
              for (var element in mapState.mapModel!.data) {
                mapObject.add(PlacemarkMapObject(
                    mapId: MapObjectId('spot ${element.id}'),
                    onTap: (PlacemarkMapObject self, Point point) => context.push(AppRoutes.spotById, extra: element.id),
                    point: Point(
                      latitude: element.latitude!,
                      longitude: element.longitude!,
                    ),
                    icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(AppAssets.spotMapIcon), scale: 0.2))));
              }
            }

            return mapState.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MapWidget(
                    currentUserLocation: locationState.currentPosition!,
                    mapObjects: mapObject,
                  );
          },
        );
      },
    );
  }
}
