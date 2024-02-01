import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final TextEditingController test = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: test,
        ),
      ),
    );
  }
}
