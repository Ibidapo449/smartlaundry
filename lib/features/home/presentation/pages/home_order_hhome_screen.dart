import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/home/presentation/pages/home_order_tabs/home_all.dart';
import 'package:iklin/features/home/presentation/pages/home_order_tabs/home_delivered.dart';
import 'package:iklin/features/home/presentation/pages/home_order_tabs/home_inprogress.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class HomeOrderHhomeScreen extends StatefulWidget {
  const HomeOrderHhomeScreen({super.key});

  @override
  State<HomeOrderHhomeScreen> createState() => _OrderHhomeScreenState();
}

class _OrderHhomeScreenState extends State<HomeOrderHhomeScreen> 
with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
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
                const Gap(122),
                TextBody(
                  "Order",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
             const Gap(11),
            Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                  child: SizedBox(
                                    height: 35,
                                    child: TabBar(
                                      unselectedLabelColor: Colors.black,
                                      labelColor: Colors.black,
                                      indicatorColor: Colors.white,
                                      indicatorWeight: 3,
                                      indicator: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      controller: tabController,
                                      tabs: [
                                        Tab(
                                          child: TextBody("All",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Tab(
                                         child: TextBody("In progress",
                                         fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                        ),
                                        Tab(
                                          child: TextBody("Delivered",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: const [
                                HomeAll(),
                                HomeInprogress(),
                                HomeDelivered()
                              ],
                            ),
                          )
          ],
        ),
      )),
    ]))));
  }
}
