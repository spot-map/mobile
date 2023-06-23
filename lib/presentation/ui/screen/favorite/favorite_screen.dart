import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'package:ride_map/untils/theme/appColors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Preferences().getToken != null
          ? MyAppBar(
              title: 'Избранное',
              size: 50,
              widgetRight: [
                GestureDetector(
                  child: Icon(Icons.exit_to_app,
                      color: AppColor().backButtonColor),
                )
              ],
            )
          : MyAppBar(title: '', size: 50),
      body: Center(
        child: Text('FavoriteScreen'),
      ),
    );
  }
}
