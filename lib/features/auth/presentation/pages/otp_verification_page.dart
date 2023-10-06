// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/core/sl/sl_container.dart';
import 'package:iklin/features/auth/presentation/change_notifier/auth_notifier.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    Key? key,
    required this.params,
  }) : super(key: key);
  final VerificationArgument params;
  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _pinController = TextEditingController();
  verifyCode() {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () async {
      Navigator.pop(context);
      await Navigator.pushNamed(context, RouteName.completeSignupPage);
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
                length: 6,
                onCompleted: (value) async {
                  print('Verify otp');
                  await getIt<AuthNotifier>().activateBasicSignnup(
                    context,
                    email: widget.params.email,
                    otp: _pinController.text.trim(),
                  );
                  /*  showDialog(
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
                  verifyCode();*/
                },
                onChanged: (value) {
                  print(_pinController.text);
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
            ],
          ),
        ),
      )),
    );
  }
}

class VerificationArgument {
  VerificationArgument({
    required this.email,
  });

  final String email;
}
