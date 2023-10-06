import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/account_type_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class AddBankPage extends StatefulWidget {
  const AddBankPage({super.key});

  @override
  State<AddBankPage> createState() => _AddBankPageState();
}

class _AddBankPageState extends State<AddBankPage> {
  String _selected = '';
  final List<String> _items = [
    'Savings Account',
    'Current Account',
  ];
   final TextEditingController _accountNameController = TextEditingController();
   final TextEditingController _accountNumberController = TextEditingController();
   final TextEditingController _accountTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: IklinColors.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Row(
                children: [
                  const IklinBackButton(),
                  const Gap(90),
                  TextBody(
                    "Add Bank",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
              const Gap(20),
              mytext(text: "Account Name"),
               const Gap(5),
               InputField(
                controller: _accountNameController, 
                textInputAction: TextInputAction.next,
                placeholder: "Enter Account Name",
                ),
                const Gap(10),
                 mytext(text: "Account Number"),
               const Gap(5),
               InputField(
                textInputType: TextInputType.number,
                controller: _accountNumberController, 
                placeholder: "Enter Account Number"
                ),
                const Gap(10),
                 mytext(text: "Account Type"),
               const Gap(5),
               InkWell(
                onTap: () => showModal(context),
                 child: IgnorePointer(
                   child: InputField(
                    controller: _accountTypeController, 
                    placeholder: _selected,
                     suffix: const Icon(Icons.keyboard_arrow_down),
                    ),
                 ),
               ),
                const Gap(10),
                 mytext(text: "Bank Name"),
               const Gap(5),
               IgnorePointer(
                 child: InputField(
                  controller: _accountTypeController, 
                  placeholder: "Select Bank Name",
                  ),
               ),
                const Gap(100),
                BusyButton(
                  title: "ADD BANK", 
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
                          return const AccountTypeModal();
                        });
                  },
                  buttonColor: Colors.green,
                  ),
          
            ],
          ),
        ),
      )),
    );
  }

  TextSemiSemiBold mytext({text}) {
    return TextSemiSemiBold(text,
          style:  TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600
          ),
          );
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height:65,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 65,
                    child: ListView.separated(
                        itemCount: _items.length,
                        // ignore: avoid_types_as_parameter_names
                        separatorBuilder: (context, int) {
                          return const Divider(
                            color: Colors.transparent,
                          );
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                                setState(() {
                                  _selected = _items[index];
                                });
                                Navigator.of(context).pop();
                              },
                            child: TextBody(
                              _items[index],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              // color: IklinColors.grey.withOpacity(0.3),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
