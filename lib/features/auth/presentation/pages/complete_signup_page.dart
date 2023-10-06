import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/auth/presentation/widgets/referaral_code_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CompleteSignupPage extends StatefulWidget {
  const CompleteSignupPage({Key? key}) : super(key: key);

  @override
  State<CompleteSignupPage> createState() => _CompleteSignupPageState();
}

class _CompleteSignupPageState extends State<CompleteSignupPage> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
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
                  'Let’s get to know you',
                  fontSize: 32,
                ),
                const Gap(42),
                TextBody(
                  'First Name',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _firstnameController,
                  placeholder: 'Enter your first name',
                  suffix: SvgPicture.asset(
                    AppAssets.personIcon,
                  ),
                ),
                const Gap(16),
                TextBody(
                  'Last Name',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _lastnameController,
                  placeholder: 'Enter your last name',
                  suffix: SvgPicture.asset(
                    AppAssets.personIcon,
                  ),
                ),
                const Gap(16),
                TextBody(
                  'Phone Number',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _phoneNumberController,
                  placeholder: 'Enter your phone number',
                ),
                const Gap(16),
                TextBody(
                  'Password',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _passwordController,
                  password: true,
                  placeholder: 'Enter Password',
                ),
                const Gap(16),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        )),
                        context: context,
                        builder: (context) {
                          return const ReferralCodeModal();
                        });
                  },
                  child: TextSemiBold(
                    'Got a referral code?',
                    color: IklinColors.primaryColor,
                    fontSize: 14,
                  ),
                ),
                const Gap(48),
                BusyButton(
                    title: 'Create Account',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.letsGoScreen);
                    }),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
