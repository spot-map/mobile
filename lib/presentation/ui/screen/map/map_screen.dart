import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/location/location_cubit.dart';
import 'package:ride_map/domain/bloc/spot/map_cubit.dart';
import 'package:ride_map/presentation/ui/screen/map/map_layout.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const path = 'map';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MapCubit>(create: (BuildContext context) => MapCubit(model: const MapModel())),
      BlocProvider<LocationCubit>(create: (BuildContext context) => LocationCubit()),
    ], child: MapLayout());
  }
}
