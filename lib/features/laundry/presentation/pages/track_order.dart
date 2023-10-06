import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_section.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_share_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  bool reviewOrder = false;
  String reviewText = '';
  TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IklinBackButton(),
                  TextSemiBold(
                    'Order Tracking',
                    fontSize: 18,
                    color: IklinColors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: IklinColors.primaryColor,
                                )),
                            child: ClipRRect(
                              child: Image.asset(
                                AppAssets.reviewUser,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Gap(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBody(
                                'Your pick-up Man',
                                fontSize: 12,
                                color: IklinColors.grey.withOpacity(0.4),
                              ),
                              TextBody(
                                'Iklin',
                                fontSize: 16,
                                color: IklinColors.grey.withOpacity(0.8),
                              ),
                              TextBody(
                                'Pick up time 11:00 AM',
                                fontSize: 12,
                                color: IklinColors.grey.withOpacity(0.5),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reviewOrder
                                  ? const SizedBox()
                                  : Column(
                                      children: const [
                                        TrackingItems(
                                          title: 'Laundry confirmed',
                                          subTile:
                                              'Your order has been received',
                                          done: true,
                                        ),
                                        TrackingItems(
                                          title: 'Laundry Started',
                                          subTile: 'Your Laundry is started',
                                          done: true,
                                        ),
                                        TrackingItems(
                                            title: 'Laundry Ready for Delivery',
                                            subTile:
                                                'Oh yes! Your delivery is enroute'),
                                      ],
                                    ),
                              TrackingItems(
                                title: 'Delivered',
                                subTile: 'Please do enjoy your service',
                                done: reviewOrder ? true : false,
                              ),
                              TrackingItems(
                                title: 'Please rate us',
                                subTile:
                                    'Help us serve you better, how can we improve?',
                                done: reviewOrder ? true : false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(45),
                      reviewOrder
                          ? Column(
                              children: [
                                const ReviewSection(
                                    title:
                                        'Please drop a review about our services',
                                    image: AppAssets.userImg,
                                    name: 'Balogun Hammed'),
                                const Gap(31),
                                InputField(
                                  controller: reviewController,
                                  placeholder: 'Describe your experince',
                                  maxLines: 10,
                                  fieldHeight: 94,
                                  maxLength: 500,
                                  onChanged: (value) {
                                    setState(() {
                                      reviewText = value;
                                    });
                                  },
                                ),
                                const Gap(9),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text('${reviewText.length}/500'),
                                )
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      reviewOrder
                          ? BusyButton(
                              title: 'Submit',
                              onTap: () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return const ReviewShharingModal();
                                    });
                              },
                            )
                          : Row(
                              children: [
                                Expanded(
                                    child: BusyButton(
                                  title: 'Leave a review',
                                  onTap: () {
                                    setState(() {
                                      reviewOrder = true;
                                    });
                                  },
                                  buttonColor: IklinColors.background,
                                  titleColor: IklinColors.primaryColor,
                                )),
                                const Gap(14),
                                Expanded(
                                  child: BusyButton(
                                      title: 'Request again', onTap: () {}),
                                )
                              ],
                            ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackingItems extends StatefulWidget {
  const TrackingItems({
    super.key,
    required this.title,
    required this.subTile,
    this.done = false,
  });
  final String title;
  final String subTile;
  final bool done;
  @override
  State<TrackingItems> createState() => _TrackingItemsState();
}

class _TrackingItemsState extends State<TrackingItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            width: 2,
            height: 35,
            color: widget.done ? IklinColors.primaryColor : IklinColors.grey3,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.done
                      ? IklinColors.primaryColor
                      : IklinColors.grey3),
              child: Icon(
                Icons.done,
                size: 18,
                color: widget.done ? IklinColors.white : IklinColors.grey4,
              ),
            ),
            const Gap(26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBody(
                  widget.title,
                  fontSize: 14,
                ),
                TextBody(
                  widget.subTile,
                  color: IklinColors.grey.withOpacity(0.7),
                  fontSize: 10,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
