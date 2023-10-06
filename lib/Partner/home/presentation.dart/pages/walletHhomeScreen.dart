import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/widgets/partner_withdrawal_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class WalletHhomeScreen extends StatefulWidget {
  const WalletHhomeScreen({super.key});

  @override
  State<WalletHhomeScreen> createState() => _WalletHhomeScreenState();
}

class _WalletHhomeScreenState extends State<WalletHhomeScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    GestureDetector(
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
                          return const PartnerWithdrawalModal();
                        });
                  },
                      child: Container(
                        height: 42,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: TextBody(
                            "WITHDRAW",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBody(
                  'Recent Transaction',
                  fontSize: 18,
                ),
                GestureDetector(
                  onTap: () {},
                  child: TextSemiBold(
                    'View All',
                    color: IklinColors.primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                  const Gap(8),
                  myContainer(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget myContainer() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: IklinColors.accentGreen),
              child: const Center(
                child: Icon(
                  Icons.currency_exchange,
                  size: 15,
                ),
              ),
            ),
            const Gap(16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextBody(
                  "Fund Wallet",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const Gap(4),
                TextBody(
                  "23rd May, 2022",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Spacer(),
            TextBody(
              "#5000.00",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
