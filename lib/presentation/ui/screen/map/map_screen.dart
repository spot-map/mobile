import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location/location_cubit.dart';
import 'package:ride_map/domain/bloc/spot/map_cubit.dart';
import 'package:ride_map/presentation/common/assets/app_assets.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/bottom_sheet.dart';
import 'package:ride_map/presentation/ui/widget/map/map_widget.dart';
import 'package:ride_map/until/yandex/map_object.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const path = 'map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, locationState) {
          return BlocBuilder<MapCubit, MapState>(
            builder: (context, mapState) {
             if(!mapState.isLoading){
               for (var element in mapState.mapModel!.data) {
                 mapObject.add(PlacemarkMapObject(
                     mapId: MapObjectId('spot ${element.id}'),
                     onTap: (PlacemarkMapObject self, Point point) => bottomSheet(context, element.id!),
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
      ),
    );
  }
}
