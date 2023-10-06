// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class SelectLaundryType extends StatelessWidget {
  const SelectLaundryType();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 449,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: IklinColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              const Align(
                alignment: Alignment.topRight,
                child: CloseModalButton(),
              ),
              const Gap(5),
              TextBody(
                'Select your profession',
                fontSize: 20,
              ),
              const Gap(24),
              const LaundryTypeItems(
                icon: AppAssets.washEmoji,
                title: 'Wash Only',
              ),
              const Gap(24),
              const LaundryTypeItems(
                icon: AppAssets.washImg,
                title: 'Wash, Fold and Iron ',
              ),
              const Gap(24),
              const LaundryTypeItems(
                icon: AppAssets.basketEmoji,
                title: 'Wash and fold',
              ),
              const Gap(24),
              const LaundryTypeItems(
                icon: AppAssets.ironEmoji,
                title: 'Iron Only',
              ),
              const Gap(
                20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseModalButton extends StatelessWidget {
  const CloseModalButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 24,
        width: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: IklinColors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.close,
            size: 20,
            color: IklinColors.black,
          ),
        ),
      ),
    );
  }
}

class LaundryTypeItems extends StatelessWidget {
  const LaundryTypeItems({
    required this.icon,
    required this.title,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: IklinColors.grey.withOpacity(0.6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 18,
              width: 18,
            ),
            const Gap(6),
            TextBody(
              title,
              color: IklinColors.grey.withOpacity(0.8),
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
