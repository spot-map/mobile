// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../domain/bloc/theme/theme_bloc.dart';
// import '../../../../untils/preferences/preferences.dart';
//
//
// class SettingScreen extends StatelessWidget {
//   const SettingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Column(
//         children: [
//           Padding(padding: const EdgeInsets.only(top: 5),
//               child: SwitchListTile(
//                 title: const Text('Theme'),
//                 // value: Preferences().value ?? BlocProvider.of<ThemeBloc>(context).state.isDark,
//                 onChanged: (value){
//                   BlocProvider.of<ThemeBloc>(context).add(ThemeChange(value));
//                 },
//               )
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const id = '/settings';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SettingsScreen'),
      ),
    );
  }
}

