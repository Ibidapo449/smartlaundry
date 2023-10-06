import 'package:flutter/material.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/home/presentation/widgets/order_container.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
           OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
                     OrderContainer(
                      orderType: 'Laundry',
                      typeImage: AppAssets.washImg,
                      todo: 'Wash, Fold and Iron',
                      img: AppAssets.vendorImg,
                      vendorName: 'Cranfield Drycleaning',
                      dateTime: 'Thur 14 may. 2022 -01:02PM',
                      mode: 'Complete',
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.receiptScreen,
                        // );
                      },
                    ),
        ],
      ),
    ),
   );
  }
}