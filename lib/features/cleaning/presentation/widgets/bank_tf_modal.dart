import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class CleaningBankTfModal extends StatefulWidget {
  const CleaningBankTfModal({super.key});

  @override
  State<CleaningBankTfModal> createState() => _CleaningBankTfModalState();
}

class _CleaningBankTfModalState extends State<CleaningBankTfModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 298,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: IklinColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(28),
            TextSemiBold(
              'Bank Transfer',
              fontSize: 24,
            ),
            const Gap(24),
            const Text(
              'Transfer order payment to any of the account number below.',
            ),
            const Gap(29),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Access Bank',
                  fontSize: 15,
                  color: IklinColors.grey.withOpacity(0.8),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: IklinColors.grey,
                ),
              ],
            ),
            const Gap(29),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Wema Bank',
                  fontSize: 15,
                  color: IklinColors.grey.withOpacity(0.8),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: IklinColors.grey,
                ),
              ],
            ),
            const Gap(29),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Sterling Bank',
                  fontSize: 15,
                  color: IklinColors.grey.withOpacity(0.8),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: IklinColors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
