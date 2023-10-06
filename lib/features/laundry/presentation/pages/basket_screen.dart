import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/laundry/presentation/pages/create_basket.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IklinBackButton(),
                  TextSemiBold(
                    'Basket',
                    fontSize: 18,
                    color: IklinColors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const Gap(51),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: List.generate(
                            5,
                            (index) => const AddedItem(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                  'Total',
                                  fontSize: 15,
                                  color: IklinColors.grey.withOpacity(0.8),
                                ),
                                TextBold(
                                  '13,500',
                                  color: IklinColors.grey.withOpacity(0.8),
                                  fontSize: 15,
                                )
                              ],
                            ),
                            const Gap(36),
                            BusyButton(
                              title: 'Select date & time',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.selectPickupDate,
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
