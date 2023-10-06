import 'package:flutter/material.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class BusyButton extends StatefulWidget {
  const BusyButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.active = true,
    this.titleColor = IklinColors.white,
    this.buttonColor = IklinColors.primaryColor,
    this.borderColor = IklinColors.primaryColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool active;
  final Color buttonColor;
  final Color titleColor;
  final Color borderColor;
  @override
  State<BusyButton> createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.active ? widget.onTap : null,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.borderColor),
          color: widget.active
              ? widget.buttonColor
              : widget.buttonColor.withOpacity(0.4),
        ),
        child: Center(
          child: TextBold(
            widget.title,
            color: widget.titleColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
