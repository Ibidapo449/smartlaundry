import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CleaningChooseDateModal extends StatefulWidget {
  const CleaningChooseDateModal({super.key});

  @override
  State<CleaningChooseDateModal> createState() =>
      _CleaningChooseDateModalState();
}

class _CleaningChooseDateModalState extends State<CleaningChooseDateModal> {
  List days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(31),
              TextSemiBold(
                'Select Days',
                fontSize: 24,
                color: IklinColors.grey,
              ),
              const Gap(16),
              SizedBox(
                height: 200,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                            crossAxisCount: 3,
                            childAspectRatio: 2),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      return PicKDaysWidget(day: days[index]);
                    }),
              ),
              TextSemiBold(
                'Pick a Date',
                fontSize: 24,
              ),
              const Gap(11),
              TextBody(
                'Pick a date to receive your first order ',
                fontSize: 18,
                color: IklinColors.grey.withOpacity(0.8),
              ),
              const Gap(16),
              Container(
                height: 303,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: IklinColors.primaryColor)),
                child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.single,
                  showNavigationArrow: true,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  selectionColor: IklinColors.primaryColor,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    setState(() {
                      date = args.value;
                    });
                  },
                ),
              ),
              date == null
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 21,
                          ),
                          TextSemiBold(
                            'Selected Date',
                            fontSize: 15,
                            color: IklinColors.grey.withOpacity(0.8),
                          ),
                          const Gap(8),
                          TextSemiBold(
                            (DateFormat.yMMMMd().format(date!)),
                            color: const Color(0xff333333),
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
              const Gap(30),
              BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pop(context, (DateFormat.yMMMMd().format(date!)));
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

class PicKDaysWidget extends StatelessWidget {
  const PicKDaysWidget({super.key, required this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 107,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: IklinColors.grey.withOpacity(0.5),
        ),
      ),
      child: Center(
        child: TextBody(
          day,
          fontSize: 18,
          color: IklinColors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
