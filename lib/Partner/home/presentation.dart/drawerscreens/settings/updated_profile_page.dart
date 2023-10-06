import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class UpdatedProfilePage extends StatelessWidget {
  const UpdatedProfilePage({super.key});

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
                    const Gap(119),
                    TextBody(
                      "Profile",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                const Gap(20),
                 Center(
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black54,
                        )),
                   child: Image.asset(
                          AppAssets.laundry,
                          fit: BoxFit.fill,
                        ),     
                  ),
                ),
                const Gap(5),
                Center(
                    child: TextBody(
                  "Change Picture",
                  color: Colors.green,
                )),
               const Gap(15), 
               Row(
                children: [
                  TextSemiSemiBold("Personal Info",
                  fontSize: 18,
                  ),
                  const Spacer(),
                  TextBody("Edit",color: Colors.green),
                ],
               ),
               const Gap(20),
               myRow(text: "Company's Name", textt: "Ibidapo's Cleaning Agency"),
               const Gap(7),
               const Divider(),
                myRow(text: "CAC Number", textt: "AB4036EB"),
               const Gap(7),
               const Divider(),
                myRow(text: "Email Address", textt: "Ibidapodavid10@gmail.com"),
               const Gap(7),
               const Divider(),
                myRow(text: "Phone Number", textt: "08143837353"),
               const Gap(7),
               const Divider(),
                myRow(text: "Office Address", textt: "Adeyemi Obe Close, Lagos"),
               const Gap(7),
               const Divider(),
                myRow(text: "State", textt: "Lagos,State"),
               const Gap(7),
               const Divider(),
                myRow(text: "Location Area", textt: "Ipaja,Lagos"),
               const Gap(7),
               const Divider(),
               myRow(text: "Service Type", textt: "Cleaning Service"),
               const Gap(7),
               const Divider(),
            ],
          ),
        )
        ),
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