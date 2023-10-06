import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/auth/presentation/widgets/partner_code_sent_modal.dart';
import 'package:iklin/Partner/auth/presentation/widgets/select_profession_modal.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/busy_button.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_assets.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class PartnerSignupPage2 extends StatefulWidget {
  const PartnerSignupPage2({Key? key}) : super(key: key);

  @override
  State<PartnerSignupPage2> createState() => _PartnerSignupPage2State();
}

class _PartnerSignupPage2State extends State<PartnerSignupPage2> {
  final TextEditingController _businessnameController = TextEditingController();
  final TextEditingController _registrationnumberController =
      TextEditingController();
  final TextEditingController _businessaddressController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selected = '';
  final List<String> _items = [
    'Dry Cleaning',
    'House Cleaning',
  ];

  @override
  Widget build(BuildContext context) {
    double size = 22;
    return Scaffold(
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
                const IklinBackButton(),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBody(
                      'Let’s get to know',
                      fontSize: 29,
                    ),
                    Row(
                      children: [
                        TextBody(
                          "2 of 3",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: size,
                          height: size,
                          child: Stack(children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return SweepGradient(
                                    startAngle: 0.0,
                                    endAngle: 3.14 * 4,
                                    stops: const [0.3, 0.3],
                                    center: Alignment.center,
                                    colors: [
                                      Colors.green,
                                      Colors.grey.withAlpha(55)
                                    ]).createShader(rect);
                              },
                              child: Container(
                                width: size,
                                height: size,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: size - 7,
                                height: size - 7,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
                TextBody(
                  "your business",
                  fontSize: 29,
                ),
                const Gap(30),
                TextBody(
                  'Business name',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _businessnameController,
                  placeholder: 'Enter your business name',
                  suffix: SvgPicture.asset(AppAssets.personIcon),
                ),
                const Gap(16),
                TextBody(
                  'Business Registration Number',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _registrationnumberController,
                  placeholder: 'Enter your Registration Number',
                  suffix: SvgPicture.asset(
                    AppAssets.personIcon,
                  ),
                ),
                const Gap(16),
                TextBody(
                  'Profession',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InkWell(
                  child: IgnorePointer(
                    child: InputField(
                      controller: _emailController,
                      placeholder: _selected,
                      suffix: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  onTap: () => showModal(context),
                ),
                const Gap(16),
                TextBody(
                  'Business Address',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(8),
                InputField(
                  controller: _businessaddressController,
                  placeholder: 'Enter your business address',
                ),
                const Gap(16),
                TextBody(
                  'Upload Your Documents For Verification',
                  color: IklinColors.grey.withOpacity(0.3),
                ),
                const Gap(10),
                FittedBox(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                           color: Colors.grey
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.file,
                              ),
                              const Gap(10),
                              TextSemiSemiBold("CAC",
                              color: IklinColors.grey.withOpacity(0.5),
                              fontSize: 15,
                              ),
                               const Gap(3),
                               TextBody("(optional)",
                               color: IklinColors.grey.withOpacity(0.5),
                               fontSize: 12,
                               ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: 48,
                        color: const Color(0xFFE7E9ED),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  AppAssets.fileupload,
                                ),
                                const Gap(5),
                                TextBody("Upload",
                                 color: IklinColors.grey.withOpacity(0.7),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(48),
                BusyButton(
                  title: 'Next',
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
                          return const PartnerCodeSentModal();
                        });
                  },
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              height: 230,
              width: double.infinity,
              decoration: const BoxDecoration(
                // color: IklinColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextBody(
                        'Select your profession',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        color: IklinColors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                        itemCount: _items.length,
                        separatorBuilder: (context, int) {
                          return Divider();
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
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
                              ),
                            ),
                          );
                        }
                        ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
