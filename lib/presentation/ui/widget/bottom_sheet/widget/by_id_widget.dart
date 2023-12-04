import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/reactions/reactions_bottom.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class ByIdWidget extends StatelessWidget {
  MapByIdModel model;

  ByIdWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: MyAppBar(
            title: model.data!.name!,
            size: 30,
            automaticallyImplyLeading: false,
            centerTitle: false,
            widgetRight: [
              IconButton(
                  onPressed: () {
                    print('PREFS ${Prefs.getString('token')}');
                    if (Prefs.getString('token') == null) {
                      snackBar('Выполните авторизацию', context, true);
                    } else {
                      BlocProvider.of<FavoriteBloc>(context)
                          .add(AddSpotToFavoriteEvent(model.data!.id!));
                    }
                  },
                  icon: Icon(Icons.favorite,
                      color: model.data!.isInFavorite!
                          ? Colors.red
                          : Colors.grey)),
              IconButton(
                  onPressed: () {
                    reactionsBottomSheet(context, model);
                  },
                  icon: const Icon(Icons.message)),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<SpotByIdBloc>(context)
                        .add(ShareSpot(model.data!.id!));
                  },
                  icon: const Icon(Icons.ios_share))
            ],
          ),
          body: Column(
            children: [
              ListTile(
                title: Text(model.data!.description!),
              ),
              Expanded(
                  child: model.data!.images!.isEmpty
                      ? Text('Изображение не добавлено')
                      : ListView.builder(
                          itemCount: model.data!.images!.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                                model.data!.images![index].path!);
                          }))
            ],
          ),
        ));
  }
}
