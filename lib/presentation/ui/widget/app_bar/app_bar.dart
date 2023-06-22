import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.widgetRight});

  @override
  Size get preferredSize => const Size.fromHeight(50);
  final String title;
  final List<Widget>? widgetRight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: widgetRight,
      title: Text(title, style: const TextStyle(color: Colors.black)),
    );
  }
}
