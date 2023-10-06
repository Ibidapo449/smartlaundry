import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class ReviewShharingModal extends StatelessWidget {
  const ReviewShharingModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 399,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.starIcon,
              height: 64,
              width: 64,
              color: IklinColors.yellow,
            ),
            const Gap(18),
            TextSemiBold(
              'Thank you for sharing\nyour review',
              fontSize: 24,
              color: IklinColors.textColor.withOpacity(0.8),
              textAlign: TextAlign.center,
            ),
            const Gap(13),
            TextBody(
              'Your feedback helps others make\ndecisions about our vendor and\nservice',
              maxLines: 4,
              fontSize: 15,
              color: IklinColors.grey.withOpacity(0.6),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            BusyButton(title: 'Done', onTap: () {})
          ],
        ),
      ),
    );
  }
}
