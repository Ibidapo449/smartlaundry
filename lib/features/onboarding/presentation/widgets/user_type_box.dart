import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserTypeBox extends StatefulWidget {
  const UserTypeBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  State<UserTypeBox> createState() => _UserTypeBoxState();
}

class _UserTypeBoxState extends State<UserTypeBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 159,
        width: double.infinity,
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isSelected
                  ? IklinColors.primaryColor
                  : IklinColors.grey.withOpacity(0.4),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.icon,
                color: widget.isSelected
                    ? IklinColors.primaryColor
                    : IklinColors.grey.withOpacity(0.4),
              ),
              const Gap(19),
              TextBody(
                widget.title,
                fontSize: 18,
                color: widget.isSelected
                    ? IklinColors.primaryColor
                    : IklinColors.grey.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
