import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/auth/presentation/widgets/partner_registration_sucessful_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/app_loading_dialog.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class PartnerSignupPage3 extends StatefulWidget {
  const PartnerSignupPage3({Key? key}) : super(key: key);

  @override
  State<PartnerSignupPage3> createState() => _PartnerSignupPage3State();
}

class _PartnerSignupPage3State extends State<PartnerSignupPage3> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _comfirmPasswordController = TextEditingController();
  verifyCode() {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () async {
      Navigator.pop(context);
      await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          context: context,
          builder: (context) {
            return const PartnerRegistrationSuccessfulModal();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBody(
                      'Secure your',
                      fontSize: 32,
                    ),
                
                     Row(
                       children: [
                         TextBody(
                          "3 of 3",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: size,
                      height: size,
                      child: Stack(children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return SweepGradient(
                                startAngle: 0.0,
                                endAngle: 3.14 * 4,
                                stops: const [0.5, 0.5],
                                center: Alignment.center,
                                colors: [
                                  Colors.green,
                                  Colors.grey.withAlpha(55)
                                ]).createShader(rect);
                          },
                          child: Container(
                            width: size,
                            height: size,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: size - 7,
                            height: size - 7,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        )
                      ]),
                    )
                       ],
                     ),
                    
                  ],
                ),
                TextBody(
                  "account",
                  fontSize: 32,
                ),
                const Gap(42),
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
                TextBody(
                  'Confirm Password',
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 15,
                ),
                const Gap(8),
                InputField(
                  controller: _comfirmPasswordController,
                  placeholder: 'Password',
                  password: true,
                ),
                const Gap(42),
                BusyButton(
                    title: 'Next',
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const AppLoadingDialog(
                                text: 'Verifying Password',
                              ),
                            );
                          });
                      verifyCode();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
