import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/route_name.dart';

class PartnerRegistrationSuccessfulModal extends StatelessWidget {
  const PartnerRegistrationSuccessfulModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.white,
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
                )),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.mail2,
                color: IklinColors.primaryColor,
                width: 38,
                height: 30,
              ),
            ),
          ),
          const Gap(12),
          TextSemiBold(
            'Registration Successful',
            color: IklinColors.textColor.withOpacity(0.8),
            fontSize: 24,
          ),
          const Gap(13),
          TextBody(
            'Your Application to be iKlin Service\nPartner has been successfully submitted.We',
            fontSize: 16,
            color: IklinColors.grey.withOpacity(0.6),
            textAlign: TextAlign.center,
          ),
          TextBody(
            'will contact you shortly to complete\nyour onboarding process.',
            fontSize: 16,
            color: IklinColors.grey.withOpacity(0.6),
            textAlign: TextAlign.center,
          ),
          const Gap(30),
          GestureDetector(
            onTap: () async {
              Navigator.pop(context);
              await Navigator.pushNamed(
                context,
                RouteName.partnerHomeNavbar,
              );
            },
            child: Container(
              height: 48,
              width: 259,
              decoration: BoxDecoration(
                color: IklinColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextBold(
                  'Continue',
                  fontSize: 15,
                  color: IklinColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
