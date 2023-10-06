import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194,
      width: 366,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: IklinColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: IklinColors.primaryColor.withOpacity(0.79),
          ),
          const Gap(13),
          TextSemiBold(
            text,
            fontSize: 15,
            color: IklinColors.primaryColor.withOpacity(0.79),
          )
        ],
      ),
    );
  }
}
