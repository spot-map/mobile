import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/widget/favorite_widget.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/loading/skeleton_loading.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const id = '/favoriteSpot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Избранное',
        size: 50,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return state.isLoading
              ? Center(
            child: buildSkeleton(context),
          )
              : FavoriteWidget(state: state!);
        },
      ),
    );
  }
}
