import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/change_password_modal.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/document_option_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                    "Settings",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  myContainer(
                    text: "Personal Information",
                    assets: AppAssets.profile,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.updateProfilePage);
                    }
                  ),
                  const SizedBox(height: 15,),
                  myContainer(
                    text: "Document",
                    assets: AppAssets.documentIcon,
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
                          return const DocumentOptionModal();
                        });
                  },
                  ),
                  const SizedBox(height: 15,),
                  myContainer(
                    text: "Change Password",
                    assets: AppAssets.eyeIcon,
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
                          return const ChangePasswordModal();
                        });
                  },
                  ),
                  const SizedBox(height: 15,),
                  myContainer(
                    text: "Add Bank",
                    assets: AppAssets.bankIcon,
                     onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.addBankPage);
                    }
                  ),
                  const SizedBox(height: 15,),
                 GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          color: IklinColors.white.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orangeAccent),
                height: 24,
                width: 24,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                      AppAssets.deleteIcon,
                    color: const Color(0xFFF24E1E),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TextSemiSemiBold("Delete Acount",
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer({text, assets, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          color: IklinColors.white.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: IklinColors.accentGreen),
                height: 24,
                width: 24,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    assets,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TextSemiSemiBold(text,
                style: const TextStyle(fontSize: 15),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios,
              size: 14,)
            ],
          ),
        ),
      ),
    );
  }
}
