import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';

class WeeklyCleaning extends StatefulWidget {
  const WeeklyCleaning(
      {super.key, required this.controller, required this.type});
  final TextEditingController controller;
  final String type;
  @override
  State<WeeklyCleaning> createState() => _WeeklyCleaningState();
}

class _WeeklyCleaningState extends State<WeeklyCleaning> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(25),
        TextBody(
          'How many days in a week?',
          fontSize: 15,
          color: IklinColors.grey,
        ),
        const Gap(30),
        Row(
          children: [
            Container(
              height: 40,
              width: 87,
              decoration: BoxDecoration(
                  color: IklinColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2.28),
                      blurRadius: 14.28,
                      color: IklinColors.black.withOpacity(0.08),
                    ),
                  ]),
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: IklinFont.euclid,
                  fontWeight: FontWeight.w500,
                  color: IklinColors.grey,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '1',
                ),
              ),
            ),
            const Gap(38),
            Expanded(
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: IklinColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextSemiBold(
                    widget.type,
                    fontSize: 18,
                    color: IklinColors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
