import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/createNotification/createnotification.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/InviteUser/inviteusermodel.dart';

class InviteUserTripScreen extends StatefulWidget {
  final String centerTitle;
  final String tripName;
  final int iD;
  const InviteUserTripScreen(
      {super.key,
      required this.centerTitle,
      required this.tripName,
      required this.iD});

  @override
  State<InviteUserTripScreen> createState() => InviteUserTripScreenState();
}

class InviteUserTripScreenState extends State<InviteUserTripScreen> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  List<dynamic> searchList = [];

  final focus = FocusNode();

  bool isSearchidle = true;
  TextEditingController searchController = TextEditingController();
  late ApiServiceForCreateNotification apiServiceForCreateNotification;
  late int selectedUserId;
  late String selectedUserName;
  @override
  void initState() {
    super.initState();
    _getSearch();
    apiServiceForCreateNotification = ApiServiceForCreateNotification();
    searchController.addListener(onSearchTextControlled);
  }

  _getSearch() async {
    try {
      final response = await Dio().get(
        iniviteGetUser,
        queryParameters: {'search': searchController.text.trim()},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        List<InviteUserModel> searchContent = [];
        for (var searchData in data) {
          if (searchData is Map<String, dynamic> &&
              searchData.containsKey('username')) {
            InviteUserModel user = InviteUserModel.fromJson(searchData);
            searchContent.add(user);
          }
        }

        setState(() {
          searchList = searchContent;
        });
      }

      // List<dynamic> data =
      //     response.data; // Change here to extract the list directly

      // setState(() {
      //   // Update the searchList directly with the fetched data
      //   searchList = data;
      // });
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
                                    controller: searchController,
                                    suggestionDirection:
                                        SuggestionDirection.flex,
                                    onSearchTextChanged: (query) {
                                      final filter = searchList
                                          .where((element) => element.username
                                              .toLowerCase()
                                              .contains(query.toLowerCase()))
                                          .toList();
                                      return filter
                                          .map((e) =>
                                              SearchFieldListItem<String>(
                                                  e.username,
                                                  child:
                                                      searchChild(e.username)))
                                          .toList();
                                    },
                                    onTap: () {},
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                              horizontal: 20),
                                    ),
                                    suggestionsDecoration: SuggestionDecoration(
                                      color: blackColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    suggestions: searchList
                                        .map((e) => SearchFieldListItem<String>(
                                            e.username,
                                            child: searchChild(e.username)))
                                        .toList(),
                                    focusNode: focus,
                                    suggestionState: Suggestion.expand,
                                    onSuggestionTap:
                                        (SearchFieldListItem<String>? x) {
                                      if (x != null) {
                                        final suggestionText = x.searchKey;
                                        searchController.text = suggestionText;
                                        selectedUserName = suggestionText;
                                        selectedUserId = searchList
                                            .firstWhere((element) =>
                                                element.username ==
                                                suggestionText)
                                            .id;
                                        if (kDebugMode) {
                                          print(
                                              "input - :${searchController.text} get user: $selectedUserName get id :$selectedUserId");
                                        }
                                      }
                                      focus.unfocus();
                                    },
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height / 2,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: SizedBox(
                                height: 45,
                                width: width * 0.6,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 176, 231, 235),
                                        surfaceTintColor: blackColor,
                                        shadowColor: whiteColor,
                                        elevation: 2),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      var response =
                                          await apiServiceForCreateNotification
                                              .createNotofication(
                                        userId: selectedUserId.toString(),
                                        userName: selectedUserName,
                                        tripName: widget.tripName,
                                        tripId: widget.iD.toString(),
                                      );

                                      // Handle each emitted response here
                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Get.back();
                                        Get.snackbar(
                                          "Invitation Send successfully",
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
                                        setState(() {
                                          isLoading = false;
                                        });
                                        var snackBar = const SnackBar(
                                            content:
                                                Text("Something gone wrong"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    child: isLoading == true
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text("Send Invitations",
                                            textAlign: TextAlign.center,
                                            style:
                                                RegularTextStyle.regular16bold(
                                                    buttonColor3))),
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
