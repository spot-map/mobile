import 'package:flutter/material.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';

class AddSpotScreen extends StatelessWidget {
  const AddSpotScreen({Key? key, required this.currentUserLocation}) : super(key: key);

  final CurrentUserLocationEntity? currentUserLocation;
  static const id = '/addSpotScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const MyAppBar(
        title: 'Добавить спот', size: 50, automaticallyImplyLeading: true, centerTitle: false,
      ),
      body: Center(
        child: Text('${currentUserLocation!.latitude.toString()}, ${currentUserLocation!.longitude.toString()}'),
      ),
    );
  }
}
