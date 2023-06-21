import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/location/location_barrel.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

import '../enum/location_enum.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<LocationBloc>(create: (context) => LocationBloc(locationRepository: context.read<LocationRepository>(), spot: MapModel())..add(GetLocation())),
    BlocProvider<SpotBloc>(create: (context) => SpotBloc(spot: MapModel())..add(GetSpotList()))
  ];

  static final List<BlocListener> listener = [
    BlocListener<LocationBloc, LocationState>(listener: (context, state) {
      if (state.status == LocationStateStatus.error) {
        snackBar(state.errorMessage, context);
      }
    }),
    BlocListener<SpotBloc,SpotState>(listener: (context,state){
      if (state.status == LocationStateStatus.error) {
        snackBar(state.errorMessage, context);
      }
    })
  ];
}
