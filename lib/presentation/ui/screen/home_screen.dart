import 'package:flutter/material.dart';
import 'package:ride_map/domain/api/service/map_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ride map'),
      ),
    );
  }
}
