import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_model/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/location/location_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_widget.dart';
import 'package:ride_map/presentation/ui/widget/map/location_error/location_error_widget.dart';

class ByIdLayout extends StatelessWidget {
  ByIdLayout({Key? key, this.id}) : super(key: key);
  int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotByIdBloc>(
      create: (context) =>
          SpotByIdBloc(spotByIdModel: MapByIdModel())..add(GetSpotById(id!)),
      child: BlocBuilder<SpotByIdBloc, SpotByIdState>(
        buildWhen: (previous, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            return byIdWidget(context, state.spotById!);
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
