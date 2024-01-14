import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_cubit.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_cubit.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/reactions/reactions_bottom.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class ByIdWidget extends StatelessWidget {
  MapByIdModel model;

  ByIdWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        title: model.data!.name!,
        size: 50,
        automaticallyImplyLeading: true,
        centerTitle: false,
        widgetRight: [
          IconButton(
              onPressed: () {
                if (Prefs.getString('token') == null) {
                  snackBar('Выполните авторизацию', context, true);
                } else {
                  context.read<FavoriteCubit>().onAddSpotToFavorite(model.data!.id!);
                }
              },
              icon: Icon(Icons.favorite, color: model.data!.isInFavorite! ? Colors.red : Colors.grey)),
          IconButton(
              onPressed: () {
                reactionsBottomSheet(context, model);
              },
              icon: const Icon(Icons.message)),
          IconButton(
              onPressed: () {
                context.read<SpotByIdCubit>().onShareSpot(model.data!.id!);
              },
              icon: const Icon(Icons.ios_share))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(model.data!.description!),
          ),
          Expanded(
              child: model.data!.images!.isEmpty
                  ? Text('Изображение не добавлено')
                  : CarouselSlider(
                      items: model.data!.images!.map((i) {
                        int index = model.data!.images!.indexOf(i);
                       return Flexible(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                model.data!.images![index].path!,
                                height: 250,
                                width: 250,
                                //fit: BoxFit.fill,
                              ),
                            ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 0.92,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                      )))
        ],
      ),
    );
  }
}
