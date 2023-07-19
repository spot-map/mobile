import 'package:flutter/material.dart';
import '../../../../../../data/map_by_id_page_models/map_by_id_model.dart';
import '../../../app_bar/app_bar.dart';

Future reactionsBottomSheet(BuildContext context, MapByIdModel model) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.75,
            //set this as you want
            maxChildSize: 0.75,
            //set this as you want
            minChildSize: 0.75,
            //
            expand: false,
            builder: (context, scrollController) => _reactions(model),
          ));
}

Widget _reactions(MapByIdModel model) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(30),
    child: Scaffold(
        appBar: const MyAppBar(
          size: 30,
          title: '',
          automaticallyImplyLeading: true,
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: model.data!.reactions!.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(model.data!.reactions![index].users!.name!),
              );
            })),
  );
}
