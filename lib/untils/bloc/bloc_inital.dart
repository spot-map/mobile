import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<SpotBloc>(create: (_) => SpotBloc()..add(GetSpots())),
  ];

  static final List<BlocListener> listener = [
    BlocListener<SpotBloc, SpotState>(listener: (context, state) {
      if (state is SpotError) {
        snackBar(state.message!, context);
      }
    }),

  ];
}
