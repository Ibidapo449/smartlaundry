import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/drawerscreens/settings/widgets/profile_successful_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class UserUpdateProfile extends StatefulWidget {
  const UserUpdateProfile({super.key});

  @override
  State<UserUpdateProfile> createState() => _UserUpdateProfileState();
}

class _UserUpdateProfileState extends State<UserUpdateProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  String _selected = '';
  final List<String> _items = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross  river',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Ogun',
    'Lagos',
    'Abuja',
    'Adamawa',
    'Adamawa',
    'Adamawa',
    'Adamawa',
    'Adamawa',
  ];

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
                    const Gap(85),
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
                    height: 85,
                    width: 85,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.profile,
                        height: 35,
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                Center(
                    child: TextSemiSemiBold(
                  "Upload Picture",
                  color: Colors.green,
                  fontSize: 13,
                )),
                const Gap(20),
                TextBody(
                  "First Name",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  controller: _firstNameController,
                  placeholder: "Hammed",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBody(
                  "Last Name",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  controller: _firstNameController,
                  placeholder: "Balogun",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBody(
                  "Phone Number",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  controller: _firstNameController,
                  placeholder: "09023478989",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBody(
                  "Email Address",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  controller: _firstNameController,
                  placeholder: "balogun@gmail.com",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBody(
                  "Contact Address",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  controller: _firstNameController,
                  placeholder: "14, Adeniji Adele Road",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBody(
                  "State",
                  fontSize: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  child: IgnorePointer(
                    child: InputField(
                      controller: _firstNameController,
                      placeholder: _selected,
                      suffix: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () => showModal(),
                ),
                const SizedBox(
                  height: 20,
                ),
                BusyButton(
                  title: "Update Profile",
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
        ),
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBody(
                        "Select your State",
                        fontSize: 24,
                      ),
                      const Gap(15),
                      InputField(
                        controller: TextEditingController(),
                        placeholder: 'Search',
                        fieldColor: IklinColors.white.withOpacity(0.4),
                        validationColor: IklinColors.grey2.withOpacity(
                          0.2,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.only(
                            right: 11,
                          ),
                          child: SvgPicture.asset(
                            AppAssets.searchIcon,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: ListView.separated(
                            itemCount: _items.length,
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
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }),
                      )
                    ]),
              ),
            ));
  }
}
