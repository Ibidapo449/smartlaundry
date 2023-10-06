import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

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
            children: [
              const Gap(20),
              Row(
                children: [
                  const IklinBackButton(),
                  const Gap(89),
                  TextBody(
                    "Refer a friend",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              const Gap(30),
              SizedBox(
                height: 145,
                width: 230,
                child: Image.asset(
                  AppAssets.referral,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 69,
                width: 221,
                child: Column(
                  children: [
                    TextSemiSemiBold(
                      "Get NGN1,000 on your",
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                    TextSemiSemiBold(
                      "next order for each friend",
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                    TextSemiSemiBold(
                      "you refer",
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 62,
              ),
              DottedBorder(
                dashPattern: const [2, 3],
                color: const Color(0xFF023C1C),
                borderType: BorderType.RRect,
                strokeWidth: 1,
                radius: const Radius.circular(40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 69,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextSemiSemiBold(
                        "BALOG346",
                        fontSize: 36,
                        color: const Color(0xFF023C1C),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      const Icon(
                        Icons.copy,
                        color: Color(0xFF023C1C),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              TextBody(
                "Share your invite code",
                fontSize: 15,
                color: IklinColors.primaryColor,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 52,
                width: 217,
                decoration: BoxDecoration(
                    color: const Color(0xFF03A74E),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: TextSemiBold(
                    "SHARE YOUR CODE",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 95,
                  width: 292,
                  child: Column(
                    children: [
                      myText(text: "Share your Iklin code with friends and"),
                      myText(text: "family to get NGN1,000 when they sign"),
                      myText(text: "up and you can enjoy NGN1,000 once"),
                      myText(text: "with Iklin. Valid for 15 days only"),
                      myText(text: "Iklin. Valid for 15 days only"),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                        Navigator.pushNamed(context, RouteName.referralPerformancePage);
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBody(
                      "View referral performance",
                      fontSize: 15,
                      color: IklinColors.primaryColor,
                    ),
                    const SizedBox(width: 8,),
                    const Icon(Icons.arrow_forward_ios,
                    color: IklinColors.primaryColor,
                    size: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  TextBody myText({text}) {
    return TextBody(
      text,
      color: Colors.grey,
      fontSize: 15,
    );
  }
}
