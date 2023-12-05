import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/presentation/ui/screen/add_spot/widget/add_spot_widget.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';

class AddSpotScreen extends StatelessWidget {
  const AddSpotScreen({Key? key, required this.currentUserLocation})
      : super(key: key);

  final LatLng currentUserLocation;
  static const path = 'addSpot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: 'Добавить спот',
          size: 50,
          automaticallyImplyLeading: true,
          centerTitle: false,
        ),
        body: addSpotWidget(context, currentUserLocation: currentUserLocation));
  }
}
