import 'package:flutter/material.dart';

Widget menuListItem({
  required IconData icon,
  required title,
  Widget? action,
  VoidCallback? onTap,
  BuildContext? context,
}) {
  return TextButton(
    onPressed: onTap ?? () {},
    style: const ButtonStyle().copyWith(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
    ),
    child: Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
          ),
        ),
        Expanded(child: Container()),
        action ?? Container(),
      ],
    ),
  );
}
