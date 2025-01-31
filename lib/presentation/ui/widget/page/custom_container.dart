import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
      ),
      decoration: const BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: child,
    );
  }
}