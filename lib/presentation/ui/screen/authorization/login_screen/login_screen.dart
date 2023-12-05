import 'package:flutter/material.dart';

import 'widget/login_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const path = 'auth';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginLayout(),
    );
  }
}
