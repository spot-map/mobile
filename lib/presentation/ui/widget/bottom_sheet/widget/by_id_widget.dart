import 'package:flutter/material.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/untils/api/api_constants.dart';

Widget byIdWidget(BuildContext context, MapByIdModel model) {
  return Stack(
    children: [
      Positioned(left: 50, child: Text(model.data!.name!)),
      Center(
        child: Column(
          children: [
            Text(model.data!.description!),
            Expanded(
                child: model.data!.images!.isEmpty
                    ? Text('Изображение не добавлено')
                    : ListView.builder(
                        itemCount: model.data!.images!.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                              '${ApiConstants.BASE_URL_LOCAL}/${model.data!.images![index].path!}');
                        }))
          ],
        ),
      )
    ],
  );
}
