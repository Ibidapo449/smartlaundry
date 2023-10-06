import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class PaymentSuccessfulModal extends StatelessWidget {
  const PaymentSuccessfulModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 399,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.background,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 37,
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
              'Payment Successfully',
              color: IklinColors.textColor.withOpacity(0.8),
              fontSize: 24,
            ),
            const Gap(18),
            TextBody(
              'Congratulaition your laundry\npayment has been successfully\nbeen placed',
              color: IklinColors.grey.withOpacity(0.6),
              maxLines: 4,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
            const Gap(52),
            BusyButton(
                title: 'Track Order',
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    RouteName.orderTracking,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
