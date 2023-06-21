import 'package:flutter/material.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';

Widget listWidget(BuildContext context, MapModel model){
  return ListView.builder(
      itemCount: model.data.length,
      itemBuilder: (context, index){
        return Card(
          child: Column(
            children: [
              Text(model.data[index].name!),
              Text(model.data[index].address!),
              Text(model.data[index].description!)
            ],
          ),
        );
      }
  );
}
