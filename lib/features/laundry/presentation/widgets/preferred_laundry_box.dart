// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class PreferredLaundryBox extends StatelessWidget {
  const PreferredLaundryBox(
      {
      required this.vendorName,
      required this.address,
      required this.minOrder,
      required this.image,
      required this.delivery,
      required this.status});
  final String vendorName;
  final String address;
  final String minOrder;
  final String image;
  final String delivery;
  final String status;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteName.selectedLaundryPage);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: IklinColors.grey,
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: Offset(0.0, 0.14),
                  blurStyle: BlurStyle.outer)
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 121,
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                        height: 121,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 15),
                        child: Container(
                          height: 23,
                          width: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: IklinColors.white,
                          ),
                          child: Center(
                            child: TextBold(
                              status,
                              color: status == 'Open'
                                  ? IklinColors.primaryColor
                                  : IklinColors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(8.3),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppAssets.basketEmoji,
                          height: 30,
                          width: 30,
                        ),
                        TextBold(
                          vendorName,
                          color: IklinColors.grey1.withOpacity(0.8),
                          fontSize: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.starIcon,
                              color: IklinColors.yellow,
                            ),
                            TextBody(
                              '4.5',
                              fontSize: 14,
                              color: IklinColors.grey.withOpacity(0.8),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.locationIcon,
                          height: 16,
                          width: 12,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                        const Gap(17),
                        TextBody(
                          address,
                          fontSize: 14,
                          color: IklinColors.grey.withOpacity(0.8),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.listIcon,
                        ),
                        const Gap(17),
                        TextBody(
                          '$minOrder min.order',
                          fontSize: 14,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.deliveryBus,
                          height: 18,
                          width: 24,
                        ),
                        const Gap(17),
                        TextSemiBold(
                          delivery,
                          fontSize: 12,
                          color: IklinColors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
