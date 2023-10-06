import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/laundry/presentation/widgets/select_laundry_type.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class LaundryScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LaundryScreen();

  @override
  State<LaundryScreen> createState() => _LaundryScreenState();
}

class _LaundryScreenState extends State<LaundryScreen> {
  bool onFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IklinBackButton(),
                  TextSemiBold(
                    'Laundry',
                    color: IklinColors.black,
                    fontSize: 18,
                  ),
                  const Gap(50),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextBody(
                'Select your\nLaundry Type',
                fontSize: 24,
              ),
              const Gap(23),
              TextBody(
                'How do you want your laundry done?',
                fontSize: 15,
              ),
              const Gap(49),
              GestureDetector(
                onTap: () {
                  setState(() {
                    onFocus = true;
                  });
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                      context: context,
                      builder: (context) {
                        return const SelectLaundryType();
                      });
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: IklinColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: onFocus
                          ? IklinColors.primaryColor
                          : IklinColors.grey.withOpacity(0.2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBody(
                          'Select your laundry type',
                          color: IklinColors.grey.withOpacity(0.5),
                          fontSize: 14,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: IklinColors.grey.withOpacity(0.5),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.selectLaundryMan);
                },
                active: onFocus,
              )
            ],
          ),
        ),
      ),
    );
  }
}
