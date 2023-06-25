import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/theme/appColors.dart';


Widget byIdWidget(BuildContext context, MapByIdModel model) {
  return Scaffold(
      appBar: MyAppBar(
        title: model.data!.name!,
        size: 50,
        automaticallyImplyLeading: false,
        centerTitle: false,
        widgetRight: [
          IconButton(onPressed: (){
            BlocProvider.of<SpotByIdBloc>(context).add(AddSpotToFavoriteEvent(model.data!.id!));
            snackBar('Спот добавлен в избранное', context, false);
          }, icon: Icon(Icons.favorite), color: AppColor().deleteColor,)
        ],
      ),
      body: Column(
        children: [
          Text(model.data!.description!),
          Expanded(
              child: model.data!.images!.isEmpty
                  ? Text('Изображение не добавлено')
                  : ListView.builder(
                      itemCount: model.data!.images!.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                            '${ApiConstants.BASE_URL_LOCAL_SMOL}/${model.data!.images![index].path!}');
                      }))
        ],
      ));
}
