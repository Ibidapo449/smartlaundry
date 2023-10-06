import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/laundry/presentation/widgets/bank_modal.dart';
import 'package:iklin/features/laundry/presentation/widgets/debit_card_modal.dart';
import 'package:iklin/features/laundry/presentation/widgets/wallet_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody(
                          'Select a payment\nmethod',
                          color: IklinColors.darkGrey,
                          fontSize: 32,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        PaymentMethodItem(
                          icons: AppAssets.cardIcon,
                          title: 'Debit Card',
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                )),
                                context: context,
                                builder: (context) => const DebitCardModal());
                          },
                        ),
                        const Gap(24),
                        PaymentMethodItem(
                          icons: AppAssets.walletIconn,
                          title: 'Wallet',
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              )),
                              context: context,
                              builder: (context) => const WalletModal(),
                            );
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
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const BankModal();
                                });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        BusyButton(
                          title: 'Continue',
                          onTap: () {},
                        ),
                        const Gap(20),
                      ],
                    ),
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

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.icons,
    required this.title,
    required this.onTap,
  });
  final String icons;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: IklinColors.white,
            border: Border.all(
              color: IklinColors.primaryColor,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: SvgPicture.asset(icons),
            title: TextSemiBold(
              title,
              color: IklinColors.grey,
              fontSize: 15,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: IklinColors.grey.withOpacity(0.4),
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
