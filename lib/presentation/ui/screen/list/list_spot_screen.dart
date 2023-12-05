import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_layout.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';

class ListSpotScreen extends StatelessWidget {
  const ListSpotScreen({Key? key}) : super(key: key);
  static const path = 'listSpot';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  MyAppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        size: 50,
        title: 'Список спотов',
      ),
      body: ListLayout(),
    );
  }
}
