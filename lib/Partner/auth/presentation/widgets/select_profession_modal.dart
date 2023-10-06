import 'package:flutter/material.dart';
import 'package:iklin/core/constant/app_colors.dart';

class SelectProfessionModal extends StatelessWidget {
  const SelectProfessionModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      
      // child: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       TextBody(
      //         'Select your profession',
      //         style: const TextStyle(
      //           color: Colors.black54,
      //           fontSize: 20,
      //           fontWeight: FontWeight.w400,
      //         ),
      //         color: IklinColors.grey.withOpacity(0.3),
      //       ),
      //       Container(
      //         height: 60,
      //         width: double.infinity,
      //         child: OutlinedButton(
      //           onPressed: (){}, 
      //           child:  Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               TextBody(
      //         'Dry Cleaning',
      //         style: const TextStyle(
      //               color: Colors.black54,
      //               fontSize: 17,
      //               fontWeight: FontWeight.w400,
      //         ),
      //         color: IklinColors.grey.withOpacity(0.3),
      //       ),
      //             ],
      //           ),
      //           ),
      //       ),
      //       Container(
      //         height: 60,
      //         width: double.infinity,
      //         child: OutlinedButton(
      //           onPressed: (){}, 
      //           child:  Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               TextBody(
      //         'House Cleaning',
      //         style: const TextStyle(
      //               color: Colors.black54,
      //               fontSize: 17,
      //               fontWeight: FontWeight.w400,
      //         ),
      //         color: IklinColors.grey.withOpacity(0.3),
      //       ),
      //             ],
      //           ),
      //           ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
