import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';

class PartnerWithdrawalModal extends StatefulWidget {
  const PartnerWithdrawalModal({super.key});

  @override
  State<PartnerWithdrawalModal> createState() => _PartnerWithdrawalModalState();
}

class _PartnerWithdrawalModalState extends State<PartnerWithdrawalModal> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                children: [
                  TextBody(
                    "Withdraw",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    "withdraw direct to your bank",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const Gap(22),
                  InputField(
                    fieldHeight: 52,
                    textInputType: TextInputType.number,
                    controller: _amountController,
                    placeholder: 'Amount',
                    maxLength: 11,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(15),
                  InputField(
                    fieldHeight: 52,
                    textInputType: TextInputType.number,
                    controller: _accountNumberController,
                    placeholder: 'Account Number',
                    maxLength: 11,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(15),
                  IgnorePointer(
                    child: InputField(
                      fieldHeight: 52,
                      textInputType: TextInputType.number,
                      controller: _amountController,
                      placeholder: 'Select bank',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const Gap(15),
                  InputField(
                    fieldHeight: 52,
                    textInputType: TextInputType.text,
                    controller: _descriptionController,
                    placeholder: 'Description',
                  ),
                  const Gap(32),
                  Container(
                    height: 52,
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
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}
