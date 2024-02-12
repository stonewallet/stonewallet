import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart'
    as port;
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';

class AddAssetsDetail extends StatefulWidget {
  final RxList<port.Portfolio> portfolio;
  final int _portfolio;
  final String centerTitle;
  const AddAssetsDetail(this.portfolio, this._portfolio,
      {super.key, required this.centerTitle});

  @override
  State<AddAssetsDetail> createState() => AddAssetsDetailState();
}

class AddAssetsDetailState extends State<AddAssetsDetail> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController assestNameController = TextEditingController();
  TextEditingController assestAmountController = TextEditingController();

  final controller = Get.put(PortfolioController());

  final assetscontroller = Get.put(PortfolioController2());

  final cashcontroller = Get.put(PortfolioController3());
  List<dynamic> searchList = [];

  final focus = FocusNode();

  bool isSearchidle = true;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getSearch();
    searchController.addListener(onSearchTextControlled);
  }

  _getSearch() async {
    try {
      final response = await Dio().get(
        searchPortfolio,
        queryParameters: {'search': searchController.text.trim()},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      Map<String, dynamic> data = response.data as Map<String, dynamic>;

      if (searchController.text.isEmpty) {
        setState(() {
          searchList = data.entries
              .map((entry) => '${entry.key} - ${entry.value}')
              .toList();
        });
      } else {
        setState(() {
          searchList = data.entries
              .where((entry) =>
                  entry.key
                      .toString()
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()) ||
                  entry.value
                      .toString()
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
              .map((entry) => '${entry.key}: ${entry.value}')
              .toList();
        });
      }
    } catch (error) {
      print('Error fetching suggestions: $error');
      // Handle error
    }
  }

  void onSearchTextControlled() {
    _getSearch();
    setState(() {
      isSearchidle = searchController.text.isEmpty;
      print(isSearchidle);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget._portfolio);

    Widget searchChild(x) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          child: Text(x, style: RegularTextStyle.regular16600(whiteColor)),
        );
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appBarBackgroundColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
          ),
        ),
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
                    height: height * 0.04,
                  ),
                  Container(
                    width: width,
                    height: height,
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
                        Text(widget.centerTitle,
                            style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: width * 0.4,
                          height: 2,
                          color: lineColor,
                        ),
                        Container(
                          width: width * 0.9,
                          height: 1,
                          color: lineColor2,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 30,),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Assets Name",
                                      style: RegularTextStyle.regular16600(
                                          Colors.white)),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  // SizedBox(
                                  //   height: 45,
                                  //   width: width,
                                  //   // padding: EdgeInsets.only(left: 15, right: 15),
                                  //   // alignment: Alignment.center,
                                  //   child: TextField(
                                  //     // autofocus: true,
                                  //     cursorColor: Colors.blue,
                                  //     controller: assestNameController,
                                  //     textAlign: TextAlign.start,
                                  //     textAlignVertical:
                                  //         TextAlignVertical.center,
                                  //     style: RegularTextStyle.regular16600(
                                  //         whiteColor),
                                  //     decoration: const InputDecoration(
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(30)),
                                  //         borderSide: BorderSide(
                                  //             color: borderColor, width: 1.0),
                                  //       ),
                                  //       fillColor: fillColor,
                                  //       filled: true,
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(30)),
                                  //         borderSide: BorderSide(
                                  //             color: borderColor, width: 1.0),
                                  //       ),
                                  //       contentPadding:
                                  //           EdgeInsets.only(left: 20),
                                  //     ),
                                  //     textInputAction: TextInputAction.next,
                                  //   ),
                                  // ),
                                  SearchField(
                                    controller: assestNameController,
                                    suggestionDirection:
                                        SuggestionDirection.flex,
                                    onSearchTextChanged: (query) {
                                      final filter = searchList
                                          .where((element) => element
                                              .toLowerCase()
                                              .contains(query.toLowerCase()))
                                          .toList();
                                      return filter
                                          .map((e) =>
                                              SearchFieldListItem<String>(e,
                                                  child: searchChild(e)))
                                          .toList();
                                    },
                                    onTap: () {},
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    // validator: (value) {
                                    //   if (value == null ||
                                    //       !searchList.contains(value.trim())) {
                                    //     return 'Enter a valid name';
                                    //   }
                                    //   return null;
                                    // },
                                    key: const Key('searchfield'),
                                    itemHeight: 50,
                                    scrollbarDecoration: ScrollbarDecoration(),
                                    onTapOutside: (x) {
                                      focus.unfocus();
                                    },
                                    suggestionStyle:
                                        RegularTextStyle.regular16600(
                                            whiteColor),
                                    searchStyle: RegularTextStyle.regular16600(
                                        whiteColor),
                                    searchInputDecoration: InputDecoration(
                                      hintStyle: RegularTextStyle.regular16600(
                                          whiteColor),
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
                                      fillColor: fillColor,
                                      filled: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                    ),
                                    suggestionsDecoration: SuggestionDecoration(
                                      color: blackColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    suggestions: searchList
                                        .map((e) => SearchFieldListItem<String>(
                                              e,
                                              child: searchChild(e),
                                            ))
                                        .toList(),
                                    focusNode: focus,
                                    suggestionState: Suggestion.expand,
                                    onSuggestionTap:
                                        (SearchFieldListItem<String>? x) {
                                      if (x != null) {
                                        final suggestionText = x.searchKey;

                                        final parts = suggestionText.split('-');

                                        final key = parts[0].trim();
                                        final value = parts[1].trim();
                                        assestNameController.text = key;
                                        assestAmountController.text = value;
                                      }
                                      focus.unfocus();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Assets Amount",
                                      style: RegularTextStyle.regular16600(
                                          Colors.white)),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    width: width,
                                    // padding: EdgeInsets.only(left: 15, right: 15),
                                    // alignment: Alignment.center,
                                    child: TextField(
                                      // autofocus: true,
                                      cursorColor: Colors.blue,
                                      controller: assestAmountController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: RegularTextStyle.regular16600(
                                          whiteColor),
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        fillColor: fillColor,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: SizedBox(
                                height: 45,
                                width: width * 0.8,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: buttonColor2,
                                        surfaceTintColor: blackColor,
                                        shadowColor: whiteColor,
                                        elevation: 4),
                                    onPressed: () async {
                                      // List <Map<String, dynamic>> productList = [];

                                      // List<Map<String, dynamic>> expensesList =
                                      // [];
                                      // for (int i = 0;
                                      //     i <=
                                      //         widget.assetsPortfolio.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name": widget
                                      //         .assetsPortfolio[i].coinName,
                                      //     "quantity": widget
                                      //         .assetsPortfolio[i].quantity,
                                      //     "sub_cat":
                                      //         widget.assetsPortfolio[i].subCat,
                                      //   });
                                      // }
                                      // for (int i = 0;
                                      //     i <= widget.cashPortfolio.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name":
                                      //         widget.cashPortfolio[i].coinName,
                                      //     "quantity":
                                      //         widget.cashPortfolio[i].quantity,
                                      //     "sub_cat":
                                      //         widget.cashPortfolio[i].subCat,
                                      //   });
                                      // }
                                      // for (int i = 0;
                                      //     i <= widget.portfolio.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name":
                                      //         widget.portfolio[i].coinName,
                                      //     "quantity":
                                      //         widget.portfolio[i].quantity,
                                      //     "sub_cat": widget.portfolio[i].subCat,
                                      //   });
                                      // }

                                      // expensesList.add({
                                      //   "coin_name": assestNameController.text,
                                      //   "quantity": double.parse(
                                      //       assestAmountController.text),
                                      //   "sub_cat": widget._portfolio,
                                      // });

                                      setState(() {
                                        isLoading = true;
                                      });

                                      // Call the API service to add the asset
                                      // await ApiServiceForADDAssets().addAsset(
                                      //   expensesList
                                      // );
                                      print(widget._portfolio);
                                      final amount = double.parse(
                                          assestAmountController.text);
                                      final lastamount =
                                          amount.toStringAsFixed(3);
                                      var response =
                                          await ApiServiceForADDAssets()
                                              .addAsset(
                                        assestNameController.text,
                                        double.parse(lastamount),
                                        widget._portfolio,
                                      );

                                      controller.update();
                                      assetscontroller.update();
                                      cashcontroller.update();
                                      // Handle each emitted response here
                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Get.back();
                                        Get.snackbar(
                                          "Assets created successfully",
                                          '',
                                          backgroundColor: newGradient6,
                                          colorText: whiteColor,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 0, 0),
                                          duration: const Duration(
                                              milliseconds: 4000),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      } else {
                                        // Handle errors that occur during stream processing

                                        setState(() {
                                          isLoading = false;
                                        });
                                        var snackBar = const SnackBar(
                                            content:
                                                Text("Something gone wrong"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        // if (response.message != null) {

                                        //   // var snackBar = SnackBar(
                                        //   //     content: Text(
                                        //   //         "Assets created successfully"));
                                        //   // ScaffoldMessenger.of(context)
                                        //   //     .showSnackBar(snackBar);
                                        // } else {
                                      }
                                    },
                                    child: isLoading == true
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text("Add Assets",
                                            textAlign: TextAlign.center,
                                            style:
                                                RegularTextStyle.regular14600(
                                                    whiteColor))),
                              ),
                            )
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
