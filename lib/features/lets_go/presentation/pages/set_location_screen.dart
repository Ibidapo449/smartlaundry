import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/lets_go/presentation/widgets/set_location_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              AppAssets.mapImage,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SetLocationContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gap(50),
                  IklinBackButton(),
                  Gap(25),
                  MyLocationContainer(
                    locationName: 'Bamgbose Street, Lagos Island',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyLocationContainer extends StatelessWidget {
  const MyLocationContainer({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  final String locationName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteName.addressPage,
      ),
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          color: IklinColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.myLocation,
              ),
              const Gap(17),
              Flexible(
                child: TextBody(
                  locationName,
                  fontSize: 16,
                  color: IklinColors.primaryColor,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
