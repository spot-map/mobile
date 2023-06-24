import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_layout.dart';

Future bottomSheet(BuildContext context, int id) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: ByIdLayout(id: id),
        );
      });
}
