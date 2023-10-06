import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class SelectHouseTypeModal extends StatefulWidget {
  const SelectHouseTypeModal({super.key});

  @override
  State<SelectHouseTypeModal> createState() => _SelectHouseTypeModalState();
}

class _SelectHouseTypeModalState extends State<SelectHouseTypeModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 364,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: IklinColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBody(
              'Select your Cleaning Type',
              fontSize: 20,
            ),
            const Gap(24),
            SelectHouseTypeWidget(
              title: 'Flat',
              onTap: () {
                Navigator.pop(context, 'Flat');
              },
            ),
            const Gap(24),
            SelectHouseTypeWidget(
              title: 'Duplex',
              onTap: () {
                Navigator.pop(context, 'Duplex');
              },
            ),
            const Gap(24),
            SelectHouseTypeWidget(
              title: 'Bungalow',
              onTap: () {
                Navigator.pop(context, 'Bungalow');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SelectHouseTypeWidget extends StatelessWidget {
  const SelectHouseTypeWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: IklinColors.grey.withOpacity(0.6),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(
                title,
                fontSize: 18,
                color: IklinColors.grey.withOpacity(0.8),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: IklinColors.grey.withOpacity(0.5),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
