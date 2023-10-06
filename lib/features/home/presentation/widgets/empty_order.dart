import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.emptyList,
            height: 77,
            width: 77,
          ),
          const Gap(8),
          TextBody(
            'Your orders shows here',
            color: IklinColors.grey.withOpacity(0.7),
            fontSize: 13,
          )
        ],
      ),
    );
  }
}
