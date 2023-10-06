import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/auth/presentation/widgets/reset_password_successful_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  gotoNextPage() {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        Navigator.pop(context);
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) {
              return const ResetPasswordSuccessfulModal();
            });
      },
    );
  }

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
                  'New Password',
                  fontSize: 32,
                ),
                const Gap(8),
                TextBody(
                  'Enter the code sent to your email adress alongside your new password',
                  color: IklinColors.grey.withOpacity(0.5),
                ),
                const Gap(30),
                TextBody(
                  'Reset Code',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: TextEditingController(),
                  placeholder: '',
                ),
                const Gap(8),
                TextBody(
                  'New Password',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: TextEditingController(),
                  placeholder: '',
                ),
                const Gap(8),
                TextBody(
                  'Confirm Password',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: TextEditingController(),
                  placeholder: '',
                ),
                const Gap(30),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                        text: 'Haven\'t gotten a code? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: IklinFont.euclid,
                          fontWeight: FontWeight.w700,
                          color: IklinColors.grey.withOpacity(0.3),
                        ),
                        children: const [
                          TextSpan(
                            text: 'Resend a new code',
                            style: TextStyle(
                              color: IklinColors.primaryColor,
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                BusyButton(
                  title: 'Reset Password',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AppLoad(
                            title: 'Please wait',
                          );
                        });
                    gotoNextPage();
                  },
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

class AppLoad extends StatelessWidget {
  const AppLoad({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 66,
            width: 66,
            child: CircularProgressIndicator(
              color: IklinColors.white,
            ),
          ),
          const Gap(10),
          TextBody(
            title,
            fontSize: 18,
            color: IklinColors.white,
          )
        ],
      ),
    );
  }
}
