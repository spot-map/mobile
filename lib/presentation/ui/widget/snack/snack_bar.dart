import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

Future<void> snackBar(
        {bool? isWarning, required String message, required BuildContext context, required bool isError}) =>
    AnimatedSnackBar.rectangle(
      duration: const Duration(seconds: 5),
      isError
          ? 'Ошибка'
          : isWarning!
              ? 'Внимание'
              : 'Успешно',
      message,
      type: isError
          ? AnimatedSnackBarType.error
          : isWarning!
              ? AnimatedSnackBarType.warning
              : AnimatedSnackBarType.success,
      brightness: Brightness.light,
    ).show(
      context,
    );
