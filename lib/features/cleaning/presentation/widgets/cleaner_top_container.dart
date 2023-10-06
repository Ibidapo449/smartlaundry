import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class CleanerTopContainer extends StatelessWidget {
  const CleanerTopContainer(
      {super.key,
      required this.cleanerName,
      required this.years,
      required this.location});
  final String cleanerName;
  final String years;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 167,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: IklinColors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 0,
                  color: IklinColors.white.withOpacity(0.15))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(53),
              TextSemiBold(
                cleanerName,
                fontSize: 18,
                color: IklinColors.black,
              ),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppAssets.boxIcon),
                      const Gap(11),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBody(
                            'years business',
                            fontSize: 12,
                            color: IklinColors.grey.withOpacity(0.8),
                          ),
                          const Gap(8),
                          TextBody(
                            years,
                            fontSize: 12,
                            color: IklinColors.grey.withOpacity(0.8),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.locationIcon,
                        height: 13,
                        width: 13,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                      const Gap(11),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBody(
                            'Location',
                            fontSize: 12,
                            color: IklinColors.grey.withOpacity(0.8),
                          ),
                          const Gap(8),
                          TextBody(
                            location,
                            fontSize: 12,
                            color: IklinColors.grey.withOpacity(0.8),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
