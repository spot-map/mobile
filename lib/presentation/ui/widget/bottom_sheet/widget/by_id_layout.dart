import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/favorite/constants/favorite_status.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/constants/by_id_status.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_widget.dart';
import 'package:ride_map/presentation/ui/widget/map/location_error/location_error_widget.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class ByIdLayout extends StatelessWidget {
  ByIdLayout({Key? key, this.id}) : super(key: key);
  int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotByIdBloc>(
      create: (context) =>
          SpotByIdBloc(spotByIdModel: MapByIdModel())..add(GetSpotById(id!)),
      child: BlocBuilder<SpotByIdBloc, SpotByIdState>(
        builder: (context, state) {
          if (state.status == ByIdStatus.loaded) {
            return byIdWidget(context, state.spotById!);
          }
          if (state.status == ByIdStatus.error) {
            return LocationErrorWidget(
              errorMessage: state.errorMessage,
            );
          }

          if(FavoriteState().status == FavoriteStatus.added){
            snackBar('Спот добавлен в избранное', context, false);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
