import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_laundry_order.dart';

class ReviewCleaningOrder extends StatefulWidget {
  const ReviewCleaningOrder({super.key});

  @override
  State<ReviewCleaningOrder> createState() => _ReviewCleaningOrderState();
}

class _ReviewCleaningOrderState extends State<ReviewCleaningOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: IklinColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              TextSemiBold(
                'Review your Cleaning Order',
                fontSize: 24,
              ),
              const Gap(8),
              TextBody(
                'Here’s a summary of your\nCleaning order',
                color: IklinColors.grey.withOpacity(0.8),
                fontSize: 18,
              ),
              const Gap(23),
              Row(
                children: [
                  Image.asset(
                    AppAssets.housIcon,
                    height: 24,
                    width: 24,
                  ),
                  const Gap(8),
                  TextBold(
                    'Cleaning',
                    fontSize: 15,
                    color: IklinColors.grey.withOpacity(0.8),
                  ),
                ],
              ),
              const Gap(17),
              const ReviewItems(
                type: 'Cleaner Name',
                title: 'So-Kleen Limited',
              ),
              const ReviewItems(type: 'Cleaning  Type', title: 'Deep Cleaning'),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextBody(
                        'House Information',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                      const Gap(61),
                      Expanded(
                          child: TextBody(
                        'Flat (3 Bedroom, 1 Living Rooms/Dining,1Kitech1 Balcony1 Workspace-)',
                        fontSize: 15,
                        maxLines: 5,
                        textAlign: TextAlign.end,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: IklinColors.grey.withOpacity(0.3),
                  )
                ],
              ),
              const Gap(16),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextBody(
                        'Cleaning Days',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                      const Gap(61),
                      Expanded(
                          child: TextBody(
                        'Wednesdays-Saturdays',
                        fontSize: 15,
                        maxLines: 5,
                        textAlign: TextAlign.end,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: IklinColors.grey.withOpacity(0.3),
                  )
                ],
              ),
              const Gap(16),
              const ReviewItems(
                type: 'Start Date',
                title: '29 May,2022',
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextBody(
                        'Cleaning Address',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                      const Gap(61),
                      Expanded(
                          child: TextBody(
                        '14, Adeniji Adele Road, Lagos Island',
                        fontSize: 15,
                        maxLines: 5,
                        textAlign: TextAlign.end,
                        color: IklinColors.grey.withOpacity(0.8),
                      )),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: IklinColors.grey.withOpacity(0.3),
                  )
                ],
              ),
              const Gap(16),
              const ReviewItems(
                type: 'Discount code',
                title: 'Add',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBold(
                    'Total',
                    fontSize: 15,
                    color: IklinColors.grey.withOpacity(0.8),
                  ),
                  TextBold(
                    '80,000.00',
                    color: IklinColors.grey.withOpacity(0.8),
                    fontSize: 15,
                  )
                ],
              ),
              const Gap(17),
              BusyButton(
                title: 'Proceed to pay',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RouteName.cleaningPayment);
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
