import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class PartnerSignupPage extends StatefulWidget {
  const PartnerSignupPage({Key? key}) : super(key: key);

  @override
  State<PartnerSignupPage> createState() => _PartnerSignupPageState();
}

class _PartnerSignupPageState extends State<PartnerSignupPage> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = 22;
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
                      'Let’s get to know',
                      fontSize: 29,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        TextBody(
                          "1 of 3",
                          style: const TextStyle(
                            fontSize: 16,
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
                                stops: const [0.1, 0.1],
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
                  "about you",
                  fontSize: 29,
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
                  'Email Address',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                    controller: _emailController,
                    placeholder: 'iKlin@yahoo.com',
                    suffix: SvgPicture.asset(
                      AppAssets.mailIcon,
                    )),
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
                const Gap(48),
                BusyButton(
                    title: 'Next',
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.partnerSignupPage2);
                    }
                    ),
                    const Gap(48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
