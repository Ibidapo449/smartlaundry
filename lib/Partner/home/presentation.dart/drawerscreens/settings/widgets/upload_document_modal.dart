import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';

class UploadDocumentModal extends StatelessWidget {
  const UploadDocumentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 424,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: IklinColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Row(
                children: [
                  TextSemiSemiBold(
                    "Document",
                    fontSize: 23,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.cancel_outlined))
                ],
              ),
              const Gap(15),
              TextBody(
                "Upload your document",
                color: Colors.black54,
                fontSize: 20,
              ),
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DottedBorder(
                    dashPattern: const [10, 5],
                    color: IklinColors.primaryColor,
                    borderType: BorderType.RRect,
                    strokeWidth: 1,
                    radius: const Radius.circular(8),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const Gap(15),
                          TextSemiSemiBold(
                            "Upload File",
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                           const Gap(30),
                          SizedBox(
                            height: 95,
                            width: 95,
                            child: Image.asset(
                              AppAssets.bankIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                           const Gap(25),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 35),
                             child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.green
                              ),
                              child: Center(child: TextBody("Choose a file",
                              fontSize: 15,
                              color: Colors.white,
                              )),
                             ),
                           )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
