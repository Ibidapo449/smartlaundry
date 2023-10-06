import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
        child: Padding(
           padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Gap(20),
            Row(
              children: [
                const IklinBackButton(),
                const Gap(90),
                TextBody(
                  "Contact Us",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            const Gap(20),
            TextBody("Contact Us",
            style: const TextStyle(
              fontSize: 18,
            ),
            ),
             const Gap(20),
             mytext(text: "We are avalilabe to support you all the way.\nReach out to us"),
            const Gap(30),
            mytext(text: "+234 818 183 9179"),
             const Gap(20),
              mytext(text: "support@iklin.com.ng"),
             const Gap(20),
              mytext(text: "Connect With Us on our Social Media \nAccount"),
             const Gap(20),
             mytextt(text: "Facebook"),
             const Gap(20),
             mytextt(text: "Instagram"),
             const Gap(20),
             mytextt(text: "Linkedlin"),
             const Gap(20),
             mytextt(text: "Twitter"),
             
          ],
        ),
        )
      ),
    );
  }

  TextSemiSemiBold mytextt({text}) {
    return TextSemiSemiBold(text,
           style: const TextStyle(
            fontSize: 18,
           ),
           );
  }

  TextBody mytext({text}) {
    return TextBody(text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey
          ),
          );
  }
}