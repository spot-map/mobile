import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ride_map/data/map_models/map_model.dart';
import 'package:ride_map/presentation/ui/screens/map/cubit.dart';
import 'package:ride_map/until/theme/light/app_colors_light.dart';

class SpotList extends StatelessWidget {
  SpotList({super.key, required this.model});

  final MapModel model;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        onRefresh: () => context.read<MapCubit>().onGetSpots(),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              onChanged: (String search) {
                searchController.text = search;
                context.read<MapCubit>().onSearchSpot(search);
              },
            ),
            const SizedBox(width: 10),
            Expanded(
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
            )
          ],
        ));
  }
}
