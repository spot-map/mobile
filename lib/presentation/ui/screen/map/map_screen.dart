import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/data/map_model/map_model.dart';

import '../../../../domain/bloc/location/location_barrel.dart';
import 'map_layout.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LocationRepository(),
      child: BlocProvider<LocationBloc>(
        create: (context) => LocationBloc(
          locationRepository: context.read<LocationRepository>(),
          // spot: MapModel()
        )..add(GetLocation()),
        child: const MapLayout(),
      ),
    );
  }
}