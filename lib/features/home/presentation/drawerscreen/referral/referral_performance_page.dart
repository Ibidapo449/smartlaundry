import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ReferralPerformancePage extends StatelessWidget {
  const ReferralPerformancePage({super.key});

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
                    const Gap(55),
                    TextBody(
                      "Referral Performance",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Gap(30),
                DottedBorder(
                  dashPattern: const [2, 4],
                  color: Colors.grey,
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  radius: const Radius.circular(8),
                  child: Container(
                    height: 138,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBody("Amount Earn",
                              fontSize: 15,
                              color: Colors.grey,
                              ),
                              TextBody("NGN 0",
                              fontSize: 34,
                              color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 308,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        myRow(
                          text: "Total Earinig",
                          textt: "NGN 0"
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myRow(
                           text: "Used Link",
                          textt: "0"
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myRow(
                           text: "Total Signups",
                          textt: "0"
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myRow(
                           text: "Signups that orders",
                          textt: "0"
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row myRow({text, textt}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBody(
          text,
          color: Colors.grey,
          fontSize: 15,
        ),
        TextBody(
          textt,
          color: Colors.grey,
          fontSize: 15,
        )
      ],
    );
  }
}
