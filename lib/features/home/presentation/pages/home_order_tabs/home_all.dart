import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/constant.dart';

class HomeAll extends StatelessWidget {
  const HomeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(16),
            orderContainer(context),
            const Gap(8),
            orderContainerr(context),
            const Gap(8),
            orderContainer(context),
            const Gap(8),
            orderContainerr(context),
            const Gap(8),
            orderContainer(context)
          ],
        ),
      ),
    );
  }

  Container orderContainerr(BuildContext context) {
    return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                    width: 36,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.female),
                    ),
                  ),
                  const Gap(30),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextSemiBold(
                            "Balogun Hammed",
                            fontSize: 18,
                          ),
                          TextSemiSemiBold(
                            "Request Dry Cleaning",
                            fontSize: 15,
                            color: const Color(0xFF03A74E),
                          ),
                          TextSemiSemiBold(
                            "14, Adeniji Adelel Road, Lagos Island",
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          TextSemiSemiBold(
                            "Thur 14 may. 2022 -01:02PM",
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                TextSemiBold(
                                  "In- progress",
                                  color: const Color(0xFFF7A54B),
                                  fontSize: 16,
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF7A54B),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: SvgPicture.asset(
                                    AppAssets.icondown,
                                    height: 12,
                                    width: 12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Container orderContainer(BuildContext context) {
    return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                    width: 36,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.male),
                    ),
                  ),
                  const Gap(30),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextSemiBold(
                            "Balogun Hammed",
                            fontSize: 18,
                          ),
                          TextSemiSemiBold(
                            "Request Dry Cleaning",
                            fontSize: 15,
                            color: const Color(0xFF03A74E),
                          ),
                          TextSemiSemiBold(
                            "14, Adeniji Adelel Road, Lagos Island",
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          TextSemiSemiBold(
                            "Thur 14 may. 2022 -01:02PM",
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                TextSemiBold(
                                  "Delivered",
                                  color: const Color(0xFF03A74E),
                                  fontSize: 16,
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF76D1A0),
                                      borderRadius: BorderRadius.circular(9)),
                                      child: SvgPicture.asset(
                                    AppAssets.iconup,
                                    height: 12,
                                    width: 12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
