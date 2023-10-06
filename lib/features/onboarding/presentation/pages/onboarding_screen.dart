// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/widgets/onboarding_first_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? _pageController;
  int currentIndex = 0;

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController!.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.onboardingBackground,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: onChangedFunction,
                    children: const [
                      OnboardingFirstPage(
                        images: AppAssets.onBoardingImage,
                        subTitle:
                            'We pick up your laundry, clean them with care, handle with our professional partner and deliver them within 48 hours.',
                        title: Text.rich(
                          TextSpan(
                            text: 'Tired Of',
                            style: TextStyle(
                              color: IklinColors.textColor,
                              fontSize: 24,
                              fontFamily: IklinFont.euclid,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: ' Laundry Day ',
                                style: TextStyle(
                                  color: IklinColors.primaryColor,
                                ),
                              ),
                              TextSpan(text: 'Find a Vendor To Handle It.')
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      OnboardingFirstPage(
                        images: AppAssets.onboardingaImage1,
                        subTitle:
                            'With us, you may request laundry, housecleaning, and maintenance services from a vetted and trustworthy specialist.',
                        title: Text.rich(
                          TextSpan(
                            text: 'Quality Service\n',
                            style: TextStyle(
                              color: IklinColors.textColor,
                              fontSize: 24,
                              fontFamily: IklinFont.euclid,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Guaranted',
                                style: TextStyle(
                                  color: IklinColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      OnboardingFirstPage(
                        images: AppAssets.onboardingImage2,
                        subTitle:
                            'The simple, stress-free, and dependable method to clean your home. We handle house cleaning requests by vetting them with our industry experts.',
                        title: Text.rich(
                          TextSpan(
                            text: 'Say goodbye to house\n',
                            style: TextStyle(
                              color: IklinColors.textColor,
                              fontSize: 24,
                              fontFamily: IklinFont.euclid,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Cleaning forever',
                                style: TextStyle(
                                  color: IklinColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Indicator(
                              positionIndex: 0,
                              currentIndex: currentIndex,
                            ),
                            const Gap(15),
                            Indicator(
                              positionIndex: 1,
                              currentIndex: currentIndex,
                            ),
                            const Gap(15),
                            Indicator(
                              positionIndex: 2,
                              currentIndex: currentIndex,
                            ),
                          ],
                        ),
                        ContinueButton(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.getStarted);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 127,
        decoration: BoxDecoration(
          color: IklinColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextSemiBold(
            'Continue',
            color: IklinColors.white,
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({
    required this.currentIndex,
    required this.positionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: positionIndex == currentIndex ? 20 : 10,
      width: positionIndex == currentIndex ? 20 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: positionIndex == currentIndex
            ? IklinColors.primaryColor
            : IklinColors.primaryColor.withOpacity(0.2),
      ),
    );
  }
}
