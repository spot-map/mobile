import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_cubit.dart';
import 'package:ride_map/domain/bloc/location/constants/location_enum.dart';
import 'package:ride_map/domain/bloc/location/location_bloc.dart';
import 'package:ride_map/domain/bloc/login/constants/login_status.dart';
import 'package:ride_map/domain/bloc/login/login_bloc.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/domain/bloc/theme/theme_bloc.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_screen.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<FavoriteCubit>(create: (_) => FavoriteCubit(model: const FavoriteModel())),
    BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
    BlocProvider<LocationBloc>(
        create: (context) => LocationBloc(
            locationRepository: context.read<LocationRepository>(),
            spot: const MapModel())
          ..add(GetLocation())),
    BlocProvider<SpotBloc>(
        create: (context) => SpotBloc(spot: const MapModel())..add(GetSpotList())),
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<SpotByIdBloc>(
        create: (context) => SpotByIdBloc(spotByIdModel: const MapByIdModel())),
  ];

  static final List<BlocListener> listener = [
    BlocListener<LocationBloc, LocationState>(listener: (context, state) {
      if (state.status == LocationStateStatus.error) {
        snackBar(state.errorMessage, context, true);
      }
    }),
    BlocListener<SpotBloc, SpotState>(listener: (context, state) {
      if (state.status == SpotStatus.error) {
        snackBar(state.errorMessage, context, true);
      }
    }),
    // BlocListener<FavoriteBloc, FavoriteState>(listener: (context, state) {
    //   if (state.status == FavoriteStatus.error) {
    //     snackBar(state.errorMessage, context, true);
    //   }
    //   if (state.status == FavoriteStatus.added) {
    //     snackBar('Спот добавлен в избранное', context, false);
    //   }
    // }),
    BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state.status == LoginStatus.logout) {
        const LoginScreen();
      }
    })
  ];
}
