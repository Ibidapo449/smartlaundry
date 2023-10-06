import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class ReviewLaundryOrder extends StatelessWidget {
  const ReviewLaundryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 719,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(11),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: IklinColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            color: const Color(0xff06366A).withOpacity(0.05),
                          )
                        ]),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    'Review your Laundry Order',
                    color: IklinColors.darkGrey,
                    fontSize: 24,
                  ),
                  const Gap(8),
                  TextBody(
                    'Here’s a summary of your\nlaundry order',
                    fontSize: 18,
                    color: IklinColors.grey,
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.basket2,
                        height: 24,
                        width: 24,
                      ),
                      const Gap(8),
                      TextBold(
                        'Laundry',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      )
                    ],
                  ),
                  const Gap(17),
                  const ReviewItems(
                    type: 'Dry Cleaner',
                    title: 'Cranfield Drycleaning',
                  ),
                  const ReviewItems(
                    type: 'Laundry Type',
                    title: 'Wash and Iron',
                  ),
                  const ReviewItems(type: 'Items', title: '8'),
                  const ReviewItems(
                    type: 'Pick up date',
                    title: 'Sun 15, 2022',
                  ),
                  const ReviewItems(
                    type: 'Delivery ',
                    title: 'Free',
                  ),
                  const ReviewItems(
                      type: 'Pick up and\ndelivery Address',
                      title: '14, Adeniji Adele Road,\nLagos Island'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        'Discount code',
                        color: IklinColors.grey.withOpacity(0.8),
                        fontSize: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: TextBold(
                          'Add',
                          fontSize: 15,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const Gap(26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBold(
                        'Total',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                      TextBold(
                        '13,500',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                    ],
                  ),
                  const Gap(18),
                  BusyButton(
                    title: 'Proceed to pay',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        RouteName.paymentMethod,
                      );
                    },
                  ),
                  const Gap(30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewItems extends StatelessWidget {
  const ReviewItems({
    super.key,
    required this.type,
    required this.title,
  });
  final String type;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBody(
              type,
              color: IklinColors.grey.withOpacity(0.8),
              fontSize: 15,
            ),
            TextBody(
              title,
              color: IklinColors.grey.withOpacity(0.8),
              fontSize: 15,
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const Gap(10),
        Container(
          height: 1,
          color: IklinColors.grey.withOpacity(0.3),
        ),
        const Gap(16),
      ],
    );
  }
}
