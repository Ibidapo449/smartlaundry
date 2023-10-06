import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/laundry/presentation/widgets/pickup_date_widget.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_laundry_order.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SelectPickupDate extends StatefulWidget {
  const SelectPickupDate({super.key});

  @override
  State<SelectPickupDate> createState() => _SelectPickupDateState();
}

class _SelectPickupDateState extends State<SelectPickupDate> {
  bool onFocus = false;

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IklinBackButton(),
                    TextSemiBold(
                      'Pick up & Delivery',
                      fontSize: 18,
                      color: IklinColors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                const Gap(48),
                Expanded(
                    child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBody(
                              'Select a pick up date',
                              color: IklinColors.darkGrey,
                              fontSize: 24,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            TextBody(
                              'Your delivery date depending on the numbers of items selected',
                              fontSize: 15,
                              color: IklinColors.grey.withOpacity(0.6),
                            ),
                            const Gap(22),
                            TextSemiBold(
                              'Pick up date',
                              fontSize: 15,
                              color: IklinColors.grey.withOpacity(0.8),
                            ),
                            const Gap(8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  onFocus = true;
                                });
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    isDismissible: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return const PickUpDateWidget();
                                    });
                              },
                              child: Container(
                                height: 52,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: IklinColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: onFocus
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
                                        'select date',
                                        color:
                                            IklinColors.grey.withOpacity(0.5),
                                        fontSize: 14,
                                      ),
                                      SvgPicture.asset(
                                        AppAssets.dateIconn,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Column(
                          children: [
                            BusyButton(
                              title: 'Continue',
                              onTap: () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return const ReviewLaundryOrder();
                                    });
                              },
                            ),
                            const Gap(30),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
