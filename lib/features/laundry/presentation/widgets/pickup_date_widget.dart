import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class PickUpDateWidget extends StatefulWidget {
  const PickUpDateWidget({super.key});

  @override
  State<PickUpDateWidget> createState() => _PickUpDateWidgetState();
}

DateTime? date;

class _PickUpDateWidgetState extends State<PickUpDateWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: IklinColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            color: const Color(0xff06366A).withOpacity(0.05),
                          )
                        ]),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSemiBold(
                    'Pick a Date',
                    color: IklinColors.darkGrey,
                    fontSize: 24,
                  ),
                  const Gap(11),
                  TextBody(
                    'Pick a date to receive your first order ',
                    fontSize: 18,
                    color: IklinColors.grey.withOpacity(0.8),
                  ),
                  const Gap(21),
                  Container(
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
                  const Gap(21),
                  date == null
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  BusyButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.pop(
                          context, (DateFormat.yMMMMd().format(date!)));
                    },
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
