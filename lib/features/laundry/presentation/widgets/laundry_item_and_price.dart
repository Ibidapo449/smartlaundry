import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class LaundryItemAndPrice extends StatelessWidget {
  const LaundryItemAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 42,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSemiBold(
                      'Laundry Items and price',
                      color: IklinColors.darkGrey,
                      fontSize: 24,
                    ),
                    InkWell(
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
                                  color:
                                      const Color(0xff06366A).withOpacity(0.05))
                            ]),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            size: 15,
                            color: IklinColors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(13),
                TextBody(
                  'Price list of how is Laundry is been\ncounted and calculated',
                  color: IklinColors.grey.withOpacity(0.8),
                ),
                const Gap(17),
                Expanded(
                    child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        20,
                        (index) => const LaundryItem(
                          item: 'Abaya',
                          price: '800',
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}

class LaundryItem extends StatelessWidget {
  const LaundryItem({super.key, required this.item, required this.price});
  final String item;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextBody(
            item,
            fontSize: 15,
            color: IklinColors.grey.withOpacity(0.9),
          ),
          TextBold(
            'NGN$price',
            fontSize: 15,
            color: IklinColors.grey.withOpacity(0.95),
          ),
        ],
      ),
    );
  }
}
