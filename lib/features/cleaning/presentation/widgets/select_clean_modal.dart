import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

import '../../../../app/styles/fonts.dart';

class SelectCleanModal extends StatefulWidget {
  const SelectCleanModal({super.key});

  @override
  State<SelectCleanModal> createState() => _SelectCleanModalState();
}

class _SelectCleanModalState extends State<SelectCleanModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 461,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: IklinColors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(21),
            TextBody(
              'Select your Cleaning Type',
              fontSize: 20,
            ),
            const Gap(21),
            SelectContainer(
              ttile: 'Standard Cleaning',
              icon: AppAssets.standardCleanningImg,
              onTap: () {
                Navigator.pop(
                  context,
                  'Standard Cleaning',
                );
              },
            ),
            const Gap(16),
            SelectContainer(
              ttile: 'Deep Cleaning',
              icon: AppAssets.deepCleaning,
              onTap: () {
                Navigator.pop(context, 'Deep Cleaninng');
              },
            ),
            const Gap(16),
            SelectContainer(
              ttile: 'Post Construction Cleaning',
              icon: AppAssets.postConstruction,
              onTap: () {
                Navigator.pop(context, 'Post Construction Cleaning');
              },
            ),
            const Gap(16),
            SelectContainer(
              ttile: 'Industrial Cleaning',
              icon: AppAssets.industrialCleaning,
              onTap: () {
                Navigator.pop(context, 'Industrial Cleaning');
              },
            ),
            const Gap(16),
            SelectContainer(
              ttile: 'Pest Control Services',
              icon: AppAssets.pestControl,
              onTap: () {
                Navigator.pop(context, 'Pest Control Services');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SelectContainer extends StatefulWidget {
  const SelectContainer({
    super.key,
    required this.ttile,
    required this.icon,
    required this.onTap,
  });
  final String ttile;
  final String icon;
  final VoidCallback onTap;
  @override
  State<SelectContainer> createState() => _SelectContainerState();
}

class _SelectContainerState extends State<SelectContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: IklinColors.grey.withOpacity(0.4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            children: [
              Image.asset(
                widget.icon,
                width: 18,
                height: 18,
              ),
              const Gap(6),
              TextBody(
                widget.ttile,
                fontSize: 18,
                color: IklinColors.grey.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
