import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/cleaning/presentation/widgets/cleaner_top_container.dart';
import 'package:iklin/features/home/presentation/pages/hhome_screen.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CleanerPersonalPage extends StatefulWidget {
  const CleanerPersonalPage({super.key});

  @override
  State<CleanerPersonalPage> createState() => _CleanerPersonalPageState();
}

class _CleanerPersonalPageState extends State<CleanerPersonalPage> {
  final CarouselController slideController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: IklinColors.background,
        body: Stack(
          children: [
            SizedBox(
              height: 182,
              width: double.infinity,
              child: Image.asset(
                AppAssets.cleaner2,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const IklinBackButton(),
                      const Gap(10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Stack(
                                  children: [
                                    const CleanerTopContainer(
                                      cleanerName: 'So-Kleen Ventures',
                                      years: '15+',
                                      location: 'Lagos Island',
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        height: 78,
                                        width: 78,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: IklinColors.primaryColor),
                                        child: ClipOval(
                                          child: Image.asset(
                                            AppAssets.cleaner1,
                                            width: 78,
                                            height: 78,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(16),
                              TextBold(
                                'Services',
                                fontSize: 18,
                                color: IklinColors.grey.withOpacity(0.8),
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  PopularServices(
                                    image: AppAssets.cloth,
                                    title: 'Laundry',
                                    textColor:
                                        IklinColors.grey.withOpacity(0.3),
                                    onTap: () {},
                                  ),
                                  const Gap(16),
                                  PopularServices(
                                    image: AppAssets.broom,
                                    title: 'Cleaning',
                                    textColor:
                                        IklinColors.grey.withOpacity(0.3),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              const Gap(8),
                              TextBold(
                                'Most Cleaning orders',
                                fontSize: 18,
                                color: IklinColors.grey.withOpacity(0.8),
                              ),
                              const Gap(16),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: List.generate(
                                        6,
                                        (index) => const MostCleanContainer(
                                            title: 'Standard Cleaning',
                                            number: '30'))),
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBold(
                                    'Review',
                                    fontSize: 18,
                                    color: IklinColors.grey.withOpacity(0.8),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteName.cleanerReviewPage);
                                    },
                                    child: TextBody(
                                      'See all',
                                      fontSize: 15,
                                      color: IklinColors.grey.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(16),
                              CarouselSlider.builder(
                                  carouselController: slideController,
                                  itemCount: 5,
                                  itemBuilder: (context, index, _) {
                                    return const ReviewContainer();
                                  },
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    height: 150,
                                    reverse: false,
                                  )),
                              const Gap(14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    child: Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: IklinColors.primaryColor
                                            .withOpacity(0.1),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const Gap(30),
                              BusyButton(
                                title: 'Continue',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.selectHouseInfo);
                                },
                              ),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}

class MostCleanContainer extends StatelessWidget {
  const MostCleanContainer(
      {super.key, required this.title, required this.number});
  final String title;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Container(
        height: 94,
        width: 100,
        decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: IklinColors.black.withOpacity(0.05),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.mostCleannImg,
                height: 24,
                width: 24,
              ),
              const Gap(6),
              TextBody(
                title,
                fontSize: 12,
                color: IklinColors.grey.withOpacity(0.3),
              ),
              const Gap(6),
              TextBold(
                number,
                fontSize: 18,
                color: IklinColors.grey.withOpacity(0.8),
              )
            ],
          ),
        ),
      ),
    );
  }
}
