import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_layout.dart';

Future bottomSheet(BuildContext context, int id) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        maxChildSize: 0.9,
        initialChildSize: 0.4,
        minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) => ByIdLayout(id: id),
              ));
}
