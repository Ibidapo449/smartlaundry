import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/card_add_successfully_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';

class AccountTypeModal extends StatelessWidget {
  const AccountTypeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 299,
     width: double.infinity,
     decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Gap(40),
            TextBody("You are about to add",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54
            ),
            ),
            const Gap(20),
            TextSemiSemiBold("Obe David Ibidapo (FCMB",
            style: const TextStyle(
              fontSize: 18
            ),
            ),
           TextSemiSemiBold("- 5830479016 )",
            style: const TextStyle(
              fontSize: 18
            ),
            ),
           const Gap(20),
            TextBody("to your iKlin Account",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54
            ),
            ),
           const Gap(30),
            BusyButton(
              title: "Continue", 
              onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const AddCardSuccessfullyModal();
                        });
                  },
              )

          ],
        ),
      ),
    );
  }
}