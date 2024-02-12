import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/add_tab_three_assets.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/updateanddelete_assets.dart';

class TabBarScreenThree extends StatefulWidget {
  const TabBarScreenThree({super.key});

  @override
  State<TabBarScreenThree> createState() => _TabBarScreenThreeState();
}

class _TabBarScreenThreeState extends State<TabBarScreenThree> {
  late TextEditingController searchController = TextEditingController();

  late ApiService apiService;
  late int _portfolio;

  // final controller = Get.put(PortfolioController());
  // final assetsController = Get.put(PortfolioController2());
  @override
  void initState() {
    apiService = ApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: GetBuilder<PortfolioController3>(
          init: PortfolioController3(),
          builder: (cashController) {
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
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
                              borderSide:
                                  BorderSide(color: textfieldColor, width: 1.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: textfieldColor, width: 1.0),
                            ),
                            hintText: "Browse",
                            hintStyle: RegularTextStyle.regular14400(hintColor),
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
                                child: Text('Cash',
                                    style: RegularTextStyle.regular15600(
                                        whiteColor)),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: width * 0.02),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ADDTabThreeCash(
                                                    cashController
                                                        .cashPortfolios,
                                                    _portfolio,
                                                    centerTitle: 'Add New Cash',
                                                  )),
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
                          FutureBuilder<List<Portfolio>>(
                              future: apiService.getDataForCash(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.data!.isEmpty) {
                                  return Center(
                                    child: Text(
                                      "No data",
                                      style:
                                          LargeTextStyle.large18800(whiteColor),
                                    ),
                                  );
                                } else if (!snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      "No data",
                                      style:
                                          LargeTextStyle.large18800(whiteColor),
                                    ),
                                  );
                                } else {
                                  final portfolios = snapshot.data!;

                                  return ListView.builder(
                                    key: UniqueKey(),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      _portfolio = portfolios[index].subCat;
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateAssetsScreen(
                                                      index: index,
                                                      portfolios: cashController
                                                          .cashPortfolios),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
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
                                                          'https://www.${portfolios[index].imageUrl}',
                                                      imageBuilder: (context,
                                                              imageProvider) =>
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
                                                                        left:
                                                                            14),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
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
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 0,
                                                              right: 0,
                                                              bottom: 0,
                                                              top: 0,
                                                            ),
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
                                                                      20,
                                                                  height: 30,
                                                                  decoration: const BoxDecoration(
                                                                      color:
                                                                          transparent,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              'assets/Dollar.png'))),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Dollar.png')),
                                                            ),
                                                          )),
                                                  SizedBox(
                                                    width: width * 0.05,
                                                  ),
                                                  Text(
                                                      portfolios[index]
                                                          .coinName,
                                                      style: RegularTextStyle
                                                          .regular15600(
                                                              iconColor2)),
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
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                30, 0, 0, 0),
                                                        child: Text(
                                                            portfolios[index]
                                                                .quantity
                                                                .toString(),
                                                            style: RegularTextStyle
                                                                .regular14400(
                                                                    whiteColor)),
                                                      ),
                                                      Text(
                                                          "\$ ${portfolios[index].value.toStringAsFixed(3)}",
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
                                        ),
                                      );
                                    },
                                    itemCount: portfolios.length,
                                  );
                                }
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )));
  }
}
