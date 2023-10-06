import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/cleaning/presentation/widgets/select_clean_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SelectCleanningType extends StatefulWidget {
  const SelectCleanningType({super.key});

  @override
  State<SelectCleanningType> createState() => _SelectCleanningTypeState();
}

class _SelectCleanningTypeState extends State<SelectCleanningType> {
  String cleaningType = '';
  bool onSelecType = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const IklinBackButton(),
                        TextSemiBold(
                          'Cleaner',
                          fontSize: 18,
                          color: IklinColors.black,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    TextBody(
                      'Select your Cleaning\nType',
                      fontSize: 24,
                    ),
                    const Gap(24),
                    TextBody(
                      'How do you want your cleaning done?',
                      fontSize: 15,
                      color: IklinColors.black,
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (
                              context,
                            ) {
                              return const SelectCleanModal();
                            }).then((cleaningValue) {
                          setState(() {
                            cleaningType = cleaningValue;
                            onSelecType = true;
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: onSelecType
                                  ? IklinColors.primaryColor
                                  : IklinColors.grey.withOpacity(0.3),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBody(
                                cleaningType == ''
                                    ? 'Select your cleaning type'
                                    : cleaningType,
                                fontSize: 14,
                                color: IklinColors.grey.withOpacity(0.5),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: IklinColors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BusyButton(
                      borderColor: IklinColors.background,
                      active: onSelecType,
                      title: 'Continue',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.cleanersScreen,
                        );
                      },
                    ),
                    const Gap(30),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
