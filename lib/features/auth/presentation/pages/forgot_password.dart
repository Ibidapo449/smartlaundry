import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/auth/presentation/widgets/forgot_password_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Gap(4),
                Align(
                  child: Image.asset(
                    AppAssets.iklinLogo2,
                    height: 36,
                    width: 115,
                  ),
                ),
                const Gap(35),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: IklinColors.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.lockIcon,
                    ),
                  ),
                ),
                const Gap(43),
                TextBody(
                  'Forgot Password',
                  fontSize: 32,
                ),
                const Gap(8),
                TextBody(
                  'Please enter your registered email address, we will provide you a code to help reset your password',
                  maxLines: 4,
                  fontSize: 15,
                  color: IklinColors.grey.withOpacity(
                    0.5,
                  ),
                ),
                const Gap(30),
                TextBody(
                  'Email address',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: TextEditingController(),
                  placeholder: 'Enter Email Address',
                  suffix: SvgPicture.asset(
                    AppAssets.mailIcon,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                BusyButton(
                  title: 'Send Reset Code',
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const ForgotPasswordModal();
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
