import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/add_new_assets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Model/portfolio_model.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  late TextEditingController searchController = TextEditingController();
  final controller = Get.put(PortfolioController());

  List<PortfolioModel> portfolios = [
    PortfolioModel(
        name: "Monero",
        image: "assets/Icons/monero-symbol-on-white-480.png",
        amount: "\$200.89"),
    PortfolioModel(
        name: "Bitcoin",
        image: "assets/Icons/Bitcoin.svg.png",
        amount: "\$26000.99"),
    PortfolioModel(
        name: "Ethereum",
        image: "assets/Icons/ethereum.png",
        amount: "\$3000.89"),
    PortfolioModel(
        name: "TetherUS", image: "assets/Icons/tether.png", amount: "\$10.00"),
    PortfolioModel(
        name: "XRP", image: "assets/Icons/ripple.png", amount: "\$0.50"),
  ];

  Map<String, double> dataMap = {
    "Monero": 3,
    "Bitcoin": 3,
    "Ethereum": 1,
    "TetherUS": 2,
    "XRP": 1
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background_new_wallet.png"),
                fit: BoxFit.fill,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Portfolio Worth',
                          textAlign: TextAlign.center,
                          style: RegularTextStyle.regular15600(whiteColor)),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '\$${controller.totalValue.toStringAsFixed(2)}', // Display total value with 2 decimal places
                        style: LargeTextStyle.large30400(whiteColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/Icons/Group82.png",
                        height: 20,
                        width: 40,
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.04,
                  // ),
                  // PieChart(
                  //   dataMap: controller.dataMap,
                  //   animationDuration: const Duration(milliseconds: 800),
                  //   chartLegendSpacing: 35,
                  //   chartRadius: MediaQuery.of(context).size.width / 3.2,
                  //   colorList: colorList,
                  //   initialAngleInDegree: 0,
                  //   chartType: ChartType.ring,
                  //   ringStrokeWidth: 32,
                  //   legendOptions: LegendOptions(
                  //     showLegendsInRow: false,
                  //     legendPosition: LegendPosition.right,
                  //     showLegends: true,
                  //     legendShape: BoxShape.circle,
                  //     legendTextStyle:
                  //         RegularTextStyle.regular16bold(whiteColor),
                  //   ),
                  //   chartValuesOptions: const ChartValuesOptions(
                  //     showChartValues: false,
                  //     showChartValuesInPercentage: false,
                  //     showChartValuesOutside: false,
                  //     decimalPlaces: 0,
                  //   ),
                  // ),
                  Obx(
                    () => SfCircularChart(
                      legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.none,
                        position: LegendPosition.right,
                        textStyle: RegularTextStyle.regular16bold(whiteColor),
                      ),
                      tooltipBehavior: controller.tooltipBehavior,
                      series: <CircularSeries>[
                        DoughnutSeries<GDPData, String>(
                          dataSource: controller.getChartData(),
                          xValueMapper: (GDPData data, _) => data.continent,
                          yValueMapper: (GDPData data, _) => data.gdp,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle:
                                  RegularTextStyle.regular16bold(whiteColor),
                              labelPosition: ChartDataLabelPosition.outside),
                          enableTooltip: true,
                          radius: '80',
                          // maximumValue: 40000, // Adjust as needed
                        ),
                      ],
                    ),
                  ),

                  // Image.asset("assets/Icons/Group81.png"),
                  SizedBox(
                    height: height * 0.00001,
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [newGradient5, newGradient6],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text("Portfolio",
                            style: RegularTextStyle.regular15600(whiteColor)),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: width * 0.15,
                          height: 2,
                          color: lineColor,
                        ),
                        Container(
                          width: width * 0.9,
                          height: 1,
                          color: lineColor2,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(
                              left: width * 0.05, right: width * 0.05),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: searchController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            style: RegularTextStyle.regular14400(whiteColor),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: textfieldColor, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: textfieldColor, width: 1.0),
                              ),
                              hintText: "Browse",
                              hintStyle:
                                  RegularTextStyle.regular14400(hintColor),
                              filled: true,
                              fillColor: textfieldColor,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: hintColor,
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.06),
                                  child: Text('Assets',
                                      style: RegularTextStyle.regular15600(
                                          whiteColor)),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(right: width * 0.02),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     AddAssetsDetail(controller.portfolios)),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: whiteColor,
                                        ))),
                              ],
                            ),
                            const Divider(
                              thickness: 0.2,
                              indent: 15,
                              endIndent: 15,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(() {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            CachedNetworkImage(
                                                color: transparent,
                                                imageUrl:
                                                    'https://www.${controller.portfolios[index].imageUrl}',
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  19,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      transparent,
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            ),
                                                          ),
                                                        ),
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 14),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  13,
                                                              height: 30,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color:
                                                                    whiteColor,
                                                              ),
                                                              child:
                                                                  const CupertinoActivityIndicator(),
                                                            ),
                                                          ),
                                                        ),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 0,
                                                        right: 0,
                                                        bottom: 0,
                                                        top: 0,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                20,
                                                            height: 30,
                                                            decoration: const BoxDecoration(
                                                                color:
                                                                    transparent,
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/Dollar.png'))),
                                                            child: Image.asset(
                                                                'assets/Dollar.png')),
                                                      ),
                                                    )),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                                controller
                                                    .portfolios[index].coinName,
                                                style: RegularTextStyle
                                                    .regular15600(iconColor2)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.05,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 0, 0, 0),
                                                  child: Text(
                                                      controller
                                                          .portfolios[index]
                                                          .quantity
                                                          .toString(),
                                                      style: RegularTextStyle
                                                          .regular14400(
                                                              whiteColor)),
                                                ),
                                                Text(
                                                    "\$ ${controller.portfolios[index].value.toStringAsFixed(3)}",
                                                    style: RegularTextStyle
                                                        .regular14400(
                                                            whiteColor)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                              },
                              itemCount: controller.portfolios.length,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
