// ignore_for_file: avoid_redundant_argument_values

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:iklin/core/constant/app_colors.dart';

class FlushbarNotification {
  static void showSuccessMessage(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    Flushbar(
      title: title ?? 'Success',
      message: message,
      titleSize: 18,
      messageSize: 12,
      backgroundColor: IklinColors.primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.bounceIn,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static void showErrorMessage(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    Flushbar(
      title: title ?? 'Error!!',
      message: message,
      titleSize: 18,
      messageSize: 12,
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.bounceIn,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
