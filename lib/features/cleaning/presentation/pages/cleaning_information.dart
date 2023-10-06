import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/cleaning/presentation/widgets/choose_date_modal.dart';
import 'package:iklin/features/cleaning/presentation/widgets/cleaning_schedule_conntainer.dart';
import 'package:iklin/features/cleaning/presentation/widgets/review_cleaning_order.dart';
import 'package:iklin/features/cleaning/presentation/widgets/weekly_cleaning.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CleaningInformation extends StatefulWidget {
  const CleaningInformation({super.key});

  @override
  State<CleaningInformation> createState() => _CleaningInformationState();
}

bool once = true;
bool weekly = false;
bool monthly = false;
String date = '';

class _CleaningInformationState extends State<CleaningInformation> {
  TextEditingController weeklyController = TextEditingController(text: '1');
  TextEditingController monthlyController = TextEditingController(text: '1');
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
                    'Cleaning Information',
                    fontSize: 18,
                    color: IklinColors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const Gap(44),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSemiBold(
                        'Cleaning Information',
                        fontSize: 24,
                        color: IklinColors.grey,
                      ),
                      const Gap(19),
                      TextBody(
                        'How Often do you want your home cleaned?',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.6),
                      ),
                      const Gap(16),
                      Row(
                        children: [
                          Expanded(
                            child: CleaningScheduleConntainer(
                                title: 'Once',
                                onTap: () {
                                  setState(() {
                                    once = true;
                                    weekly = false;
                                    monthly = false;
                                  });
                                },
                                active: once),
                          ),
                          const Gap(16),
                          Expanded(
                            child: CleaningScheduleConntainer(
                                title: 'Weekly',
                                onTap: () {
                                  setState(() {
                                    weekly = true;
                                    once = false;
                                    monthly = false;
                                  });
                                },
                                active: weekly),
                          ),
                          const Gap(16),
                          Expanded(
                              child: CleaningScheduleConntainer(
                                  title: 'Monthly',
                                  onTap: () {
                                    setState(() {
                                      monthly = true;
                                      weekly = false;
                                      once = false;
                                    });
                                  },
                                  active: monthly))
                        ],
                      ),
                      weekly
                          ? WeeklyCleaning(
                              controller: weeklyController,
                              type: 'Day a week',
                            )
                          : monthly
                              ? WeeklyCleaning(
                                  controller: monthlyController,
                                  type: 'Once a month')
                              : const SizedBox(),
                      const Gap(50),
                      TextSemiBold(
                        'Select your cleaning days',
                        fontSize: 24,
                        color: IklinColors.grey,
                      ),
                      const Gap(6),
                      TextBody(
                        'Let us know when you will be availble for\nour cleaning partners',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.6),
                      ),
                      const Gap(30),
                      TextSemiBold(
                        'Select date',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const CleaningChooseDateModal();
                              }).then((value) {
                            setState(() {
                              date = value;
                            });
                          });
                        },
                        child: Container(
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: IklinColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: IklinColors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBody(
                                  date == '' ? 'Select date' : date,
                                  fontSize: 14,
                                  color: IklinColors.grey.withOpacity(0.5),
                                ),
                                SvgPicture.asset(
                                  AppAssets.dateIconn,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      date != ''
                          ? Column(
                              children: [
                                const Gap(16),
                                Container(
                                  height: 71,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: IklinColors.primaryColor)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: TextBody(
                                        'Our partner will be cleaning your on $date ',
                                        fontSize: 15,
                                        color: IklinColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      BusyButton(
                        title: 'Continue',
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const ReviewCleaningOrder();
                              });
                        },
                      ),
                      const Gap(20),
                    ],
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
