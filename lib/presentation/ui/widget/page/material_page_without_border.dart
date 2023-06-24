import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_map/domain/bloc/navigation/constants/constants.dart';

// import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/untils/theme/style/consts.dart';

class MyMaterialNewPageWithoutBorder extends StatelessWidget {
  const MyMaterialNewPageWithoutBorder({
    Key? key,
    this.titleAppBar,
    required this.widgetBody,
    this.onlyBack = true,
    this.bodyScreensToGo,
    this.widgetRightAppBar,
    this.widgetTitleAppBar,
    this.backgroundColor,
    this.imageBackgroundName,
    this.widgetAfterBody,
    this.deleteAppBar = false,
    this.paddingHorizontalContent,
    this.fontSizeAppBar,
    this.primary = false,
    this.subTitle,
    this.myNewMaterialAppBar,
    this.callbackTopRefreshIndicator,
    this.isSafeArea = true,
    this.resizeToAvoidBottomInset = false,
  }) : super(key: key);
  final bool isSafeArea;
  final Widget? myNewMaterialAppBar;
  final double? paddingHorizontalContent;
  final String? titleAppBar;
  final Widget widgetBody;
  final Widget? widgetAfterBody;
  final bool onlyBack;
  final NavBarItem? bodyScreensToGo;
  final Widget? widgetTitleAppBar;
  final Widget? widgetRightAppBar;
  final Color? backgroundColor;
  final String? imageBackgroundName;
  final bool deleteAppBar;
  final double? fontSizeAppBar;
  final bool primary;
  final String? subTitle;
  final Future Function()? callbackTopRefreshIndicator;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          child: SafeArea(
            maintainBottomViewPadding: true,
            top: isSafeArea,
            bottom: isSafeArea,
            child: Column(
              children: [
                if (myNewMaterialAppBar != null) myNewMaterialAppBar!,
                if (callbackTopRefreshIndicator != null)
                  CupertinoSliverRefreshControl(
                      onRefresh: callbackTopRefreshIndicator!),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingHorizontalContent ??
                                  myHorizontalPaddingForContainer),
                          child: widgetBody,
                        ),
                      ),
                      if (widgetAfterBody != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: myTopPaddingForContent),
                          child: widgetAfterBody!,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
