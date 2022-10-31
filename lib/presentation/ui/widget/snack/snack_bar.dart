import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

Future<void> snackBar(String message, BuildContext context) =>
    AnimatedSnackBar.rectangle(
      duration: const Duration(seconds: 5),
      'Ошибка',
      message,
      type: AnimatedSnackBarType.error,
      brightness: Brightness.light,
    ).show(
      context,
    );
