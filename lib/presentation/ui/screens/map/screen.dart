import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_map/presentation/common/assets/app_assets.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/ui/screens/map/widget/list_widget.dart';
import 'package:ride_map/presentation/ui/screens/map/widget/map_widget.dart';
import 'package:ride_map/domain/entities/common/map_object.dart';

import 'cubit.dart';

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
                addMapObject(
                    onTap: () {
                      context.push(AppRoutes.spotById, extra: element.id);
                    },
                    latitude: element.latitude!,
                    longitude: element.longitude!,
                    objectId: element.id.toString(),
                    icon: AppAssets.spotMapIcon);
              }
            }

            return mapState.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MapWidget(
                    currentUserLocation: locationState.currentPosition!,
                    mapObjects: mapObject,
                    // bottomSheet: DraggableScrollableSheet(
                    //     initialChildSize: 0.13,
                    //     maxChildSize: 0.9,
                    //     minChildSize: 0.13,
                    //     expand: false,
                    //     snap: true,
                    //     snapAnimationDuration:
                    //         const Duration(milliseconds: 150),
                    //     builder: (context, scrollController) =>
                    //         SingleChildScrollView(
                    //             controller: scrollController,
                    //             child: SpotList(
                    //                 model: mapState.mapModel!))),
                  );
          },
        );
      },
    );
  }
}
