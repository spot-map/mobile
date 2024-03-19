import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ride_map/domain/entities/favorite_models/favorite_model.dart';
import 'package:ride_map/presentation/common/theme/base/app_color.dart';
import 'package:ride_map/presentation/ui/screens/favorite/cubit.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.favoriteModel});

  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () => context.read<FavoriteCubit>().onGetFavoriteSpot(),
      child: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
            itemCount: favoriteModel.data.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: Key(favoriteModel.data[index].spot!.name!),
                closeOnScroll: true,
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  dismissible: DismissiblePane(
                      onDismissed: () =>
                          context.read<FavoriteCubit>().onDeleteSpotFromFavorite(favoriteModel.data[index].id!)),
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => context.read<FavoriteCubit>().onAddSpotToFavorite(favoriteModel.data[index].id!),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                            alignment: Alignment.center,
                            width: 24 * 4,
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(16)),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                      elevation: 15,
                      shadowColor: context.colors.backButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                          // onTap: () => bottomSheet(context, state.favoriteModel!.data[index].spot!.id!),
                          // leading:  CircleAvatar(
                          //     backgroundImage: NetworkImage(
                          //         state.favoriteModel!.data[index].spot!.images![index].path!)),
                          title: Text(favoriteModel.data[index].spot!.name!),
                          subtitle: Text(favoriteModel.data[index].spot!.description!))),
                ),
              );
            }),
      ),
    );
  }
}
