import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/OrderHhomeScreen.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/partner_hhome_screen.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/walletHhomeScreen.dart';
import 'package:iklin/Partner/home/presentation.dart/widgets/partner_drawer_menu.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';

class PartnerHomeNavbar extends StatefulWidget {
  const PartnerHomeNavbar({Key? key}) : super(key: key);

  @override
  State<PartnerHomeNavbar> createState() => _PartnerHomeNavbarState();
}

class _PartnerHomeNavbarState extends State<PartnerHomeNavbar> {
   int _currentIndex = 0;
  final tabs = [const PartnerHhomeScreen(), const OrderHhomeScreen(), Container(), const WalletHhomeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.start,
      drawer: const PartnerDrawerMenu(),
      backgroundColor: IklinColors.background,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: IklinColors.white,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedItemColor: IklinColors.primaryColor,
        currentIndex: _currentIndex,
        enableFeedback: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          color: IklinColors.primaryColor,
          fontSize: 15,
          fontFamily: IklinFont.euclid,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          color: IklinColors.grey,
          fontSize: 15,
          fontFamily: IklinFont.euclid,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.homeIcon,
                color: IklinColors.grey.withOpacity(0.5),
                height: 20,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.homeIcon,
                height: 20,
                width: 20,
                color: IklinColors.primaryColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(
                  AppAssets.orderIcon,
                  height: 20,
                  width: 20,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(
                  AppAssets.orderIcon,
                  height: 20,
                  width: 20,
                  color: IklinColors.primaryColor,
                ),
              ),
              label: 'Order'),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.report,
                width: 20,
                height: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.report,
                color: IklinColors.primaryColor,
                width: 20,
                height: 20,
              ),
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.walletIcon,
                width: 20,
                height: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AppAssets.walletIcon,
                color: IklinColors.primaryColor,
                width: 20,
                height: 20,
              ),
            ),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
