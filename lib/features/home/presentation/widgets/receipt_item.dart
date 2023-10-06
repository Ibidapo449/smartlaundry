// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class ReceiptItems extends StatelessWidget {
  const ReceiptItems({

    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(
                title,
                color: IklinColors.grey.withOpacity(0.8),
                fontSize: 15,
              ),
              TextBody(
                description,
                color: IklinColors.grey.withOpacity(0.8),
                fontSize: 15,
              ),
            ],
          ),
        ),
        const Gap(10),
        Container(
          height: 1,
          color: IklinColors.grey.withOpacity(
            0.3,
          ),
        )
      ],
    );
  }
}
