// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';

class FilterModal extends StatelessWidget {
  const FilterModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(7),
            Padding(
              padding: const EdgeInsets.only(
                right: 13,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: IklinColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff06366A).withOpacity(0.05),
                              offset: const Offset(0, 1),
                              blurRadius: 14,
                              spreadRadius: 0)
                        ]),
                    child: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              child: TextSemiBold(
                'Filter',
                color: IklinColors.grey.withOpacity(0.9),
                fontSize: 18,
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Sort by',
                    color: IklinColors.grey.withOpacity(0.9),
                    fontSize: 18,
                  ),
                  const Gap(28),
                  TextBold(
                    'Minimum order amount',
                    color: IklinColors.grey.withOpacity(0.7),
                    fontSize: 15,
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterProperties(
                        title: '2000',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '2500',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '3000',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '3500',
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              height: 1,
              color: IklinColors.grey.withOpacity(0.3),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Distance',
                    color: IklinColors.grey.withOpacity(0.7),
                    fontSize: 15,
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterProperties(
                        title: '0.3km',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '0.5km',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '1.0km',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '1.5s',
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              height: 1,
              color: IklinColors.grey.withOpacity(0.3),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Rating',
                    color: IklinColors.grey.withOpacity(0.7),
                    fontSize: 15,
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterProperties(
                        title: '3.0',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '3.5',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '4.0',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '4.5',
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              height: 1,
              color: IklinColors.grey.withOpacity(0.3),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Delivery',
                    color: IklinColors.grey.withOpacity(0.7),
                    fontSize: 15,
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterProperties(
                        title: '12 hora',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '24 hours',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '48 hours',
                        onTap: () {},
                      ),
                      FilterProperties(
                        title: '72 hours',
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              height: 1,
              color: IklinColors.grey.withOpacity(0.3),
            ),
            const Gap(52),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: BusyButton(
                title: 'Apply',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterProperties extends StatelessWidget {
  const FilterProperties({
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 77,
        decoration: BoxDecoration(
          color: IklinColors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextSemiBold(
            title,
            color: IklinColors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
