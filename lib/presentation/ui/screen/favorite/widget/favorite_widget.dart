import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';


Widget favoriteWidget(BuildContext context, FavoriteModel model){
  return RefreshIndicator(
    onRefresh: () async{
      await BlocProvider<FavoriteBloc>(create: (context) =>  FavoriteBloc(model: model)..add(GetFavoriteSpotsEvent()));
    },
    child: ListView.builder(
        itemCount: model.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(model.data[index].spot!.name!),
                Text(model.data[index].spot!.address!),
                Text(model.data[index].spot!.description!)
              ],
            ),
          );
        }),
  );
}