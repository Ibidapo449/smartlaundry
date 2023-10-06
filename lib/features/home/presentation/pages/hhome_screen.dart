// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/home/presentation/widgets/drawer_menu.dart';
import 'package:iklin/features/home/presentation/widgets/order_container.dart';
import 'package:iklin/features/home/presentation/widgets/refer_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const DraweMenu(),
      backgroundColor: IklinColors.background,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.homeBackground,
            height: 247,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _key.currentState!.openDrawer();
                            print('menu');
                          },
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 38,
                                width: 38,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppAssets.userImg),
                                ),
                              ),
                              const Gap(26),
                              Column(
                                children: [
                                  TextBody(
                                    'Hi Balogun',
                                    fontSize: 14,
                                    color: IklinColors.textColor.withOpacity(
                                      0.7,
                                    ),
                                  ),
                                  const Gap(3),
                                  TextBold(
                                    'Welcome',
                                    fontSize: 18,
                                  )
                                ],
                              ),
                              const Gap(5),
                              Image.asset(
                                AppAssets.clapEmoji,
                              )
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: IklinColors.accentGreen,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: const [],
                            ),
                          ),
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
                    const RefferalBox(),
                    const Gap(25),
                    Row(
                      children: [
                        TextBody(
                          'Popular Services',
                          fontSize: 18,
                        ),
                        const Gap(5),
                        Image.asset(
                          AppAssets.fireEmoji,
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                    const Gap(17),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          PopularServices(
                            image: AppAssets.basketEmoji,
                            title: 'Laundry',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.laundryScreen);
                            },
                          ),
                          const Gap(20),
                          PopularServices(
                            image: AppAssets.houseEmoji,
                            title: 'Cleaning',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.selectCleaningType);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBody(
                          'Recent Orders',
                          fontSize: 18,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: TextSemiBold(
                            'View All',
                            color: IklinColors.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Gap(6),
                    OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Delivered',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.receiptScreen,
                        );
                      },
                    ),
                    OrderContainer(
                      onTap: () {},
                      orderType: 'Cleaning',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Done',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularServices extends StatelessWidget {
  const PopularServices({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    this.textColor = IklinColors.black,
  }) : super(key: key);
  final String image;
  final String title;
  final VoidCallback onTap;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: IklinColors.primaryColor.withOpacity(0.1),
                blurRadius: 7,
                spreadRadius: 5,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 36,
              width: 36,
            ),
            const Gap(16),
            TextSemiBold(
              title,
              fontSize: 15,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
