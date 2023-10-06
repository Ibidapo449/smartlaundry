// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/home/presentation/widgets/receipt_item.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen();

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                TextSemiBold(
                  'Orders',
                  fontSize: 24,
                ),
                const Gap(8),
                TextSemiBold(
                  'ORDER ID: XJ833843',
                  color: IklinColors.black,
                  fontSize: 18,
                ),
                const Gap(36),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.basket2,
                        height: 24,
                        width: 24,
                      ),
                      const Gap(8),
                      TextBold(
                        'Laundry',
                        color: IklinColors.grey.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
                const ReceiptItems(
                  title: 'Dry Cleaner',
                  description: 'Cranfield Drycleaning',
                ),
                const ReceiptItems(
                  title: 'Laundry Type',
                  description: 'Wash and Iron',
                ),
                const ReceiptItems(
                  title: 'Items',
                  description: '8',
                ),
                const ReceiptItems(
                  title: 'Pick up date',
                  description: 'Sun 15, 2022',
                ),
                const ReceiptItems(
                  title: 'Delivery date',
                  description: 'Wed 18, 2022',
                ),
                const ReceiptItems(
                  title: 'Delivery ',
                  description: 'NGN1,000',
                ),
                const Gap(16),
                Column(
                  children: [
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextBody(
                              'Pick up and delivery Address',
                              color: IklinColors.grey.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                          const Gap(29),
                          Expanded(
                            child: TextBody(
                              '14, Adeniji Adele Road, Lagos Island',
                              color: IklinColors.grey.withOpacity(0.8),
                              fontSize: 15,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      height: 1,
                      color: IklinColors.grey.withOpacity(
                        0.3,
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBold(
                        'Total',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(
                          0.8,
                        ),
                      ),
                      TextBold(
                        '14,500',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(
                          0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  onTap: () => print('download'),
                  leading: Container(
                    height: 36,
                    width: 39,
                    decoration: BoxDecoration(
                      color: IklinColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.downloadIcon,
                      ),
                    ),
                  ),
                  title: TextBody(
                    'Download Receipt',
                    color: IklinColors.primaryColor,
                    fontSize: 15,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
