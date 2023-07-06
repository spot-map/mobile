import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/bottom_sheet.dart';
import 'package:ride_map/untils/theme/light/app_colors_light.dart';

Widget favoriteWidget(BuildContext context, FavoriteModel model) {

  Future<void> _onRefresh() async{
   await BlocProvider.of<FavoriteBloc>(context)..add(GetFavoriteSpotsEvent());
  }

  return LiquidPullToRefresh(
    onRefresh: _onRefresh,
    child: ListView.builder(
        itemCount: model.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Card(
                elevation: 15,
                shadowColor: AppColorLight().backButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  onTap: () => bottomSheet(context, model.data[index].spot!.id!),
                    // leading:  CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         model.data[index].spot!.images![index].path!)),
                    title: Text(model.data[index].spot!.name!),
                    subtitle: Text(model.data[index].spot!.description!))),
          );
        }),
  );
}
