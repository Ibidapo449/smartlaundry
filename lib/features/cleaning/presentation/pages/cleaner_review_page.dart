import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CleanerReviewPage extends StatefulWidget {
  const CleanerReviewPage({super.key});

  @override
  State<CleanerReviewPage> createState() => _CleanerReviewPageState();
}

class _CleanerReviewPageState extends State<CleanerReviewPage> {
  bool showAll = false;
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IklinBackButton(),
                    TextSemiBold(
                      'Cleaning review',
                      fontSize: 18,
                      color: IklinColors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const Gap(30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Column(
                        children: List.generate(showAll ? 10 : 4,
                            (index) => const ReviewContainer()),
                      ),
                      const Gap(30),
                      showAll
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAll = true;
                                });
                              },
                              child: Container(
                                height: 34,
                                width: 138,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: IklinColors.white,
                                    border: Border.all(
                                        width: 0.2,
                                        color:
                                            IklinColors.grey.withOpacity(0.8))),
                                child: Center(
                                  child: TextBody(
                                    'See all reviews',
                                    fontSize: 15,
                                    color: IklinColors.grey.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                      const Gap(30),
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
