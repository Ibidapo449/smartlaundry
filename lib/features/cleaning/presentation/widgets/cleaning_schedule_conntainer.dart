import 'package:flutter/widgets.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class CleaningScheduleConntainer extends StatefulWidget {
  const CleaningScheduleConntainer(
      {super.key,
      required this.title,
      required this.onTap,
      required this.active});
  final String title;
  final VoidCallback onTap;
  final bool active;
  @override
  State<CleaningScheduleConntainer> createState() =>
      _CleaningScheduleConntainerState();
}

class _CleaningScheduleConntainerState
    extends State<CleaningScheduleConntainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 41,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.active
                ? IklinColors.primaryColor
                : IklinColors.grey.withOpacity(0.5),
          ),
        ),
        child: Center(
          child: TextBody(
            widget.title,
            fontSize: 18,
            color: widget.active
                ? IklinColors.primaryColor
                : IklinColors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
