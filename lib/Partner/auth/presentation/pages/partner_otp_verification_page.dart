import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/app_loading_dialog.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PartnerOtpVerificationPage extends StatefulWidget {
  const PartnerOtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<PartnerOtpVerificationPage> createState() =>
      _PartnerOtpVerificationPageState();
}

class _PartnerOtpVerificationPageState
    extends State<PartnerOtpVerificationPage> {
  final TextEditingController _pinController = TextEditingController();
  verifyCode() {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () async {
      Navigator.pop(context);
      await Navigator.pushNamed(context, RouteName.partnerSignupPage3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Gap(30),
              TextBody(
                'Verify OTP code',
                fontSize: 32,
              ),
              const Gap(16),
              TextBody(
                'Please input the one time  password sent to your email/phone for verification',
                color: IklinColors.grey.withOpacity(0.5),
                fontSize: 15,
              ),
              const Gap(53),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                controller: _pinController,
                cursorHeight: 24,
                appContext: context,
                showCursor: true,
                cursorColor: const Color(0xff37474F),
                textStyle: const TextStyle(
                  fontFamily: IklinFont.euclid,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: IklinColors.black,
                ),
                length: 4,
                onCompleted: (value) {
                },
                onChanged: (value) {
                  // print(_pinController.text);
                },
                pinTheme: PinTheme(
                  fieldHeight: 58,
                  activeColor: IklinColors.primaryColor,
                  selectedColor: IklinColors.grey.withOpacity(0.5),
                  inactiveColor: IklinColors.grey.withOpacity(0.5),
                  fieldWidth: 62,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const Gap(30),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                      text: 'Don\'t receive code?',
                      style: TextStyle(
                        color: IklinColors.textColor.withOpacity(0.7),
                        fontSize: 15,
                        fontFamily: IklinFont.euclid,
                        fontWeight: FontWeight.w400,
                      ),
                      children: const [
                        TextSpan(
                          text: ' Resend (1:59)',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: IklinColors.primaryColor),
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(30),
              BusyButton(
                  title: 'Register',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const AppLoadingDialog(
                              text: 'Verifying Code',
                            ),
                          );
                        });
                          verifyCode();
                    // Navigator.pushNamed(context, RouteName.partnerSignupPage3);
                  }
                  ),
            ],
          ),
        ),
      )),
    );
  }
}
