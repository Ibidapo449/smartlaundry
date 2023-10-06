import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class ResetPasswordSuccessfulModal extends StatelessWidget {
  const ResetPasswordSuccessfulModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 399,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.resetImg,
              height: 64,
              width: 64,
            ),
            const Gap(14),
            TextSemiBold(
              'Password Reset Successful',
              fontSize: 24,
              color: IklinColors.textColor.withOpacity(0.8),
            ),
            const Gap(18),
            TextBody(
              'Congratulaition your password reset has been successfully be change. Login to access your account',
              fontSize: 16,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const Gap(50),
            BusyButton(
              title: 'Login',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
