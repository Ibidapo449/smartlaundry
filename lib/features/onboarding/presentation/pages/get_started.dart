// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/widgets/user_type_box.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final ValueNotifier<int> _selectedOption = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Object>(
        valueListenable: _selectedOption,
        builder: (context, option, chhild) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      const IklinBackButton(),
                      const Gap(57),
                      const Text.rich(
                        TextSpan(
                            text: 'Welcome to \n',
                            style: TextStyle(
                              color: IklinColors.textColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                              fontFamily: IklinFont.euclid,
                            ),
                            children: [
                              TextSpan(
                                text: 'Iklin App',
                                style: TextStyle(
                                  color: IklinColors.primaryColor,
                                ),
                              ),
                            ]),
                      ),
                      const Gap(16),
                      TextSmall(
                        'Start by creating an account',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      const Gap(8),
                      TextSmall(
                        'Choose your account type to complete the registration process',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(
                          0.4,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                      const Gap(60),
                      Row(
                        children: [
                          Expanded(
                            child: UserTypeBox(
                                icon: AppAssets.userIcon,
                                title: 'User',
                                isSelected: option == 1,
                                onTap: () {
                                  _selectedOption.value = 1;
                                }),
                          ),
                          const Gap(26),
                          Expanded(
                            child: UserTypeBox(
                                icon: AppAssets.partnerIcon,
                                title: 'Partner',
                                isSelected: option == 2,
                                onTap: () {
                                  _selectedOption.value = 2;
                                }),
                          ),
                        ],
                      ),
                      const Gap(60),
                      BusyButton(
                        active: option == 0 ? false : true,
                        title: 'Next',
                        onTap: () {
                          if (option == 1) {
                            Navigator.pushNamed(
                                context, RouteName.signUpScreen);
                          } else if (option == 2) {
                           Navigator.pushNamed(
                                context, RouteName.partnerSignupPage);
                          }
                        },
                      ),
                      const Gap(16),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: IklinColors.textColor.withOpacity(0.7),
                                fontSize: 12,
                                fontFamily: IklinFont.euclid,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Login',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, RouteName.loginScreen),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: IklinColors.primaryColor),
                                ),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class IklinBackButton extends StatelessWidget {
  const IklinBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: IklinColors.white,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
