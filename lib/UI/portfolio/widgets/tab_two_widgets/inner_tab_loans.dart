import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/API/portfolio_api/search_api.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/loan_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/add_tab_four_assets.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/updateanddelete_assets.dart';

import 'dart:async';

import 'package:stone_wallet_main/widgets/debounce.dart';

class InnerLoansScreen extends StatefulWidget {
  const InnerLoansScreen({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  State<InnerLoansScreen> createState() => _InnerLoansScreenState();
}

class _InnerLoansScreenState extends State<InnerLoansScreen> {
  late TextEditingController searchController = TextEditingController();

  final int _portfolio = 3;

  final _debouncer = Debouncer(milliseconds: 500);

  late List<SearchData> searchList = [];
  bool isSearchidle = true;

  late ApiService apiService;

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
    _getSearch();
    searchController.addListener(() {
      _debouncer.run(() {
        _getSearch();
      });
    });
  }

  Future<void> _getSearch() async {
    String query = searchController.text.trim();

    if (query.isEmpty) {
      // Clear on empty query
      setState(() {
        searchList = [];
        isSearchidle = true;
      });
      return;
    }

    try {
      searchList = await SearchApi().getSearchData(query, _portfolio);
    } catch (e) {
      // Error handling
    }

    setState(() {
      isSearchidle = searchList.isEmpty;
    });
  }

  void onSearchTextControlled() {
    _getSearch();
    setState(() {
      isSearchidle = searchController.text.isEmpty;
      print(isSearchidle);
    });
  }

  final loancontroller = Get.put(PortfolioControllerLoan());

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (searchController.text.isEmpty) {
      body = BuildLoanContent(
        width: widget.width,
      );
    } else {
      if (searchList.isEmpty) {
        body = Text(
          "No results found",
          style: RegularTextStyle.regular18600(whiteColor),
        );
      } else {
        body = buildSearchResults(widget.width);
      }
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.02,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(
                left: widget.width * 0.05,
                right: widget.width * 0.05,
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                style: RegularTextStyle.regular14400(whiteColor),
                decoration: InputDecoration(
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
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: hintColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: widget.width * 0.06),
                  child: Text('Loans',
                      style: RegularTextStyle.regular15600(whiteColor)),
                ),
                Container(
                    margin: EdgeInsets.only(right: widget.width * 0.02),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabFourAssets(
                                      loancontroller.loanPortfolios,
                                      _portfolio,
                                      centerTitle: 'Add New Loan',
                                    )),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: whiteColor,
                        ))),
              ],
            ),
            Divider(
              thickness: 1,
              indent: 10,
              color: Colors.black.withOpacity(0.2),
              endIndent: 10,
            ),
            // if (!isSearchidle && searchList.isNotEmpty)
            //   Visibility(
            //     visible: !isSearchidle,
            //     child: buildSearchResults(widget.width),
            //   )
            // else
            //   buildContentWidget(widget.width),
            body,
          ],
        ),
      ),
    );
  }

  Widget buildSearchResults(double width) {
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

  // FutureBuilder<List<Portfolio>> buildContentWidget(double width) {
  //   return FutureBuilder<List<Portfolio>>(
  //       future: apiService.getDataForLoan(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (snapshot.data == null || snapshot.data!.isEmpty) {
  //           return Center(
  //             child: Text(
  //               "No data",
  //               style: LargeTextStyle.large18800(whiteColor),
  //             ),
  //           );
  //         } else if (!snapshot.hasData) {
  //           return Center(
  //             child: Text(
  //               "No data",
  //               style: LargeTextStyle.large18800(whiteColor),
  //             ),
  //           );
  //         } else {
  //           final List<Portfolio> portfolios = snapshot.data!;

  //           return
  //         }
  //       });
  // }

  Widget buildSearchDetails(SearchData data, index, width) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
          
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
                              style: RegularTextStyle.regular15400(whiteColor),
                            ),
                          ),
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

class BuildLoanContent extends StatefulWidget {
  const BuildLoanContent({super.key, required this.width});
  final double width;

  @override
  State<BuildLoanContent> createState() => _BuildLoanContentState();
}

class _BuildLoanContentState extends State<BuildLoanContent> {
  List<Portfolio> dataPortfolio = [];
  int _portfolio = 3;
  late ApiService apiService;
  bool isLoading = true;
  List<Map<String, dynamic>> savedTime = [];

//   getLastSavedTime() async {
//     var time = await LocalDatabase.getSaveTime();
//     setState(() {
//       savedTime = time;
//     });
//   }

// //read data from db or fetch api
//   loanpagePortfolioData() async {
//     int count = await LocalDatabase.getPortfolioCount() ?? 0;
//     print("No of news saved ${count}");
//     int savedTimeLength = savedTime.length;
//     DateTime firstDataSavedTime = savedTimeLength >= 1
//         ? DateTime.parse(savedTime[0]["lastSavedTime"] ?? "2000-01-01")
//         : DateTime(2000);
//     print(firstDataSavedTime);

//     DateTime currentTime = DateTime.now();
//     Duration difference = currentTime.difference(firstDataSavedTime);
//     if (count == 0) {
//       var isApiFetching = await ApiService().getDataForLoan();
//       if (isApiFetching) {
//         if (kDebugMode) {
//           print('api fetching is called');
//         }
//         getLoanPortfolio();
//       }
//     } else {
//       if (kDebugMode) {
//         print('data from local called');
//       }
//       getLoanPortfolio();
//     }
//   }

//   getLoanPortfolio() async {
//     var loan = await LocalDatabase.getData();
//     setState(() {
//       dataPortfolio = loan.map((e) => Portfolio.fromJson(e)).toList();
//       isLoading = false;
//     });
//   }

  @override
  void initState() {
    // loanpagePortfolioData();
    // getLastSavedTime();
    apiService = ApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_portfolio);
    return FutureBuilder<List<Portfolio>>(
        future: apiService.getDataForLoan(),
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
                              width: widget.width * 0.05,
                            ),
                            Image.asset(
                              "assets/Dollar.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: widget.width * 0.05,
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
                                  width: widget.width * 0.05,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: Text(
                                      '${portfolios[index].quantity}  ${portfolios[index].coinShort}',
                                      style: RegularTextStyle.regular14400(
                                          whiteColor)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: Text(
                                      "\$ ${portfolios[index].value.toStringAsFixed(2)}",
                                      style: RegularTextStyle.regular14400(
                                          whiteColor)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: widget.width * 0.05,
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
}
