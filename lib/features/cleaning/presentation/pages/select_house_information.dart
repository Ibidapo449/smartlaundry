import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/cleaning/presentation/widgets/select_house_type_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SelectHouseInformationn extends StatefulWidget {
  const SelectHouseInformationn({super.key});

  @override
  State<SelectHouseInformationn> createState() =>
      _SelectHouseInformationnState();
}

class _SelectHouseInformationnState extends State<SelectHouseInformationn> {
  String selectedType = '';
  bool active = false;
  int bedroomCount = 0;
  int livingRoomCount = 0;
  int toiletsCount = 0;
  int kitchenCount = 0;
  int balcony = 0;
  int study = 0;

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IklinBackButton(),
                TextSemiBold(
                  'House Information',
                  fontSize: 18,
                  color: IklinColors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const Gap(44),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextSemiBold(
                          'Select your house\ninformation',
                          fontSize: 24,
                          color: IklinColors.grey,
                        ),
                        const Gap(33),
                        TextBody(
                          'Creating a basket will help you compare prices across different laundries',
                          fontSize: 15,
                          color: IklinColors.grey.withOpacity(0.6),
                        ),
                        const Gap(43),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const SelectHouseTypeModal();
                                }).then((value) {
                              setState(() {
                                selectedType = value;
                                active = true;
                              });
                            });
                          },
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: active
                                    ? IklinColors.primaryColor
                                    : IklinColors.grey.withOpacity(0.2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBody(
                                    selectedType == ''
                                        ? 'Select your house type'
                                        : selectedType,
                                    fontSize: 14,
                                    color: IklinColors.grey.withOpacity(0.5),
                                  ),
                                  Icon(
                                    active
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: IklinColors.grey.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(18),
                        active
                            ? Column(
                                children: [
                                  HouseProperties(
                                    title: 'Bedroom',
                                    number: bedroomCount,
                                    add: () {
                                      setState(() {
                                        bedroomCount++;
                                      });
                                    },
                                    remove: () {
                                      setState(() {
                                        bedroomCount > 0
                                            ? bedroomCount--
                                            : null;
                                      });
                                    },
                                  ),
                                  HouseProperties(
                                      title: 'Living Rooms/ Dining Areas',
                                      number: livingRoomCount,
                                      add: () {
                                        setState(() {
                                          livingRoomCount++;
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          livingRoomCount > 0
                                              ? livingRoomCount--
                                              : null;
                                        });
                                      }),
                                  HouseProperties(
                                      title: 'Toilets',
                                      number: toiletsCount,
                                      add: () {
                                        setState(() {
                                          toiletsCount++;
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          toiletsCount > 0
                                              ? toiletsCount--
                                              : null;
                                        });
                                      }),
                                  HouseProperties(
                                      title: 'Kitchen',
                                      number: kitchenCount,
                                      add: () {
                                        setState(() {
                                          kitchenCount++;
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          kitchenCount > 0
                                              ? kitchenCount--
                                              : null;
                                        });
                                      }),
                                  HouseProperties(
                                      title: 'Outdoor/Balcony',
                                      number: balcony,
                                      add: () {
                                        setState(() {
                                          balcony++;
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          balcony > 0 ? balcony-- : null;
                                        });
                                      }),
                                  HouseProperties(
                                      title: 'Study/Work Space/ Store',
                                      number: study,
                                      add: () {
                                        setState(() {
                                          study++;
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          study > 0 ? study-- : null;
                                        });
                                      })
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Column(
                      children: [
                        BusyButton(
                          active: active ? true : false,
                          borderColor: IklinColors.background,
                          title: 'Continue',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.cleaningInnformation);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class HouseProperties extends StatelessWidget {
  const HouseProperties(
      {super.key,
      required this.title,
      required this.number,
      required this.add,
      required this.remove});
  final String title;
  final int number;
  final VoidCallback add;
  final VoidCallback remove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextBody(
            title,
            fontSize: 16,
            color: IklinColors.grey.withOpacity(0.6),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: remove,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: IklinColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8.9,
                            color: IklinColors.black.withOpacity(0.08))
                      ]),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                ),
              ),
              const Gap(14),
              TextBody(
                '$number',
                fontSize: 15,
              ),
              const Gap(14),
              GestureDetector(
                onTap: add,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: IklinColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8.9,
                            color: IklinColors.black.withOpacity(0.08))
                      ]),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
