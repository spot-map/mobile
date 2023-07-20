import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

Widget byIdWidget(BuildContext context, MapByIdModel model) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Scaffold(
        appBar: MyAppBar(title: model.data!.name!,
          size: 30,
          automaticallyImplyLeading: false,
          centerTitle: false,
          widgetRight: [
           IconButton(onPressed: (){
             print('PREFS ${Prefs.getString('token')}');
             if(Prefs.getString('token') == null){
               snackBar('Выполните авторизацию', context, true);
             }else{
               BlocProvider.of<FavoriteBloc>(context).add(AddSpotToFavoriteEvent(model.data!.id!));
             }
           }, icon: const Icon(Icons.favorite, color: Colors.red,))
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
                          '${ApiConstants.BASE_URL_DEV}/${model.data!.images![index].path!}');
                    })
            )
          ],
        ),
      )
  );
}
