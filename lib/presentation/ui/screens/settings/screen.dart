import 'package:flutter/material.dart';
import 'package:ride_map/presentation/common/theme/base/app_color.dart';
import 'package:ride_map/presentation/common/theme/style/text/text_style.dart';
import 'package:ride_map/presentation/ui/screens/settings/widget/menu_list.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/page/material_page_without_border.dart';

class SettingsScreen extends StatelessWidget {
  static const path = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyMaterialNewPageWithoutBorder(
      onlyBack: false,
      widgetBody: _SettingsScreenBody(),
    );
  }
}

class _SettingsScreenBody extends StatelessWidget {
  const _SettingsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          size: 50,
          title: 'Настройки',
          automaticallyImplyLeading: true,
          centerTitle: false,
        ),
        body: Column(
          children: [Expanded(child: MenuList()), _columnWithInfoText(context: context), const SizedBox(height: 13)],
        ));
  }
}

_columnWithInfoText({required BuildContext context}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          style: const ButtonStyle().copyWith(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: Text("Удалить аккаунт",
              style: context.textStyle
                  .myTextStyleFontUbuntu(
                      fontSize: 14, textColor: context.colors.deleteColor, newFontWeight: FontWeight.w300)
                  .copyWith(
                    decorationThickness: 1,
                    decorationColor: Theme.of(context).textTheme.headline1!.color,
                    decoration: TextDecoration.underline,
                  )),
        ),
      ],
    ),
  );
}
