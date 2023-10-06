import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class CleaningCardModal extends StatefulWidget {
  const CleaningCardModal({super.key});

  @override
  State<CleaningCardModal> createState() => _CleaningCardModalState();
}

class _CleaningCardModalState extends State<CleaningCardModal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextSemiBold(
              'Card',
              fontSize: 24,
            ),
            const Gap(24),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 17,
              ),
              leading: Image.asset(
                AppAssets.masterCardLogo,
                height: 19,
                width: 30,
              ),
              title: TextBody(
                '4833 - First Bank of Nigeria',
                color: IklinColors.grey,
                fontSize: 15,
              ),
              trailing: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.debitCardScreen);
                  },
                  child: TextBody(
                    'Switch',
                    fontSize: 12,
                    color: IklinColors.primaryColor,
                  )),
            ),
            TextBody(
              'Expires 08/2026',
              fontSize: 12,
              color: IklinColors.grey,
            )
          ],
        ),
      ),
    );
  }
}
