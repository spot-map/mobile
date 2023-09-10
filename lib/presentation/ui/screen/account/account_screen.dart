import 'package:flutter/material.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final TextEditingController test = TextEditingController();
  @override
  Widget build(BuildContext context) {
    test.text = Prefs.getString('fcm')!;
    return Scaffold(
      body: Center(
        child: TextField(
          controller: test,
        ),
      ),
    );
  }
}
