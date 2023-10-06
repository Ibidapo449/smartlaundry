import 'package:flutter/material.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/route_name.dart';

class SplashhScreen extends StatefulWidget {
  const SplashhScreen({Key? key}) : super(key: key);

  @override
  State<SplashhScreen> createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, RouteName.onboardingScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: IklinColors.primaryColor,
      child: Center(
        child: Image.asset(
          AppAssets.splashLogo,
          width: 200,
          height: 63,
        ),
      ),
    );
  }
}
