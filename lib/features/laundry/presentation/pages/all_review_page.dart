// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class AllReviewPage extends StatefulWidget {
  const AllReviewPage();

  @override
  State<AllReviewPage> createState() => _AllReviewPageState();
}

class _AllReviewPageState extends State<AllReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IklinBackButton(),
                    TextBold(
                      'Laundary review',
                      color: IklinColors.grey.withOpacity(0.8),
                      fontSize: 18,
                    ),
                    const SizedBox()
                  ],
                ),
                const Gap(37),
                SizedBox(
                  child: Column(
                    children: List.generate(
                      4,
                      (index) => const ReviewContainer(),
                    ),
                  ),
                ),
                const Gap(30),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 34,
                    width: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 0.2,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                    ),
                    child: Center(
                      child: TextBody(
                        'See all reviews',
                        color: IklinColors.grey.withOpacity(0.7),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
