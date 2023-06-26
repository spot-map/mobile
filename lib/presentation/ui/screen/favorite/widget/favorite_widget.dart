import 'package:flutter/material.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';

Widget favoriteWidget(BuildContext context, FavoriteModel model){
  return ListView.builder(
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
      });
}