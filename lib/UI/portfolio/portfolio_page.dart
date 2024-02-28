import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_one.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_three.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_two.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late TextEditingController searchController = TextEditingController();

  final controller = Get.put(PortfolioController());

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.brown
  ];

  late ApiService apiService;

  @override
  void initState() {
    setState(() {});
    controller;
    controller.getChartData();
    apiService = ApiService();
    super.initState();
    fetchData();
  }

  void fetchData() async {
    controller.fetchData();
    setState(() {});
    controller.getChartData();
    setState(() {});
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: GetBuilder<PortfolioController>(
          builder: (controller) {
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            return Column(
              children: [
                Container(
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
                                style:
                                    RegularTextStyle.regular15600(whiteColor)),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Obx(
                              () => Text(
                                '\$${controller.totalValue.toStringAsFixed(3)}', // Display total value with 2 decimal places
                                style: LargeTextStyle.large30400(whiteColor),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
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

                        StreamBuilder<List<GDPData>>(
                          stream: controller.getChartData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text("Error: ${snapshot.error}"));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(
                                  child: Text(
                                "No data",
                                style: LargeTextStyle.large18800(whiteColor),
                              ));
                            } else {
                              final List<GDPData> chartData = snapshot.data!;

                              double totalSum = chartData.fold(
                                  0, (sum, data) => sum + data.gdp);

                              return SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.scroll,
                                  position: LegendPosition.bottom,
                                  textStyle: RegularTextStyle.regular16bold(
                                      whiteColor),
                                ),
                                tooltipBehavior: controller.tooltipBehavior,
                                series: <CircularSeries>[
                                  DoughnutSeries<GDPData, String>(
                                    dataSource: chartData,
                                    explode: true,
                                    legendIconType: LegendIconType.diamond,
                                    xValueMapper: (GDPData data, _) =>
                                        data.continent,
                                    yValueMapper: (GDPData data, _) => data.gdp,
                                    dataLabelMapper: (GDPData data, _) =>
                                        '${((data.gdp / totalSum) * 100).toStringAsFixed(2)}%',
                                    dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      alignment: ChartAlignment.center,
                                      textStyle: RegularTextStyle.regular16bold(
                                          whiteColor),
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                      labelIntersectAction:
                                          LabelIntersectAction.shift,
                                    ),
                                    enableTooltip: true,
                                    radius: '80',
                                    pointColorMapper: (datum, index) {
                                      return colorList[
                                          index % colorList.length];
                                    },
                                  ),
                                ],
                              );
                            }
                          },
                        ),

                        // Image.asset("assets/Icons/Group81.png"),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height / 2,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [newGradient5, newGradient6],
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                // const SizedBox(height: 8),
                                TabBar(
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "Crypto",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: whiteColor,
                                            ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Assets",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: whiteColor,
                                            ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Cash",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: whiteColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  child: TabBarView(
                                    children: [
                                      TabBarScreenOne(),
                                      TabBarScreenTwo(),
                                      TabBarScreenThree()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            );
          },
        )));
  }
}
