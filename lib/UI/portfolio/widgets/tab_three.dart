import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/API/portfolio_api/search_api.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
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

  final focus = FocusNode();

  List<SearchData> searchList = [];

  // final controller = Get.put(PortfolioController());
  // final assetsController = Get.put(PortfolioController2());
  @override
  void initState() {
    apiService = ApiService();
    super.initState();
    _getSearch();
    searchController.addListener(onSearchTextControlled);
  }

  _getSearch() async {
    try {
      final List<SearchData> searchData = await SearchApi()
          .getSearchData(searchController.text.trim(), _portfolio);
      if (mounted) {
        setState(() {
          searchList = searchData;
        });
      }
    } catch (error) {
      // Handle error
      print('Error in _getSearch: $error');
    }
  }

  void onSearchTextControlled() {
    _getSearch();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchChild(SearchData x) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          child: Text("${x.coinName} - ${x.value.toStringAsFixed(4)}",
              style: RegularTextStyle.regular16600(whiteColor)),
        );
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
                        child: SearchField<SearchData>(
                          controller: searchController,
                          suggestionDirection: SuggestionDirection.flex,
                          onSearchTextChanged: (query) {
                            final filter = searchList
                                .where((element) => element.coinName
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                            return filter
                                .map((e) =>
                                    SearchFieldListItem<SearchData>(e.coinName,
                                        child: searchChild(
                                          e,
                                        )))
                                .toList();
                          },

                          onTap: () {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) {
                          //   if (value == null ||
                          //       !searchList.contains(value.trim())) {
                          //     return 'Enter a valid name';
                          //   }
                          //   return null;
                          // },
                          key: const Key('searchfield'),
                          itemHeight: 50,
                          hint: 'Browse',
                          scrollbarDecoration: ScrollbarDecoration(),
                          onTapOutside: (x) {
                            focus.unfocus();
                          },
                          suggestionStyle:
                              RegularTextStyle.regular16600(whiteColor),
                          searchStyle:
                              RegularTextStyle.regular16600(whiteColor),
                          searchInputDecoration: InputDecoration(
                            prefixIcon: const Icon(CupertinoIcons.search),
                            prefixIconColor: greyColor,
                            hintStyle: RegularTextStyle.regular16600(greyColor),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                            fillColor: gradientColor2,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          suggestionsDecoration: SuggestionDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          suggestions: searchList
                              .map((e) => SearchFieldListItem<SearchData>(
                                    e.coinName,
                                    child: searchChild(
                                      e,
                                    ),
                                  ))
                              .toList(),
                          focusNode: focus,
                          suggestionState: Suggestion.expand,
                          onSuggestionTap:
                              (SearchFieldListItem<SearchData>? x) {
                            if (x != null) {
                              final selectedData = x.searchKey;
                              print(selectedData);
                              // Send selected data
                            }
                            focus.unfocus();
                          },
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
                                                      portfolios:
                                                          portfolios[index]),
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
