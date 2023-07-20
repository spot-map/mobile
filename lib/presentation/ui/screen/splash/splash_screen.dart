import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/navigation/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 8), () => Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            const RootScreen()
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icon.png'),
      ),
    );
  }
}
