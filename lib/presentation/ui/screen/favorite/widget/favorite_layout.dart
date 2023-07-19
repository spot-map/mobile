import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/bloc/favorite/constants/favorite_status.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';
import 'package:ride_map/presentation/ui/screen/favorite/widget/favorite_widget.dart';
import 'package:ride_map/presentation/ui/widget/loading/skeleton_loading.dart';
import 'package:ride_map/presentation/ui/widget/map/location_error/location_error_widget.dart';
import 'package:ride_map/untils/dev.dart';

class FavoriteLayout extends StatelessWidget {
  const FavoriteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider<FavoriteBloc>(
        create: (context) =>
            FavoriteBloc(model: FavoriteModel())..add(GetFavoriteSpotsEvent()),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state.status == FavoriteStatus.loaded) {
              Dev.log('SPOTS ${state.favoriteModel!.data.length}');
              return favoriteWidget(context, state.favoriteModel!);
            }
            if (state.status == FavoriteStatus.error) {
              return LocationErrorWidget(
                errorMessage: state.errorMessage,
              );
            }

            return Center(
              child: buildSkeleton(context),
            );
          },
        ),
      ),
    );
  }
}
