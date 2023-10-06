import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class CleanersCard extends StatefulWidget {
  const CleanersCard(
      {super.key,
      required this.cleanerImg,
      required this.cleanerName,
      required this.address,
      required this.rating,
      required this.available});
  final String cleanerImg;
  final String cleanerName;
  final String address;
  final String rating;
  final bool available;
  @override
  State<CleanersCard> createState() => _CleanersCardState();
}

class _CleanersCardState extends State<CleanersCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.cleanerPersonalPage,
          );
        },
        child: Container(
          height: 219,
          width: double.infinity,
          decoration: BoxDecoration(
              color: IklinColors.background,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    blurRadius: 14,
                    spreadRadius: 0,
                    color: IklinColors.black.withOpacity(0.08))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 101,
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        widget.cleanerImg,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 34,
                          right: 22,
                        ),
                        child: Container(
                          height: 23,
                          width: 100,
                          decoration: BoxDecoration(
                            color: IklinColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: TextBold(
                              widget.available ? 'Available' : 'Not Available',
                              fontSize: 14,
                              color: widget.available
                                  ? IklinColors.primaryColor
                                  : IklinColors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.housIcon,
                          height: 30,
                          width: 30,
                        ),
                        const Gap(13),
                        TextBold(
                          widget.cleanerName,
                          fontSize: 16,
                          color: IklinColors.grey1.withOpacity(0.8),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.locationIcon,
                          width: 13,
                          height: 16,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                        const Gap(17),
                        TextBody(
                          widget.address,
                          fontSize: 14,
                          color: IklinColors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    const Gap(11),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.starIcon,
                          color: IklinColors.yellow,
                          height: 18,
                          width: 18,
                        ),
                        TextBody(
                          widget.rating,
                          fontSize: 14,
                          color: IklinColors.grey.withOpacity(0.8),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
