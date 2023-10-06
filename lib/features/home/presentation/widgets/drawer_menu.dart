// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';

class DraweMenu extends StatelessWidget {
  const DraweMenu();

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
                      'Balogun Hammed',
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
                      leading: SvgPicture.asset(
                        AppAssets.profile,
                      ),
                      title: TextBody(
                        'Profile',
                        fontSize: 18,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.userUpdateProfile);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.paymentIcon,
                      ),
                      title: TextBody(
                        'Payment',
                        fontSize: 18,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.giftIcon,
                      ),
                      title: TextBody(
                        'Referral',
                        fontSize: 18,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.referralPage);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.chatIcon,
                      ),
                      title: TextBody(
                        'Chat',
                        fontSize: 18,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.aboutIcon,
                      ),
                      title: TextBody(
                        'About us',
                        fontSize: 18,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.aboutUsPage);
                      },
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
                      leading: SvgPicture.asset(AppAssets.starIcon),
                      title: TextBody(
                        'Rate us',
                        fontSize: 18,
                      ),
                      trailing: Container(
                        height: 18,
                        width: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: IklinColors.textColor.withOpacity(0.3),
                        ),
                        child: Center(
                          child: TextSemiBold(
                            'V 1.0',
                            color: IklinColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.signOutIcon,
                      ),
                      title: TextBody(
                        'Sign Out',
                        fontSize: 18,
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
