import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/API/portfolio_api/search_api.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_two_widgets/inner_tab_assets.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_two_widgets/inner_tab_loans.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/tab_two_widgets/inner_tab_trips.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/updateanddelete_assets.dart';

class TabBarScreenTwo extends StatefulWidget {
  const TabBarScreenTwo({super.key});

  @override
  State<TabBarScreenTwo> createState() => _TabBarScreenTwoState();
}

class _TabBarScreenTwoState extends State<TabBarScreenTwo> {
  late TextEditingController searchController = TextEditingController();

  late ApiService apiService;
  int _portfolio = 1;
  List<SearchData> searchList = [];
  bool isSearchidle = true;

  final assetscontroller = Get.put(PortfolioController2());

  // final assetsController = Get.put(PortfolioController2());
  // final cashController = Get.put(PortfolioController3());

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
    _getSearch();
    searchController.addListener(onSearchTextControlled);
  }

  _getSearch() async {
    try {
      searchList = await SearchApi()
          .getSearchData(searchController.text.trim(), _portfolio);
    } catch (error) {
      // Handle error
      print('Error in _getSearch: $error');
    }
  }

  void onSearchTextControlled() {
    _getSearch();
    setState(() {
      isSearchidle = searchController.text.isEmpty;
      print(isSearchidle);
    });
  }

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            final double width = MediaQuery.of(context).size.width;
            final double height = MediaQuery.of(context).size.height;
            return SingleChildScrollView(
              child: GetBuilder<PortfolioController2>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Column(
                              children: [
                                TabBar(
                                  dividerColor: transparent,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'Assets',
                                        style: RegularTextStyle.regular15400(
                                            whiteColor),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Loans',
                                        style: RegularTextStyle.regular15400(
                                            whiteColor),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Trip',
                                        style: RegularTextStyle.regular15400(
                                            whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height,
                                  child: TabBarView(
                                    children: [
                                      InnerAssetsScreen(
                                          width: width, height: height),

                                      InnerLoansScreen(
                                          width: width, height: height),
                                       InnerTripTabScreenFour(height: height,width: width,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSearchResults(width) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "SEARCH RESULTS",
              style: RegularTextStyle.regular15400(whiteColor),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            final product = searchList[index];
            print(product);
            return buildSearchDetails(product, index, width);
          },
        ),
      ],
    );
  }

  FutureBuilder<List<Portfolio>> buildContentWidget(double width) {
    return FutureBuilder<List<Portfolio>>(
        future: apiService.getData1(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else {
            final List<Portfolio> portfolios = snapshot.data!;

            return ListView.builder(
              key: UniqueKey(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                _portfolio = portfolios[index].subCat;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateAssetsScreen(

                            // assetsController
                            //     .assetsPortfolios,
                            // cashController
                            //     .cashPortfolios,
                            index: index,
                            portfolios: portfolios[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.05,
                            ),
                            // CachedNetworkImage(
                            //     color: transparent,
                            //     imageUrl:
                            //         'https://www.${portfolios[index].imageUrl}',
                            //     imageBuilder: (context, imageProvider) =>
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 0),
                            //           child: ClipRRect(
                            //             borderRadius:
                            //                 BorderRadius.circular(20.0),
                            //             child: Container(
                            //               width: MediaQuery.of(context)
                            //                       .size
                            //                       .width /
                            //                   19,
                            //               height: 30,
                            //               decoration: BoxDecoration(
                            //                   color: transparent,
                            //                   image: DecorationImage(
                            //                       image: imageProvider,
                            //                       fit: BoxFit.cover)),
                            //             ),
                            //           ),
                            //         ),
                            //     progressIndicatorBuilder: (context, url,
                            //             downloadProgress) =>
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 14),
                            //           child: ClipRRect(
                            //             borderRadius:
                            //                 BorderRadius.circular(20.0),
                            //             child: Container(
                            //               width: MediaQuery.of(context)
                            //                       .size
                            //                       .width /
                            //                   13,
                            //               height: 30,
                            //               decoration: const BoxDecoration(
                            //                 color: whiteColor,
                            //               ),
                            //               child:
                            //                   const CupertinoActivityIndicator(),
                            //             ),
                            //           ),
                            //         ),
                            //     errorWidget: (context, url, error) => Padding(
                            //           padding: const EdgeInsets.only(
                            //             left: 0,
                            //             right: 0,
                            //             bottom: 0,
                            //             top: 0,
                            //           ),
                            //           child: ClipRRect(
                            //             borderRadius:
                            //                 BorderRadius.circular(20.0),
                            //             child: Container(
                            //                 width: MediaQuery.of(context)
                            //                         .size
                            //                         .width /
                            //                     20,
                            //                 height: 30,
                            //                 decoration: const BoxDecoration(
                            //                     color: transparent,
                            //                     image: DecorationImage(
                            //                         image: AssetImage(
                            //                             'assets/Dollar.png'))),
                            //                 child: Image.asset(
                            //                     'assets/Dollar.png')),
                            //           ),
                            //         )),
                            Image.asset(
                              "assets/Dollar.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Text(portfolios[index].coinName,
                                style:
                                    RegularTextStyle.regular15600(iconColor2)),
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
                                      const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Text(
                                      '${portfolios[index].quantity}  ${portfolios[index].coinShort}',
                                      style: RegularTextStyle.regular14400(
                                          whiteColor)),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "\$ ${portfolios[index].value.toStringAsFixed(3)}",
                                      style: RegularTextStyle.regular14400(
                                          whiteColor)),
                                ),
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
        });
  }

  Widget buildSearchDetails(SearchData data, index, width) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => UpdateAssetsScreen(
            //       index: index,
            //       searchData: data,
            //     ),
            //   ),
            // );
          },
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: transparent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 47, 44, 44).withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 1,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   height: 70,
                //   width: 70,
                //   margin: const EdgeInsets.only(right: 15),
                //   child: Image.asset('assets/images/Logo.png'),
                // ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 30,
                              width: 160,
                              child: Text(
                                data.coinName,
                                style:
                                    RegularTextStyle.regular15400(whiteColor),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              data.value.toString(),
                              style: RegularTextStyle.regular14600(whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const defaultPadding = 20.0;

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
  });
  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: Duration(seconds: 1),
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
                Text("${(value * 100).toInt()}%")
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            LinearProgressIndicator(
              value: value,
              color: borderColor,
              backgroundColor: blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
