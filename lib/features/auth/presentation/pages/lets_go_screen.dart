import 'package:flutter/material.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';

class LetsGoScreen extends StatefulWidget {
  const LetsGoScreen({Key? key}) : super(key: key);

  @override
  State<LetsGoScreen> createState() => _LetsGoScreenState();
}

class _LetsGoScreenState extends State<LetsGoScreen> {
  goToSetLocation() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, RouteName.setLocationScreen),
    );
  }

  @override
  void initState() {
    goToSetLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: Stack(alignment: Alignment.bottomLeft, children: [
        Image.asset(
          AppAssets.letsGoImage,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextSemiBold(
                'Let go your\naccount is set',
                color: IklinColors.black,
                fontSize: 32,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
/**/