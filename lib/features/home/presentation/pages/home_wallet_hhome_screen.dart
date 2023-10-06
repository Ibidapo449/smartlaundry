import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class HomeWalletHhomeScreen extends StatelessWidget {
  const HomeWalletHhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const Gap(20),
            Row(
              children: [
                const IklinBackButton(),
                const Gap(115),
                TextBody(
                  "Wallets",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            const Gap(30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 162,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextBody(
                      "Wallet Balance",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    TextBody(
                      "NGN 0.00",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 42,
                      width: 149,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: TextBody(
                          "FUND WALLET",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiSemiBold(
                  "Recents Transaction",
                  fontSize: 18,
                  color:  Colors.grey, 
                ),
                Row(
                  children: [
                    TextSemiSemiBold(
                      "Veiw",
                      fontSize: 15,
                      color:  Colors.grey, 
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.arrow_forward_ios,
                    size: 13,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(50),
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                AppAssets.transaction
              ),
            ),
            const Gap(10),
            TextSemiSemiBold(
                  "Your Transaction shows here",
                  fontSize: 15,
                  color:  Colors.grey, 
                ),
          ],
        ),
      )),
    );
  }
}
