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
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

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
                const IklinBackButton(),
                const Gap(47),
                TextBody(
                  'Log in to your account',
                  fontSize: 32,
                ),
                const Gap(50),
                TextBody(
                  'Email address',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                  placeholder: 'Enter Email Address',
                  suffix: SvgPicture.asset(AppAssets.mailIcon),
                ),
                const Gap(16),
                TextBody(
                  'Password',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  password: true,
                ),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                              side: const BorderSide(
                                width: 1.5,
                                color: IklinColors.grey,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: IklinColors.white,
                              activeColor: IklinColors.primaryColor,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              }),
                        ),
                        const Gap(8),
                        TextBody(
                          'Remember me',
                          fontSize: 15,
                          color: IklinColors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.forgotPassword);
                      },
                      child: TextBold(
                        'Forgot password?',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const Gap(30),
                BusyButton(
                  title: 'Login',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.homeNav);
                  },
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                          color: IklinColors.textColor.withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: IklinFont.euclid,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: ' Create one',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                    context,
                                    RouteName.signUpScreen,
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
                  height: MediaQuery.of(context).size.height * 0.05,
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
        ),
      ),
    );
  }
}

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: IklinColors.grey.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              icon,
            ),
            TextBody(
              title,
              color: IklinColors.grey.withOpacity(0.7),
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
