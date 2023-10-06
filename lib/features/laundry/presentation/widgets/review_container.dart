// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            color: IklinColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: IklinColors.black.withOpacity(0.05),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    AppAssets.reviewUser,
                    fit: BoxFit.fill,
                  ),
                ),
                title: TextSemiBold(
                  'Bello Aisha',
                  fontSize: 15,
                  color: IklinColors.grey.withOpacity(0.8),
                ),
                subtitle: TextBody(
                  '23 May 2022',
                  color: IklinColors.grey.withOpacity(0.4),
                  fontSize: 12,
                ),
              ),
              TextBody(
                'This is my first time using Ola’s Ventures and i am beyond wowed by their service. I will surely recommend',
                maxLines: 6,
                fontSize: 14,
                color: IklinColors.grey.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
