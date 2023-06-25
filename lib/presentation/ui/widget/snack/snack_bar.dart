import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

Future<void> snackBar(String message, BuildContext context, bool isError) =>
    AnimatedSnackBar.rectangle(
      duration: const Duration(seconds: 5),
      isError ? 'Ошибка' : 'Успешно',
      message,
      type: isError ? AnimatedSnackBarType.error : AnimatedSnackBarType.success,
      brightness: Brightness.light,
    ).show(
      context,
    );
