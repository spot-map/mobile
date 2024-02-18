import 'package:flutter/material.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/widget/reactions/widget/reactions.dart';

Future reactionsBottomSheet(BuildContext context, MapByIdModel model) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.75,
            maxChildSize: 0.75,
            minChildSize: 0.75,
            expand: false,
            builder: (context, scrollController) => Reactions(model: model),
          ));
}
