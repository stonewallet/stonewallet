import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/API/portfolio_api/search_api.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/trip_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/add_tab_four_assets.dart';
import 'package:stone_wallet_main/UI/portfolio/widgets/updateanddelete_assets.dart';
import 'package:stone_wallet_main/widgets/debounce.dart';

class InnerTripTabScreenFour extends StatefulWidget {
  const InnerTripTabScreenFour({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  State<InnerTripTabScreenFour> createState() => _InnerTripTabScreenFourState();
}

class _InnerTripTabScreenFourState extends State<InnerTripTabScreenFour> {
  late TextEditingController searchController = TextEditingController();

  int _portfolio = 4;

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

  final tripcontroller = Get.put(PortfolioControllerTrip());

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (searchController.text.isEmpty) {
      body = buildContentWidget(widget.width);
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
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(left: widget.width * 0.06),
            //       child: Text('Trip',
            //           style: RegularTextStyle.regular15600(whiteColor)),
            //     ),
            //     // Container(
            //     //     margin: EdgeInsets.only(right: widget.width * 0.02),
            //     //     child: TextButton(
            //     //         onPressed: () {
            //     //           Navigator.push(
            //     //             context,
            //     //             MaterialPageRoute(
            //     //                 builder: (context) => TabFourAssets(
            //     //                       tripcontroller.tripPortfolios,
            //     //                       _portfolio,
            //     //                       centerTitle: 'Add New Trip',
            //     //                     )),
            //     //           );
            //     //         },
            //     //         child: const Icon(
            //     //           Icons.add,
            //     //           color: whiteColor,
            //     //         ))),
            //   ],
            // ),
            Divider(
              thickness: 1,
              indent: 10,
              color: Colors.black.withOpacity(0.2),
              endIndent: 10,
            ),
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

  FutureBuilder<List<Portfolio>> buildContentWidget(double width) {
    return FutureBuilder<List<Portfolio>>(
        future: apiService.getDataForTrip(),
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
                                      const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: Text(
                                    'Profit / Loss',
                                    style: RegularTextStyle.regular15600(
                                        whiteColor),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: Text(
                                    "\$ ${portfolios[index].value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: portfolios[index].value < 0
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
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
