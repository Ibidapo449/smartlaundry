import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';

class WalletModal extends StatelessWidget {
  const WalletModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextSemiBold(
              'Wallet',
              fontSize: 24,
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.walletIconn,
                      ),
                      const Gap(5),
                      TextBody(
                        'My Iklin Wallet',
                        color: IklinColors.black,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  const Gap(9),
                  RichText(
                      text: const TextSpan(
                          text: 'Wallet Balance: ',
                          style: TextStyle(
                            fontFamily: IklinFont.euclid,
                            color: IklinColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                        TextSpan(
                          text: 'NGN 80,000',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
