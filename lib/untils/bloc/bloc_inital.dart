import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/domain/bloc/location/location_barrel.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<LocationBloc>(create: (context) => LocationBloc(locationRepository: context.read<LocationRepository>())..add(GetLocation()))
  ];

  static final List<BlocListener> listener = [
    BlocListener<SpotBloc, SpotState>(listener: (context, state) {
      if (state.status == RequestStatus.loaded) {
        snackBar(state.message, context);
      }
    }),

  ];
}
