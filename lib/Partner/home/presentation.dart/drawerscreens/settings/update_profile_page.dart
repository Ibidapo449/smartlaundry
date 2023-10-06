import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/profile_successful_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _cacRnController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _officeAddressController = TextEditingController();
  final TextEditingController _landMarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
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
                      "Update Profile",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                const Gap(20),
                Center(
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black54,
                        )),
                   child: const Center(
                    child: Icon(Icons.camera_alt,
                    color: Colors.black54,
                    ),
                   ),     
                  ),
                ),
                const Gap(5),
                Center(
                    child: TextBody(
                  "Upload Picture",
                  color: Colors.green,
                )),
                const Gap(20),
                InputField(
                  controller: _companyNameController,
                  placeholder: "Company's Name",
                ),
                const Gap(10),
                InputField(
                  controller: _cacRnController,
                  placeholder: "CAC RN",
                ),
                const Gap(10),
                InputField(
                  controller: _emailAddressController,
                  placeholder: "Email Address",
                ),
                const Gap(10),
                InputField(
                  controller: _phoneNumberController,
                  placeholder: "Phone Number",
                ),
                const Gap(10),
                InputField(
                  controller: _officeAddressController,
                  placeholder: "Office Address",
                ),
                const Gap(10),
                InputField(
                  controller: _companyNameController,
                  placeholder: "State",
                ),
                const Gap(10),
                InputField(
                  controller: _landMarkController,
                  placeholder: "Land Mark",
                ),
                const Gap(10),
                InputField(
                  controller: _companyNameController,
                  placeholder: "Service Type",
                ),
                const Gap(30),
                BusyButton(
                  title: "Update", 
                   onTap: () => AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                       animType: AnimType.BOTTOMSLIDE,
                      dialogType: DialogType.NO_HEADER,
                      body: const ProfileSuccessfulModal(),
                    ).show()
                  )
              ],
            ),
          ),
        )));
  }
}
