// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/laundry/presentation/widgets/filter_modal.dart';
import 'package:iklin/features/laundry/presentation/widgets/preferred_laundry_box.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class SelectLaundryMan extends StatefulWidget {
  const SelectLaundryMan();

  @override
  State<SelectLaundryMan> createState() => _SelectLaundryManState();
}

class _SelectLaundryManState extends State<SelectLaundryMan> {
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
          child: SingleChildScrollView(
            child: Column(
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
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        controller: TextEditingController(),
                        placeholder: 'Search Drycleaner',
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            AppAssets.searchIcon,
                          ),
                        ),
                        validationColor: IklinColors.background,
                        fieldColor: IklinColors.grey.withOpacity(0.1),
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const FilterModal();
                            });
                      },
                      child: SvgPicture.asset(
                        AppAssets.filterIcon,
                      ),
                    )
                  ],
                ),
                const Gap(21),
                TextBody(
                  'Select your preferred Laundry ',
                  fontSize: 24,
                ),
                const Gap(38),
                const PreferredLaundryBox(
                  vendorName: 'Cranfield Drycleaning',
                  address: '190 Bamgbose Street, Lagos Island',
                  minOrder: '2,000',
                  image: AppAssets.vendorLaundry,
                  delivery: 'Free delivry',
                  status: 'Open',
                ),
                const PreferredLaundryBox(
                  vendorName: 'Cranfield Drycleaning',
                  address: '190 Bamgbose Street, Lagos Island',
                  minOrder: '2,000',
                  image: AppAssets.vendorLaundry,
                  delivery: 'Free delivry',
                  status: 'Close',
                ),
                const PreferredLaundryBox(
                  vendorName: 'Cranfield Drycleaning',
                  address: '190 Bamgbose Street, Lagos Island',
                  minOrder: '2,000',
                  image: AppAssets.vendorLaundry,
                  delivery: 'Free delivry',
                  status: 'Open',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
