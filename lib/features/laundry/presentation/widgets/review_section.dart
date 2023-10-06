import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection(
      {super.key,
      required this.title,
      required this.image,
      required this.name});
  final String title;
  final String image;
  final String name;
  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  @override
  Widget build(BuildContext context) {
    double ratingUpdate = 0;
    return Container(
      height: 229,
      width: double.infinity,
      decoration: BoxDecoration(
          color: IklinColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: TextBody(
              widget.title,
              fontSize: 18,
            ),
          ),
          const Gap(11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
                const Gap(9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSemiBold(
                        'Balogun Hammed',
                        fontSize: 15,
                        color: IklinColors.grey.withOpacity(0.7),
                      ),
                      const Gap(8),
                      TextBody(
                        'Help us to improve the way we serve you and we promise to do better',
                        fontSize: 14,
                        color: IklinColors.grey.withOpacity(0.5),
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Gap(23),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            // ignore: prefer_const_constructors
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              ratingUpdate = rating;
              // ignore: avoid_print
              print(ratingUpdate);
            },
          ),
        ],
      ),
    );
  }
}
