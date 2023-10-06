import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/cleaning/presentation/widgets/cleaner_card.dart';
import 'package:iklin/features/laundry/presentation/widgets/filter_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CleanerPage extends StatefulWidget {
  const CleanerPage({super.key});

  @override
  State<CleanerPage> createState() => _CleanerPageState();
}

class _CleanerPageState extends State<CleanerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IklinBackButton(),
                    TextSemiBold(
                      'Cleaner',
                      fontSize: 18,
                      color: IklinColors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                            fieldColor: IklinColors.grey.withOpacity(0.1),
                            prefix: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: SvgPicture.asset(AppAssets.searchIcon),
                            ),
                            controller: TextEditingController(),
                            placeholder: 'Search cleaner')),
                    const Gap(13),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            builder: (context) {
                              return const FilterModal();
                            });
                      },
                      child: SvgPicture.asset(AppAssets.filterIcon),
                    ),
                  ],
                ),
                const Gap(21),
                TextBody(
                  'Select your preferred\nCleaner',
                  fontSize: 24,
                ),
                const Gap(38),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        CleanersCard(
                            cleanerImg: AppAssets.cleaner1,
                            cleanerName: 'So-kleen Limited',
                            address: '190 Bamgbose Street, Lagos Island',
                            rating: '4.5',
                            available: true),
                        CleanersCard(
                            cleanerImg: AppAssets.cleaner2,
                            cleanerName: 'So-kleen Limited',
                            address: '190 Bamgbose Street, Lagos Island',
                            rating: '4.5',
                            available: false),
                        CleanersCard(
                            cleanerImg: AppAssets.cleaner1,
                            cleanerName: 'So-kleen Limited',
                            address: '190 Bamgbose Street, Lagos Island',
                            rating: '4.5',
                            available: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
