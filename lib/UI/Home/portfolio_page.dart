import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Model/portfolio_model.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {

  late TextEditingController searchController = TextEditingController();

  List<PortfolioModel> portfolios = [
    PortfolioModel(name: "Monero", image: "assets/Icons/monero-symbol-on-white-480.png", amount: "\$200.89"),
    PortfolioModel(name: "Bitcoin", image: "assets/Icons/Bitcoin.svg.png", amount: "\$26000.99"),
    PortfolioModel(name: "Ethereum", image: "assets/Icons/ethereum.png", amount: "\$3000.89"),
    PortfolioModel(name: "TetherUS", image: "assets/Icons/tether.png", amount: "\$10.00"),
    PortfolioModel(name: "XRP", image: "assets/Icons/ripple.png", amount: "\$0.50"),
  ];

  @override
  void initState() {
    super.initState();
  }
  Map<String, double> dataMap = {
    "Monero": 3,
    "Bitcoin": 3,
    "Ethereum": 1,
    "TetherUS": 2,
    "XRP" : 1
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
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.02,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        'Portfolio Worth',
                        textAlign: TextAlign.center,
                        style: RegularTextStyle.regular15600(whiteColor)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                       Text(
                        '\$97,876.67',
                        style: LargeTextStyle.large40700(whiteColor)
                      ),
                      const SizedBox(width: 10,),
                      Image.asset("assets/Icons/Group82.png",height: 20,width: 40,)
                    ],
                  ),
                  SizedBox(height: height*0.04,),
                  PieChart(
                    dataMap: dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartLegendSpacing: 35,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 32,
                    // centerText: "HYBRID",
                    legendOptions:  LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: RegularTextStyle.regular16bold(whiteColor)
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                  // Image.asset("assets/Icons/Group81.png"),
                  SizedBox(height: height*0.03,),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            newGradient5,
                            newGradient6
                          ],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.03,),
                         Text("Portfolio",
                          style: RegularTextStyle.regular15600(whiteColor) ),
                        const SizedBox(height: 8,),
                        Container(width: width*0.15, height: 2, color:  lineColor,),
                        Container(width: width*0.9, height: 1, color: lineColor2,),
                        SizedBox(height: height*0.03,),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: width*0.05, right: width*0.05),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: searchController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            style: RegularTextStyle.regular14400(whiteColor),
                            decoration:  InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: textfieldColor, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: textfieldColor, width: 1.0),
                              ),
                              hintText: "Browse",
                              hintStyle: RegularTextStyle.regular14400(hintColor),
                              filled: true,
                              fillColor: textfieldColor,
                              prefixIcon: const Icon(Icons.search_rounded, color:hintColor,),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: width*0.06),
                                  child:  Text(
                                    'Name',
                                    style: RegularTextStyle.regular15600(whiteColor)
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: width*0.06),
                                  child:  Text(
                                    'Sep 26',
                                    style: RegularTextStyle.regular15600(whiteColor)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: width*0.05,),
                                          Image.asset(portfolios[index].image,width: 30,height: 25,color: buttonColor,),
                                          SizedBox(width: width*0.05,),
                                          Text(portfolios[index].name,
                                            style: RegularTextStyle.regular15600( iconColor2) ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(portfolios[index].amount, style: RegularTextStyle.regular14400(whiteColor)
                                          ),
                                          SizedBox(width: width*0.05,)
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: portfolios.length,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
