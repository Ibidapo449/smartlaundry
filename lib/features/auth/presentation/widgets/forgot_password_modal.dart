import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class ForgotPasswordModal extends StatelessWidget {
  const ForgotPasswordModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: IklinColors.primaryColor,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(AppAssets.lockIcon),
            ),
          ),
          const Gap(24),
          TextSemiBold(
            'Password Reset',
            fontSize: 24,
            color: IklinColors.textColor.withOpacity(
              0.8,
            ),
          ),
          const Gap(8),
          TextBody(
            'A reset  code has been sent to Balogun@yahoo.com',
            color: IklinColors.grey.withOpacity(0.6),
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
          const Gap(24),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.setNewPassword,
              );
            },
            child: Container(
              width: 259,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: IklinColors.primaryColor,
              ),
              child: Center(
                child: TextSemiBold(
                  'Continue',
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: IklinColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
