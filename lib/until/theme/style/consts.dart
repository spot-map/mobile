import 'package:flutter/material.dart';

const double myHorizontalPaddingForContainer = 9;
const double myTopPaddingForContent = 15;
const double myBottomPaddingContent = 15;
const double myToolbarHeight = 35;

Widget myIconBackAppBar({required BuildContext context, double? sizeIcon}) =>
    SizedBox(
      // width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          // left: myHorizontalPaddingForContainer,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: sizeIcon ?? 30,
        ),
      ),
    );

Icon myIconForward({Color? color, required BuildContext context}) => Icon(
      Icons.arrow_forward_ios,
      color: color ?? Theme.of(context).textTheme.headline1!.color,
      // weight: 1,
    );
