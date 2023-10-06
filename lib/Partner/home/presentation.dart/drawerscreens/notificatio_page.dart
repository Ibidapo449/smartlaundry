import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
                      "Notification",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                const Gap(25),
                InputField(
                  controller: TextEditingController(),
                  placeholder: 'Search',
                  fieldColor: IklinColors.white.withOpacity(0.4),
                  validationColor: IklinColors.grey2.withOpacity(
                    0.2,
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(
                      right: 11,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                    ),
                  ),
                ),
                const Gap(11),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const  [
                         myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,),
                        myContainer(),
                        SizedBox(height: 5,)
                      ],
                    ),
                  ),
                )
            ],
          ),
        )
      )
    );
  }
}

// ignore: camel_case_types
class myContainer extends StatelessWidget {
  const myContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey
        ),
      borderRadius: BorderRadius.circular(10),
       color: IklinColors.white.withOpacity(0.4),
     ),
      height: 110,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSemiBold("Glad you signed up Hammed",
            style: const TextStyle(
              fontSize: 15
            ),
            ),
            const SizedBox(height: 7,),
            FittedBox(
               fit: BoxFit.fitWidth,
              child: TextBody("Say HELLO to the smart way of doing your",
              style: const TextStyle(
                fontSize: 15
              ),
              ),
            ),
            FittedBox(
               fit: BoxFit.fitWidth,
              child: TextBody("laundry and house cleaning.Book now and",
              style: const TextStyle(
                fontSize: 15
              ),
              ),
            ),
            TextBody("enjoy easy laundry and cleaning",
            style: const TextStyle(
              fontSize: 15
            ),
            )
          ],
        ),
      ),
    );
  }
}