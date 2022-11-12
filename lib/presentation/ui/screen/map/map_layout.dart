import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location/bloc/location_bloc.dart';
import 'package:ride_map/presentation/ui/widget/map/map_widget.dart';

import '../../widget/map/location_error/location_error_widget.dart';

class MapLayout extends StatelessWidget {
  const MapLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        buildWhen: (previous, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            return MapWidget(
              currentUserLocation: state.currentUserLocation,
            );
          }
          if (state.status.isError) {
            return LocationErrorWidget(
              errorMessage: state.errorMessage,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
