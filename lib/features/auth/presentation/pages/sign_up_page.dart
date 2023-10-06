import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/core/sl/sl_container.dart';
import 'package:iklin/features/auth/presentation/change_notifier/auth_notifier.dart';
import 'package:iklin/features/auth/presentation/pages/login_screen.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  const IklinBackButton(),
                  const Gap(48),
                  TextBody(
                    'Let’s create your account',
                    fontSize: 32,
                  ),
                  const Gap(30),
                  TextBody(
                    'Email address',
                    fontSize: 15,
                    color: IklinColors.grey.withOpacity(0.7),
                  ),
                  const Gap(8),
                  InputField(
                    controller: emailController,
                    placeholder: 'Enter Email Address',
                    suffix: SvgPicture.asset(
                      AppAssets.mailIcon,
                    ),
                  ),
                  const Gap(30),
                  BusyButton(
                    title: 'Continue',
                    onTap: () async {
                      await getIt<AuthNotifier>().basicSignup(
                        context,
                        email: emailController.text.trim(),
                      );

                      /* showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return const CodeSentModal();
                          });*/
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
                            fontSize: 15,
                            fontFamily: IklinFont.euclid,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                      context,
                                      RouteName.loginScreen,
                                    ),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: IklinColors.primaryColor),
                            ),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: IklinColors.grey.withOpacity(0.7),
                        ),
                      ),
                      const Gap(16),
                      TextBody(
                        'OR',
                        fontSize: 18,
                        color: IklinColors.grey.withOpacity(0.7),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: IklinColors.grey.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SocialMediaContainer(
                    icon: AppAssets.apple,
                    title: 'Sign in with Apple ID',
                    onTap: () {},
                  ),
                  const Gap(20),
                  SocialMediaContainer(
                    icon: AppAssets.google,
                    title: 'Sign in with Google',
                    onTap: () {},
                  ),
                  const Gap(20),
                  SocialMediaContainer(
                    icon: AppAssets.fb,
                    title: 'Sign in with Facebook',
                    onTap: () {},
                  ),
                  const Gap(20),
                ],
              ),
            ),
          )),
    );
  }
}
