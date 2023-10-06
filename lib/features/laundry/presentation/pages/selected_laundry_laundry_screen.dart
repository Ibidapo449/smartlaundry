// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/home/presentation/pages/hhome_screen.dart';
import 'package:iklin/features/laundry/presentation/widgets/laundry_item_and_price.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SelectedLandryScreen extends StatelessWidget {
  const SelectedLandryScreen();

  @override
  Widget build(BuildContext context) {
    final CarouselController slideController = CarouselController();
    List<String> mostWashed = [
      'Jeans',
      'Vest',
      'T-shirt',
      'Suits',
    ];
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: IklinColors.primaryColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                    child: IklinBackButton(),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 100,
                      ),
                      child: LaundryManCardInfo()),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Container(
                        height: 78,
                        width: 78,
                        decoration: const BoxDecoration(
                          color: IklinColors.grey2,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets.laundry,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Services',
                    color: IklinColors.grey,
                    fontSize: 18,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      PopularServices(
                        image: AppAssets.cloth,
                        title: 'Laundry',
                        textColor: IklinColors.grey.withOpacity(0.3),
                        onTap: () {},
                      ),
                      const Gap(16),
                      PopularServices(
                        image: AppAssets.broom,
                        title: 'Cleaning',
                        textColor: IklinColors.grey.withOpacity(0.3),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Gap(24),
                  TextBold(
                    'Most washed items',
                    color: IklinColors.grey.withOpacity(0.8),
                    fontSize: 18,
                  ),
                  const Gap(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(mostWashed.length, (index) {
                        return MostWashedItem(
                          title: mostWashed[index],
                          amount: '90',
                        );
                      }),
                    ),
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBold(
                        'Review',
                        fontSize: 18,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.allReviewPage,
                          );
                        },
                        child: TextBody(
                          'See all',
                          color: IklinColors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  const Gap(16),
                  CarouselSlider.builder(
                      carouselController: slideController,
                      itemCount: mostWashed.length,
                      itemBuilder: (context, index, _) {
                        return const ReviewContainer();
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 150,
                        reverse: false,
                      ))
                ],
              ),
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(mostWashed.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: IklinColors.primaryColor.withOpacity(0.1),
                    ),
                  ),
                );
              }),
            ),
            const Gap(30),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.createBasket,
                    );
                  },
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: IklinColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextBold(
                          'Create Laundry Basket',
                          color: IklinColors.white,
                          fontSize: 14,
                        ),
                        Image.asset(AppAssets.notoBasket),
                      ],
                    ),
                  ),
                )),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class MostWashedItem extends StatelessWidget {
  const MostWashedItem({

    required this.title,
    required this.amount,
  });
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, color: IklinColors.black.withOpacity(0.05))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBody(
              title,
              color: IklinColors.grey.withOpacity(0.3),
              fontSize: 14,
            ),
            const Gap(12),
            TextBold(
              amount,
              fontSize: 18,
              color: IklinColors.grey.withOpacity(
                0.8,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LaundryManCardInfo extends StatelessWidget {
  const LaundryManCardInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: IklinColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(58),
            Align(
              child: TextSemiBold(
                'OLA’S VENTURES',
                color: IklinColors.black,
                fontSize: 18,
              ),
            ),
            const Gap(19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.busIcon),
                    const Gap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody(
                          'Delivery',
                          fontSize: 12,
                          color: IklinColors.grey,
                        ),
                        const Gap(8),
                        TextBody(
                          'Free',
                          fontSize: 12,
                          color: IklinColors.grey,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppAssets.orderIcon,
                      color: IklinColors.black,
                    ),
                    const Gap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody(
                          'Minimum order amount',
                          fontSize: 12,
                          color: IklinColors.grey,
                        ),
                        const Gap(8),
                        TextBody(
                          '2000',
                          fontSize: 12,
                          color: IklinColors.grey,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Gap(18),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    context: context,
                    builder: (contex) {
                      return const LaundryItemAndPrice();
                    });
              },
              child: Container(
                height: 25,
                width: 193,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 0.2,
                      color: IklinColors.primaryColor,
                    )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.tagIcon,
                      ),
                      const Gap(5),
                      TextBody(
                        'See  your laundry price list.',
                        fontSize: 12,
                        color: IklinColors.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
