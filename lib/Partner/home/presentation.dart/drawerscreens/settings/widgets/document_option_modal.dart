import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/upload_document_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';

class DocumentOptionModal extends StatelessWidget {
  const DocumentOptionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
       decoration: const BoxDecoration(
        color: IklinColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Gap(30),
            myRow(text: "CAC", context: context),
            const Gap(20),
             myRow(text: "NIN", context: context),
          ],
        ),
      ),
    );
  }

  InkWell myRow({text, required BuildContext context}) {
    return InkWell(
      onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const UploadDocumentModal();
                        });
                  },
      child: Row(
              children: [
                TextSemiSemiBold(text,
                fontSize: 18,
                color: Colors.black54,
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                size: 14,)
              ],
            ),
    );
  }
}