import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/navigators/navigators.dart';

class AddCardSuccessfullyModal extends StatelessWidget {
  const AddCardSuccessfullyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 346,
      width: double.infinity,
       decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          const Gap(30),
           Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: IklinColors.primaryColor,
                )),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.mail2,
                color: IklinColors.primaryColor,
                width: 38,
                height: 30,
              ),
            ),
          ),
          const Gap(20),
          TextSemiSemiBold("Account",
            style: const TextStyle(
              fontSize: 24
            ),
            ),
            TextSemiSemiBold("Successfully Added",
            style: const TextStyle(
              fontSize: 24
            ),
            ),
            const Gap(10),
             TextBody("Your account has been successfully",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54
            ),
            ),
             TextBody("added into your Iklin account",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54
            ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: BusyButton(
                title: "Continue", 
                onTap: (){
                      Navigator.pushNamed(
                          context, RouteName.manageBankPage);  
                }
                
                ),
            )
        ],
      ),
    );
  }
}