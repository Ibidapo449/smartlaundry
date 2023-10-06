import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/navigators/navigators.dart';

class PartnerDrawerMenu extends StatelessWidget {
  const PartnerDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: IklinColors.background,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.homeBackground,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 60,
                      left: 24,
                    ),
                    child: SizedBox(
                      height: 64,
                      width: 64,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          AppAssets.userImg,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(13),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSemiBold(
                      'So-Kleen Limited',
                      color: IklinColors.primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              const Gap(27),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.profile,
                      ),
                      title: TextSemiSemiBold(
                        'Profile',
                        fontSize: 16,
                      ),
                      onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.profilePage);
                    }
                    ),
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.notificationIcon,
                      ),
                      title: TextSemiSemiBold(
                        'Notification',
                        fontSize: 16,
                      ),
                       onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.notificationPage);
                    }
                    ),
                     ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.settings,
                      ),
                      title: TextSemiSemiBold(
                        'Settings',
                        fontSize: 16,
                      ),
                       onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.settingsPage);
                    }
                    ),
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.giftIcon,
                      ),
                      title: TextSemiSemiBold(
                        'Invite',
                        fontSize: 16,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.chatIcon,
                      ),
                      title: TextSemiSemiBold(
                        'Chat',
                        fontSize: 16,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.aboutIcon,
                      ),
                      title: TextSemiSemiBold(
                        'About us',
                        fontSize: 16,
                      ),
                      onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.aboutUsPage);
                    }
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                height: 1,
                color: IklinColors.textColor.withOpacity(0.2),
              ),
              const Gap(35),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(AppAssets.starIcon),
                      title: TextSemiSemiBold(
                        'Rate us',
                        fontSize: 15,
                      ),
                      trailing: Container(
                        height: 18,
                        width: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: IklinColors.textColor.withOpacity(0.3),
                        ),
                        child: Center(
                          child: TextSemiSemiBold(
                            'V 1.0',
                            color: IklinColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      leading: SvgPicture.asset(
                        AppAssets.signOutIcon,
                      ),
                      title: TextSemiSemiBold(
                        'Sign Out',
                        fontSize: 15,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
