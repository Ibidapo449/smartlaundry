import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iklin/app/view/widgets/app_loading_dialog.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppLoadingPopup {
  AppLoadingPopup({
    required this.title,
  });
  final String title;
  Future<dynamic> show(
    BuildContext context, {
    String? text,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppLoadingDialog(text: title);
      },
    );
  }
}
