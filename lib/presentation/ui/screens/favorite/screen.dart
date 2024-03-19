import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screens/favorite/widget/favorite_widget.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/loading/skeleton_loading.dart';
import 'package:ride_map/presentation/ui/widget/page/common_scaffold.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

import 'cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const path = 'favorite';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      message: context.read<FavoriteCubit>().messageStream,
      onMessage: (message) {
        snackBar(message: message, context: context, isError: true);
      },
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(
        title: 'Избранное',
        size: 50,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return state.isLoading
              ? Center(
                  child: buildSkeleton(context),
                )
              : FavoriteWidget(favoriteModel: state.favoriteModel!);
        },
      ),
    );
  }
}
