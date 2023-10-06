import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iklin/Partner/home/presentation.dart/widgets/partner_drawer_menu.dart';
import 'package:iklin/Partner/home/presentation.dart/widgets/partner_refer_box.dart';
import 'package:iklin/app/styles/fonts.dart';
import 'package:iklin/app/view/widgets/input_field.dart';
import 'package:iklin/core/constant/app_colors.dart';
import 'package:iklin/core/constant/constant.dart';
import 'package:iklin/core/constant/font.dart';
import 'package:iklin/features/home/presentation/widgets/order_container.dart';

class PartnerHhomeScreen extends StatefulWidget {
  const PartnerHhomeScreen({Key? key}) : super(key: key);

  @override
  State<PartnerHhomeScreen> createState() => _PartnerHhomeScreenState();
}

class _PartnerHhomeScreenState extends State<PartnerHhomeScreen> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String dropdownvalue = 'Available';
  var items = [
    'Available',
    'Unavailable',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const PartnerDrawerMenu(),
      backgroundColor: IklinColors.background,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.homeBackground,
            height: 247,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _key.currentState!.openDrawer();
                          print('menu');
                        },
                        child: Row(
                          
                          children: [
                            const SizedBox(
                              height: 38,
                              width: 38,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(AppAssets.userImg),
                              ),
                            ),
                            const Gap(26),
                            Column(
                              children: [
                                TextBody(
                                  'Hi Balogun',
                                  fontSize: 14,
                                  color: IklinColors.textColor.withOpacity(
                                    0.7,
                                  ),
                                ),
                                const Gap(3),
                                TextBold(
                                  'Welcome',
                                  fontSize: 18,
                                )
                              ],
                            ),
                            const Gap(5),
                            Image.asset(
                              AppAssets.clapEmoji,
                            )
                          ],
                        ),
                      ),
                      
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                          color: IklinColors.accentGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5.0, left: 15.0),
                            child: DropdownButton(
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: TextBody(
                                    items,
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(25),
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
                  const Gap(11),
                  const PartnerReferralBox(),
                  const Gap(25),
                  SizedBox(
                    height: 119,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        myContainer(text: "52", textt: "Pending Orders"),
                        const SizedBox(
                          width: 20,
                        ),
                        myContainer(text: "21", textt: "Complete Orders"),
                        const SizedBox(
                          width: 20,
                        ),
                        myContainer(text: "31", textt: "Pending Orders")
                      ],
                    ),
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody('Total Revenue',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      TextBody(
                        'Jun-Jul',
                        fontSize: 14,
                        color: IklinColors.textColor.withOpacity(
                          0.7,
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  SizedBox(
                    // width: 400,
                    height: 210,
                    child: LineChart(LineChartData(
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.white, width: 2)),
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(color: Colors.white, strokeWidth: 1);
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(color: Colors.white, strokeWidth: 1);
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 35,
                              getTextStyles: (context, value) {
                                return const TextStyle(
                                  color: Color(0xff68737d),
                                  fontSize: 16,
                                  fontFamily: IklinFont.euclid,
                                );
                              },
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Jan';
                                  case 2:
                                    return 'Feb';
                                  case 4:
                                    return 'Mar';
                                  case 6:
                                    return 'Apr';
                                  case 8:
                                    return 'May';
                                  case 10:
                                    return 'Jun';
                                }
                                return '';
                              },
                              margin: 8),
                          rightTitles: SideTitles(),
                          topTitles: SideTitles(),
                          leftTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 35,
                            getTextStyles: (context, value) {
                              return const TextStyle(
                                color: Color(0xff68737d),
                                fontSize: 16,
                                fontFamily: IklinFont.euclid,
                              );
                            },
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 0:
                                  return '0';
                                case 2:
                                  return '50';
                                case 4:
                                  return '100';
                                case 6:
                                  return '150';
                              }
                              return '';
                            },
                            margin: 12,
                          ),
                        ),
                        maxX: 8,
                        maxY: 8,
                        minY: 0,
                        minX: 0,
                        lineBarsData: [
                          LineChartBarData(
                              spots: [
                                const FlSpot(0, 0),
                                const FlSpot(1, 2),
                                const FlSpot(3, 6),
                                const FlSpot(5, 3),
                                const FlSpot(7, 6),
                                const FlSpot(8, 4),
                              ],
                              isCurved: true,
                              colors: [
                                Colors.black12,
                                Colors.white70,
                                Colors.white
                              ],
                              barWidth: 5,
                              belowBarData: BarAreaData(
                                  show: true,
                                  colors: gradientColors
                                      .map((e) => e.withOpacity(0.3))
                                      .toList()))
                        ])),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        'Recent Orders',
                        fontSize: 18,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TextSemiBold(
                          'View All',
                          color: IklinColors.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Gap(6),
                  OrderContainer(
                    orderType: 'Laundry',
                    typeImage: AppAssets.washImg,
                    todo: 'Wash, Fold and Iron',
                    img: AppAssets.vendorImg,
                    vendorName: 'Cranfield Drycleaning',
                    dateTime: 'Thur 14 may. 2022 -01:02PM',
                    mode: 'Delivered',
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   RouteName.receiptScreen,
                      // );
                    },
                  ),
                  OrderContainer(
                    onTap: () {},
                    orderType: 'Cleaning',
                    typeImage: AppAssets.washImg,
                    todo: 'Wash, Fold and Iron',
                    img: AppAssets.vendorImg,
                    vendorName: 'Cranfield Drycleaning',
                    dateTime: 'Thur 14 may. 2022 -01:02PM',
                    mode: 'Done',
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget myContainer({text, textt}) {
    return Container(
      width: 151,
      color: IklinColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextBold(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 32, color: Colors.black),
          ),
          TextBody(
            textt,
            style: TextStyle(
              fontSize: 14,
              color: IklinColors.textColor.withOpacity(
                0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
