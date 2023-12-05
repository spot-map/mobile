import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/location_cubit/location_cubit.dart';
import 'package:ride_map/domain/bloc/spot_cubit/map_cubit.dart';

import '../../../../data/map_page_models/map_model.dart';
import 'map_layout.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MapCubit>(create: (BuildContext context) => MapCubit(model: const MapModel())),
      BlocProvider<LocationCubit>(create: (BuildContext context) => LocationCubit()),
    ], child: MapLayout());
  }
}
