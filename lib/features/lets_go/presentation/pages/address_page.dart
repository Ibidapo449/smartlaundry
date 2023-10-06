import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const IklinBackButton(),
                const Gap(27),
                InputField(
                  controller: TextEditingController(),
                  fieldColor: IklinColors.grey.withOpacity(0.1),
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                    ),
                  ),
                  placeholder: 'Enter Address',
                  validationColor: IklinColors.background,
                ),
                const Gap(30),
                const ChooseLocation(
                    icon: AppAssets.myLocation,
                    title: 'Current Location',
                    location: 'Bamgbose Street'),
                const ChooseLocation(
                  icon: AppAssets.locationIcon,
                  title: 'Glover Street',
                  location: 'Lagos, Nigeria',
                ),
                const ChooseLocation(
                  icon: AppAssets.locationIcon,
                  title: 'Glover Street',
                  location: 'Lagos, Nigeria',
                ),
                const ChooseLocation(
                  icon: AppAssets.locationIcon,
                  title: 'Glover Street',
                  location: 'Lagos, Nigeria',
                ),
                const ChooseLocation(
                  icon: AppAssets.locationIcon,
                  title: 'Glover Street',
                  location: 'Lagos, Nigeria',
                ),
                const ChooseLocation(
                  icon: AppAssets.locationIcon,
                  title: 'Glover Street',
                  location: 'Lagos, Nigeria',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({
    Key? key,
    required this.icon,
    required this.title,
    required this.location,
  }) : super(key: key);
  final String icon;
  final String title;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
              color: IklinColors.grey.withOpacity(
                0.8,
              ),
            ),
            const Gap(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSemiBold(
                  title,
                  color: IklinColors.grey.withOpacity(0.8),
                  fontSize: 18,
                ),
                const Gap(3),
                TextBody(
                  location,
                  color: IklinColors.grey.withOpacity(0.6),
                  fontSize: 14,
                )
              ],
            ),
          ],
        ),
        const Gap(8),
        Container(
          height: 1,
          color: IklinColors.grey.withOpacity(0.3),
        ),
        const Gap(16),
      ],
    );
  }
}
