import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/settings/widget/menu.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = false;
    bool radioValue = false;
    return Scaffold(
        body: Column(
      children: [
        menuListItem(
          icon: Icons.brightness_4,
          title: 'Тема',
          action: FittedBox(
            child: Switch(
              value: value,
              onChanged: (bolVal) {
                value = bolVal;
              },
            ),
          ),
        ),
        const SizedBox(height: 13),
        menuListItem(
            icon: Icons.map,
            title: 'Отображение спотов',
            action: FittedBox(
              child: Radio(value: radioValue, groupValue: 2),
            )),
      ],
    ));
  }
}
