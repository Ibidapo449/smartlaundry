import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/navigators/navigators.dart';
import 'package:iklin/features/laundry/presentation/widgets/review_container.dart';
import 'package:iklin/features/onboarding/presentation/pages/get_started.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IklinColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: IklinColors.primaryColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                    child: IklinBackButton(),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 100,
                      ),
                      child: LaundryManCardInfo()),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Container(
                        height: 78,
                        width: 78,
                        decoration: const BoxDecoration(
                          color: IklinColors.grey2,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets.laundry,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSemiBold(
                    'Services',
                    color: IklinColors.grey,
                    fontSize: 18,
                  ),
                  const Gap(8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     myContainer(
                      text: "Lundary",
                      image: AppAssets.cloth,
                     ),
                     myContainer(
                      text: "Cleaning",
                      image: AppAssets.broom,
                     ),
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                      ),
                      height: 112,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Center(
                        child: Icon(Icons.add),
                      ),
                     )
                      
                    ],
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBold(
                        'Review',
                        fontSize: 18,
                        color: IklinColors.grey.withOpacity(0.8),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.allReviewPage,
                          );
                        },
                        child: TextBody(
                          'See all',
                           fontSize: 18,
                          color: IklinColors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  const Gap(16),
                 const ReviewContainer(),
                  
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget myContainer({text,image}) {
    return Flexible(
                   child: Container(
                    height: 112,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                     color: IklinColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(image),
                          TextSemiBold(text,
                          style: TextStyle(
                             color:IklinColors.grey.withOpacity(0.3),
                          ),
                          ),
                        ],
                      ),
                    ),
                   ),
                 );
  }
}

class LaundryManCardInfo extends StatelessWidget {
  const LaundryManCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: IklinColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(58),
          Align(
            child: TextSemiBold(
              'OLA’S VENTURES',
              color: IklinColors.black,
              fontSize: 18,
            ),
          ),
          const Gap(21),
            const Divider(thickness: 2),
            const Gap(21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.email,
                    color: IklinColors.grey.withOpacity(0.3),
                    ),
                    TextSemiBold("Email",
                    style:  TextStyle(
                      fontSize: 14,
                      color:IklinColors.grey.withOpacity(0.3),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.messenger_rounded,
                    color: IklinColors.grey.withOpacity(0.3),
                    ),
                     TextSemiBold("Message",
                    style:  TextStyle(
                      fontSize: 14,
                      color: IklinColors.grey.withOpacity(0.3),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                     Icon(Icons.location_on,
                    color: IklinColors.grey.withOpacity(0.3),
                    ),
                     TextSemiBold("Location",
                    style: TextStyle(
                      fontSize: 14,
                      color:IklinColors.grey.withOpacity(0.3),
                    ),
                    ),
                  ],
                )
              ],
            )
        ],
      ),
      
    );
  }
}
