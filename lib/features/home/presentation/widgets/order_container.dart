// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
 
    required this.orderType,
    required this.typeImage,
    required this.todo,
    required this.img,
    required this.vendorName,
    required this.dateTime,
    required this.mode,
    required this.onTap,
  });
  final String orderType;
  final String typeImage;
  final String todo;
  final String img;
  final String vendorName;
  final String dateTime;
  final String mode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSemiBold(
                  orderType,
                  color: IklinColors.grey.withOpacity(0.9),
                ),
                const Gap(10),
                Row(
                  children: [
                    Image.asset(
                      typeImage,
                      height: 18,
                      width: 18,
                    ),
                    const Gap(6),
                    TextBody(
                      todo,
                      fontSize: 15,
                      color: IklinColors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.vendorImg,
                              height: 32,
                              width: 32,
                            ),
                            const Gap(6),
                            TextBold(
                              vendorName,
                              color: const Color(0xff555555).withOpacity(0.8),
                              fontSize: 15,
                            )
                          ],
                        ),
                        TextBody(
                          dateTime,
                          color: IklinColors.grey.withOpacity(0.8),
                          fontSize: 10,
                        )
                      ],
                    ),
                    TextSemiBold(
                      mode,
                      color: IklinColors.primaryColor,
                      fontSize: 12,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
