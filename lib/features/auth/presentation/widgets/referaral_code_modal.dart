import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class ReferralCodeModal extends StatefulWidget {
  const ReferralCodeModal({Key? key}) : super(key: key);

  @override
  State<ReferralCodeModal> createState() => _ReferralCodeModalState();
}

class _ReferralCodeModalState extends State<ReferralCodeModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 358,
      width: double.infinity,
      decoration: const BoxDecoration(
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
            SvgPicture.asset(
              AppAssets.refferalIcon,
              height: 64,
              width: 64,
            ),
            const Gap(16),
            TextBody(
              'Enter a referral code if\nany',
              color: IklinColors.grey,
              fontSize: 18,
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            InputField(
              controller: TextEditingController(),
              placeholder: 'Referral code',
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: IklinColors.lightGrey.withOpacity(0.4),
                      ),
                      child: Center(
                        child: TextSemiBold(
                          'Cancel',
                          fontSize: 18,
                          color: IklinColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(22),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: IklinColors.primaryColor,
                      ),
                      child: Center(
                        child: TextSemiBold(
                          'Submit',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: IklinColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
