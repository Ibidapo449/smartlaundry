// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CreateBasket extends StatefulWidget {
  const CreateBasket({super.key});

  @override
  State<CreateBasket> createState() => _CreateBasketState();
}

class _CreateBasketState extends State<CreateBasket> {
  @override
  Widget build(BuildContext context) {
    bool busyButton = false;

    return Scaffold(
      backgroundColor: IklinColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IklinBackButton(),
                  TextSemiBold(
                    'Create basket',
                    fontSize: 18,
                    color: IklinColors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(44),
                        TextSemiBold(
                          'Create your laundry Basket',
                          fontSize: 24,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                        const Gap(15),
                        TextBody(
                          'Creating a basket will help you compare\nprices across different laundries',
                        ),
                        const Gap(43),
                        InputField(
                          controller: TextEditingController(),
                          placeholder: 'Input your cloth type',
                        ),
                        const Gap(24),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 46,
                            width: 116,
                            decoration: BoxDecoration(
                                color: IklinColors.primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: TextBold(
                                'Add items',
                                color: IklinColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Gap(28),
                        Column(
                          children: List.generate(5, (index) {
                            return const AddedItem();
                          }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: busyButton
                                ? null
                                : () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.basketScreen,
                                    );
                                  },
                            child: Container(
                              height: 56,
                              width: 152,
                              decoration: BoxDecoration(
                                color: busyButton
                                    ? IklinColors.primaryColor.withOpacity(0.4)
                                    : IklinColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextBold(
                                    'Go to basket',
                                    fontSize: 16,
                                    color: IklinColors.white,
                                  ),
                                  Image.asset(AppAssets.notoBasket),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddedItem extends StatefulWidget {
  const AddedItem({super.key});

  @override
  State<AddedItem> createState() => _AddedItemState();
}

class _AddedItemState extends State<AddedItem> {
  var currentInndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextBody(
            'Abaya',
            color: IklinColors.grey.withOpacity(0.6),
            fontSize: 16,
          ),
          Row(
            children: [
              InkWell(
                onTap: currentInndex == 0
                    ? null
                    : () {
                        setState(() {
                          currentInndex--;
                        });
                      },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: IklinColors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.9,
                          color: IklinColors.black.withOpacity(0.08),
                        )
                      ]),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                ),
              ),
              const Gap(14),
              TextBody(
                currentInndex.toString(),
                fontSize: 15,
                color: IklinColors.black,
              ),
              const Gap(14),
              InkWell(
                onTap: () {
                  setState(() {
                    currentInndex++;
                  });
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: IklinColors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.9,
                          color: IklinColors.black.withOpacity(0.08),
                        )
                      ]),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
