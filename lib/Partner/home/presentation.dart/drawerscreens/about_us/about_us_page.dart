import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
                  "About Us",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myTextt(text: "About"),
                const Gap(10),
                Container(
                    color: Colors.transparent,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myText(
                            text:
                                "Iklin a service delivery company that brings the"),
                        myText(
                            text:
                                "convenience of room service to homes across"),
                        myText(
                            text:
                                "Africa, by linking them with expert service"),
                        myText(text: "providers in the industry"),
                      ],
                    )),
                const Gap(20),
                InkWell(
                   onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.contactUsPage);
                    },
                  child: myTextt(text: "Contact Us")),
                const Gap(20),
                myTextt(text: "FAQ"),
                const Gap(20),
                myRow(text: "Who are we?"),
                const Gap(10),
                myRow(text: "What do we do?"),
                const Gap(10),
                myRow(text: "How does it work?"),
                const Gap(10),
                myRow(text: "Who are we?"),
                const Gap(10),
                myRow(text: "What do we do?"),
                const Gap(10),
                myRow(text: "How does it work?"),
              ],
            )
          ],
        ),
      )),
    );
  }

  Row myRow({text}) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBody(text,
                  style: const TextStyle(
                    fontSize: 15
                  ),
                  ),
                  const Icon(Icons.arrow_downward,
                  size: 14,
                  ),
                ],
              );
  }

  TextBody myTextt({text}) {
    return TextBody(text,
                style: const TextStyle(fontSize: 18),
              );
  }

  FittedBox myText({text}) {
    return FittedBox(
      child: TextBody(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
