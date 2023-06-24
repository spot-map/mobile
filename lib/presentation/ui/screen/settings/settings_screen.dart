import 'package:flutter/material.dart';
import 'package:ride_map/presentation/ui/screen/settings/widget/menu_list.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/page/material_page_without_border.dart';
import 'package:ride_map/untils/theme/appColors.dart';
import 'package:ride_map/untils/theme/style/text/text_style.dart';

class SettingsScreen extends StatelessWidget {
  static const id = '/settings';

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
        appBar: const MyAppBar( size: 50, title: 'Настройки', automaticallyImplyLeading: true,
          centerTitle: false,
        ),
        body: Column(
          children: [
            const Expanded(child: MenuList()),
            _columnWithInfoText(context: context),
            const SizedBox(height: 13)
          ],
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
          child: Text(
            "Удалить аккаунт",
            style: myTextStyleFontUbuntu(
              fontSize: 14,
              textColor: AppColor().deleteColor,
              newFontWeight: FontWeight.w300,
              context: context,
            ).copyWith(
              decorationThickness: 1,
              decorationColor: Theme.of(context).textTheme.headline1!.color,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
  );
}
