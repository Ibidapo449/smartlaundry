import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/remove_card_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ManageBankPage extends StatelessWidget {
  const ManageBankPage({super.key});

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
                const Gap(60),
                TextBody(
                  "Manage Bank",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Icon(
                  Icons.house,
                  color: Colors.black54,
                ),
                const Gap(10),
                TextSemiBold(
                  "Default Bank",
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const Gap(10),
            FittedBox(
              child: TextBody(
                "Your defaut bank is use in receving your payment, it",
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            FittedBox(
              child: TextBody(
                "make it easy and faster way to get for your",
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            FittedBox(
              child: TextBody(
                "payment in an automated way",
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            const Gap(30),
            myRow(text: "Account Name", textt: "Obe David Ibidapo"),
            const Gap(6),
            const Divider(),
            myRow(text: "Account Number", textt: "5830479016"),
            const Gap(6),
            const Divider(),
            myRow(text: "Account Type", textt: "Savings"),
            const Gap(6),
            const Divider(),
            myRow(text: "Bank Name", textt: "FCMB"),
            const Gap(6),
            const Divider(),
            myRow(text: "Date Added", textt: "05, June 2022"),
            const Gap(6),
            const Divider(),
            const Gap(30),
            Center(
              child: Container(
                width: 149,
                height: 42,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBody(
                      "ADD BANK",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Gap(5),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            InkWell(
               onTap: () => AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                       animType: AnimType.BOTTOMSLIDE,
                      dialogType: DialogType.NO_HEADER,
                      body: const RemoveCardModal(),
                    ).show(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBody(
                    "REMOVE BANK",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFF24E1E),
                    ),
                  ),
                  const Gap(5),
                  SvgPicture.asset(
                    AppAssets.deleteIcon,
                    color: const Color(0xFFF24E1E),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Row myRow({text, textt}) {
    return Row(
      children: [
        TextBody(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
        const Spacer(),
        TextBody(
          textt,
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        )
      ],
    );
  }
}
