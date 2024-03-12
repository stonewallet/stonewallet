import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';

class InviteUserTripScreen extends StatefulWidget {
  final String centerTitle;
  const InviteUserTripScreen({super.key, required this.centerTitle});

  @override
  State<InviteUserTripScreen> createState() => InviteUserTripScreenState();
}

class InviteUserTripScreenState extends State<InviteUserTripScreen> {
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
        dropdownasset,
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
                                  RichText(
                                      text: TextSpan(
                                          text: "User Name",
                                          children: [
                                            TextSpan(
                                                text: '  *',
                                                style: RegularTextStyle
                                                    .regular18600(redColor))
                                          ],
                                          style: RegularTextStyle.regular16600(
                                              Colors.white))),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
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

                            const SizedBox(
                              height: 120,
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
                                      setState(() {
                                        isLoading = true;
                                      });

                                      // final amount = double.parse(
                                      //     assestAmountController.text);
                                      // final lastamount =
                                      //     amount.toStringAsFixed(3);
                                      // var response =
                                      //     await ApiServiceForADDAssets()
                                      //         .addAsset(
                                      //   assestNameController.text,
                                      //   double.parse(lastamount),
                                      //   widget._portfolio,
                                      // );

                                      // controller.update();
                                      // assetscontroller.update();
                                      // cashcontroller.update();
                                      // // Handle each emitted response here
                                      // if (response.message != null) {
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   Get.back();
                                      //   Get.snackbar(
                                      //     "Assets created successfully",
                                      //     '',
                                      //     backgroundColor: newGradient6,
                                      //     colorText: whiteColor,
                                      //     padding: const EdgeInsets.fromLTRB(
                                      //         20, 5, 0, 0),
                                      //     duration: const Duration(
                                      //         milliseconds: 4000),
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //   );
                                      // } else {
                                      //   // Handle errors that occur during stream processing

                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   var snackBar = const SnackBar(
                                      //       content:
                                      //           Text("Something gone wrong"));
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(snackBar);

                                      // }
                                    },
                                    child: isLoading == true
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text("Send Invitations",
                                            textAlign: TextAlign.center,
                                            style:
                                                RegularTextStyle.regular15600(
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
