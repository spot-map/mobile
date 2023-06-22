import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future bottomSheet(BuildContext context, String text) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Text(text),
        );
      });
}
