import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/cleaning/presentation/widgets/bank_tf_modal.dart';
import 'package:iklin/features/cleaning/presentation/widgets/card_modal.dart';
import 'package:iklin/features/cleaning/presentation/widgets/wallet_modal.dart';
import 'package:iklin/features/laundry/presentation/pages/payment_method_screen.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class CleaningPayment extends StatefulWidget {
  const CleaningPayment({super.key});

  @override
  State<CleaningPayment> createState() => _CleaningPaymentState();
}

class _CleaningPaymentState extends State<CleaningPayment> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IklinBackButton(),
                TextSemiBold(
                  'Payment Method',
                  fontSize: 18,
                  color: IklinColors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody(
                      'Select a payment method',
                      fontSize: 32,
                    ),
                    const Gap(48),
                    PaymentMethodItem(
                      icons: AppAssets.cardIcon,
                      title: 'Debit Card',
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const CleaningCardModal();
                            });
                      },
                    ),
                    const Gap(24),
                    PaymentMethodItem(
                      icons: AppAssets.walletIconn,
                      title: 'Wallet',
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const CleaningWalletModal();
                            });
                      },
                    ),
                    const Gap(24),
                    PaymentMethodItem(
                      icons: AppAssets.bankIcon,
                      title: 'Bank Transfer',
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                            context: context,
                            builder: (context) {
                              return const CleaningBankTfModal();
                            });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    BusyButton(
                      title: 'Continue',
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
