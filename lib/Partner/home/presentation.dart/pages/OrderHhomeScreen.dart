import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/tabbarpages/all.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/tabbarpages/completed.dart';
import 'package:iklin/Partner/home/presentation.dart/pages/tabbarpages/inprogress.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class OrderHhomeScreen extends StatefulWidget {
  const OrderHhomeScreen({super.key});

  @override
  State<OrderHhomeScreen> createState() => _OrderHhomeScreenState();
}

class _OrderHhomeScreenState extends State<OrderHhomeScreen>
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
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
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
                                          child: TextBody("Complete",
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
                                All(),
                                Inprogress(),
                                Completed()
                              ],
                            ),
                          )
                        ],
                      ),
                      ),
                ),
              ])),
        ));
  }
}
