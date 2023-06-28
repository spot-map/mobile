import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';

Widget listWidget(BuildContext context, MapModel model) {
  return RefreshIndicator(
    onRefresh: () async{
      await  BlocProvider<SpotBloc>(create: (context) =>  SpotBloc(spot: model)..add(GetSpotList()));
    },
    child: ListView.builder(
        itemCount: model.data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(model.data[index].name!),
                Text(model.data[index].address!),
                Text(model.data[index].description!)
              ],
            ),
          );
        }),
  );
}
