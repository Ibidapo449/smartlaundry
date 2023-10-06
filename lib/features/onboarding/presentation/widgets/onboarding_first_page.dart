// ignore_for_file: unused_import

import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({
    Key? key,
    required this.images,
    required this.subTitle,
    required this.title,
  }) : super(key: key);
  final String images;
  final Widget title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const Gap(10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Center(
            child: Image.asset(
              images,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              title,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextBody(
                subTitle,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: IklinColors.darkGrey,
                maxLines: 10,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
