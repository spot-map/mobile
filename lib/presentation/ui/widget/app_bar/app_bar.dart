import 'package:flutter/material.dart';
import 'package:ride_map/until/theme/base/app_color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      required this.size,
      required this.title,
      this.widgetRight,
      this.bottomWidget,
      required this.automaticallyImplyLeading,
      this.centerTitle});

  final double size;

  @override
  Size get preferredSize => Size.fromHeight(size);
  final String title;
  final List<Widget>? widgetRight;
  final PreferredSizeWidget? bottomWidget;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: context.colors.backButtonColor,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      bottom: bottomWidget,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: widgetRight,
      title: Text(title, style: TextStyle(color: context.colors.textColor)),
    );
  }
}
