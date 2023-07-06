import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/untils/theme/app_colors_light.dart';

Widget listWidget(BuildContext context, MapModel model) {
  Future<void> _onRefresh() async {
    await BlocProvider<SpotBloc>(
        create: (context) => SpotBloc(spot: model)..add(GetSpotList()));
  }

  return LiquidPullToRefresh(
    onRefresh: _onRefresh,
    child: ListView.builder(
        itemCount: model.data.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 15,
              shadowColor: AppColorLight().backButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                  // leading: CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //         model.data[index].)),
                  title: Text(model.data[index].name!),
                  subtitle: Text(model.data[index].description!)));
        }),
  );
}
