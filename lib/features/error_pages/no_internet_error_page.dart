import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppAssets.errorImg,
                width: 223,
                height: 184,
              ),
            ),
            const Gap(29),
            TextBody(
              'No Internet Connection',
              fontSize: 24,
            ),
            const Gap(21),
            TextBody(
              'Oops... Something went wrong, please check your internet connection and try again',
              maxLines: 4,
              color: IklinColors.grey.withOpacity(0.6),
              fontSize: 18,
              textAlign: TextAlign.center,
            ),
            const Gap(29),
            Container(
              height: 52,
              width: 235,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43),
                color: IklinColors.primaryColor,
              ),
              child: Center(
                child: TextBold(
                  'Try again',
                  color: IklinColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
