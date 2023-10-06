import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/route_name.dart';

class PartnerCodeSentModal extends StatelessWidget {
  const PartnerCodeSentModal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
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
            'Verification Code',
            color: IklinColors.textColor.withOpacity(0.8),
            fontSize: 24,
          ),
          const Gap(13),
          TextBody(
            'Verification code has been\nsent to Balogun@yahoo.com',
            fontSize: 18,
            color: IklinColors.grey.withOpacity(0.6),
            textAlign: TextAlign.center,
          ),
          const Gap(24),
          GestureDetector(
            onTap: () async {
              Navigator.pop(context);
              await Navigator.pushNamed(
                context,
                RouteName.partnerOtpVerificationPage,
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