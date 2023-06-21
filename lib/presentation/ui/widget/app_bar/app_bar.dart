import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/add_spot/add_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/settings/settings_screen.dart';
import 'package:ride_map/untils/config/app_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(50);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: (){
              AppRouter.pushNamed(AddSpotScreen.id);
            },
            child:  const Icon(Icons.add, size: 20, color:Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: (){
             AppRouter.pushNamed(SettingsScreen.id);
            },
            child:  const Icon(Icons.settings, size: 20, color:Colors.black),
          ),
        )
      ],
      title: Text(title,style: const TextStyle(color: Colors.black)),
    );
  }
}
