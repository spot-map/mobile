import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_layout.dart';

class ListSpotScreen extends StatelessWidget {
  const ListSpotScreen({Key? key}) : super(key: key);
  static const id = '/listSpot';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ListLayout(),
      ),
    );
  }
}
