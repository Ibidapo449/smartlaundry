// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/core/core.dart';
import 'package:iklin/features/laundry/presentation/widgets/payment_succesful_modal.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class DebitCardScreen extends StatefulWidget {
  const DebitCardScreen({super.key});

  @override
  State<DebitCardScreen> createState() => _DebitCardScreenState();
}

class _DebitCardScreenState extends State<DebitCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDATEController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool isMaterCard = false;
  bool isverveCard = false;
  bool showLabel = false;
  bool expiryDateFocus = false;
  bool cvvFocus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                const Gap(47),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody(
                          'Almost there',
                          color: IklinColors.darkGrey,
                          fontSize: 32,
                        ),
                        const Gap(8),
                        TextBody(
                          'Add your debit card',
                          fontSize: 18,
                          color: IklinColors.grey.withOpacity(0.8),
                        ),
                        const Gap(20),
                        Container(
                            height: 52,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: IklinColors.grey.withOpacity(0.2))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: cardNumberController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CardNumberFormatter(),
                                      ],
                                      onTap: () {
                                        setState(() {
                                          showLabel = true;
                                        });
                                      },
                                      maxLength: 19,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: IklinColors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: IklinFont.euclid,
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          if (cardNumberController.text !=
                                                  null &&
                                              value[0] == '5') {
                                            isMaterCard = true;
                                          } else if (cardNumberController
                                                      .text !=
                                                  null &&
                                              value[0] == '4') {
                                            isverveCard = true;
                                            isMaterCard = false;
                                          } else {
                                            isMaterCard = false;
                                            isverveCard = false;
                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                          label: TextBody(
                                            'Card Number',
                                            fontSize: showLabel ? 10 : 14,
                                            color: showLabel
                                                ? IklinColors.primaryColor
                                                : IklinColors.grey
                                                    .withOpacity(0.5),
                                          ),
                                          border: InputBorder.none,
                                          counterText: '',
                                          hintText: 'Card Number',
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: IklinColors.grey
                                                .withOpacity(0.5),
                                            fontFamily: IklinFont.euclid,
                                          )),
                                    ),
                                  ),
                                  const Gap(20),
                                  isMaterCard
                                      ? Image.asset(
                                          AppAssets.masterCardLogo,
                                          height: 13,
                                          width: 22,
                                        )
                                      : isverveCard
                                          ? Image.asset(
                                              AppAssets.verve,
                                              height: 20,
                                              width: 22,
                                            )
                                          : SvgPicture.asset(
                                              AppAssets.debitCardIcon)
                                ],
                              ),
                            )),
                        const Gap(24),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: IklinColors.grey.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: expiryDateFocus
                                      ? IklinColors.background
                                      : IklinColors.grey.withOpacity(0.05)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      controller: expiryDATEController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        CardMonthInputFormatter()
                                      ],
                                      onTap: () {
                                        setState(() {
                                          expiryDateFocus = true;
                                        });
                                      },
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: IklinFont.euclid,
                                          color: IklinColors.grey
                                              .withOpacity(0.8)),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: TextBody(
                                          'Expiry date',
                                          fontSize: expiryDateFocus ? 10 : 15,
                                          color: expiryDateFocus
                                              ? IklinColors.primaryColor
                                              : IklinColors.grey
                                                  .withOpacity(0.8),
                                        ),
                                      ),
                                    )),
                                    const Gap(20),
                                    SvgPicture.asset(AppAssets.cardExpiry)
                                  ],
                                ),
                              ),
                            )),
                            const Gap(22),
                            Expanded(
                                child: Container(
                              height: 52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: IklinColors.grey.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: cvvFocus
                                      ? IklinColors.background
                                      : IklinColors.grey.withOpacity(0.05)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: cvvController,
                                        maxLength: 3,
                                        onTap: () {
                                          setState(() {
                                            cvvFocus = true;
                                          });
                                        },
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: IklinFont.euclid,
                                            color: IklinColors.grey
                                                .withOpacity(0.8)),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                          label: TextBody(
                                            'CVV',
                                            fontSize: cvvFocus ? 10 : 15,
                                            color: cvvFocus
                                                ? IklinColors.primaryColor
                                                : IklinColors.grey
                                                    .withOpacity(0.8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(20),
                                    SvgPicture.asset(AppAssets.cvv)
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        BusyButton(
                          title: 'Next',
                          onTap: () {
                            print(expiryDATEController.text);
                            showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: false,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const PaymentSuccessfulModal();
                                });
                          },
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

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
