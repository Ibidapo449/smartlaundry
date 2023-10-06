import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';

class PartnerReferralBox extends StatelessWidget {
  const PartnerReferralBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: IklinColors.primaryColor,
      borderType: BorderType.RRect,
      strokeWidth: 2,
      radius: const Radius.circular(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: IklinColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(19),
              TextBody(
                'Invite your customers to order you online\nand share their experience with friends',
                fontSize: 15,
                color: IklinColors.grey.withOpacity(
                  0.7,
                ),
              ),
              const Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Refer now');
                    },
                    child: Container(
                      height: 39,
                      width: 107,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: IklinColors.white),
                      child: Center(
                        child: TextSemiBold(
                          'Invite now',
                          color: IklinColors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.referImg,
                    height: 65,
                    width: 65,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
