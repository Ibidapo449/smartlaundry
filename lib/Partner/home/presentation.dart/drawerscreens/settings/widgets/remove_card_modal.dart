import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/remove_successfully_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';

class RemoveCardModal extends StatelessWidget {
  const RemoveCardModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
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
          const Gap(40),
          TextSemiBold(
            "Please Confirm",
            style: const TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const Gap(10),
          TextBody(
            "Oops, are you sure",
            style: const TextStyle(fontSize: 15, color: Colors.black54),
          ),
          TextBody(
            "you want to remove",
            style: const TextStyle(fontSize: 15, color: Colors.black54),
          ),
          TextBody(
            "your card ?",
            style: const TextStyle(fontSize: 15, color: Colors.black54),
          ),
          const Gap(20),
          Center(
            child: InkWell(
              onTap: () => AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                       animType: AnimType.BOTTOMSLIDE,
                      dialogType: DialogType.NO_HEADER,
                      body: const RemoveSuccessfullyModal(),
                    ).show(),
              child: Container(
                width: 149,
                height: 42,
                decoration: BoxDecoration(
                    color: const Color(0xFFF24E1E),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBody(
                      "REMOVE BANK",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Gap(5),
                    SvgPicture.asset(
                      AppAssets.deleteIcon,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(20),
          Center(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: TextBody(
              "CANCEL",
              style: const TextStyle(fontSize: 15),
            ),
          ))
        ],
      ),
    );
  }
}
