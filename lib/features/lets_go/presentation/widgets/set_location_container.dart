import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';

class SetLocationContainer extends StatelessWidget {
  const SetLocationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 414,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: IklinColors.primaryColor,
                  )),
              child: Center(
                child: SvgPicture.asset(AppAssets.locationIcon),
              ),
            ),
            const Gap(31),
            TextBold(
              'Enable your Location',
              color: IklinColors.textColor.withOpacity(0.8),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            const Gap(10),
            TextBody(
              'Set your location to enable us\npick up and deliver your items ',
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: IklinColors.grey.withOpacity(0.6),
            ),
            const Gap(51),
            BusyButton(
              title: 'Set up now',
              onTap: () {
                Navigator.pushNamed(context, RouteName.errorScreen);
              },
            ),
            const Gap(10),
            BusyButton(
              title: 'Set up later',
              onTap: () {},
              buttonColor: IklinColors.lightGrey,
              titleColor: IklinColors.grey.withOpacity(
                0.7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
