
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/account_type_modal.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/password_successful_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';

class ChangePasswordModal extends StatefulWidget {
  const ChangePasswordModal({super.key});

  @override
  State<ChangePasswordModal> createState() => _ChangePasswordModalState();
}

class _ChangePasswordModalState extends State<ChangePasswordModal> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        height: 450,
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
                    "Change Password",
                    fontSize: 18,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.cancel_outlined))
                ],
              ),
              const Gap(20),
              TextBody(
                "Old Password",
                fontSize: 15,
                color: Colors.black54,
              ),
              const Gap(8),
              InputField(
                controller: _oldPasswordController,
                placeholder: '**********',
                password: true,
              ),
              const Gap(10),
              TextBody(
                "New Password",
                fontSize: 15,
                color: Colors.black54,
              ),
              const Gap(8),
              InputField(
                controller: _newPasswordController,
                placeholder: '**********',
                password: true,
              ),
              const Gap(10),
              TextBody(
                "Confirm Password",
                fontSize: 15,
                color: Colors.black54,
              ),
              const Gap(8),
              InputField(
                controller: _confirmPasswordController,
                placeholder: '**********',
                password: true,
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BusyButton(
                  title: "Update Password", 
                  onTap: () => AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                       animType: AnimType.BOTTOMSLIDE,
                      dialogType: DialogType.NO_HEADER,
                      body: const PasswordSuccesfluModal(),
                    ).show()
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
