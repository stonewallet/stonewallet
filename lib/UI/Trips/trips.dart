import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:stone_wallet_main/Responses/travel_list_response.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Trips/trips_next.dart';

import '../../API/api_provider.dart';
import '../Constants/colors.dart';
import 'create_new_trip.dart';
import 'edit_trip.dart';
import 'new_trip.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;

  @override
  void initState() {
    // ApiProvider().processLogin();
    fetch();
    super.initState();
  }

  fetch() async {
    travelList.clear();
    travelList = await ApiProvider().processTravel();
    setState(() {});
    if (kDebugMode) {
      print("travelList $travelList");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                            Text("Trips",
                                style: LargeTextStyle.large20700(whiteColor)),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: width * 0.15,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                travelList.isEmpty
                                    ? const CircularProgressIndicator(
                                        color: whiteColor,
                                      )
                                    : SizedBox(
                                        height: 400,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            itemCount: travelList.length,
                                            itemBuilder: (c, i) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 55,
                                                        width: width * 0.70,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    buttonColor2,
                                                                surfaceTintColor:
                                                                    blackColor,
                                                                shadowColor:
                                                                    whiteColor,
                                                                elevation: 4),
                                                            onPressed: () {
                                                              int id =
                                                                  travelList[i]
                                                                      .id;
                                                              if (kDebugMode) {
                                                                print(id);
                                                              }
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        NewTripPage(
                                                                            id)),
                                                              ).then((value) {
                                                                return fetch();
                                                              });
                                                            },
                                                            child: Text(
                                                                travelList[i]
                                                                    .tripName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: LargeTextStyle
                                                                    .large20700(
                                                                        whiteColor))),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => EditTripPage(
                                                                          travelList[i]
                                                                              .id,
                                                                          travelList[i]
                                                                              .tripName,
                                                                          travelList[i]
                                                                              .product,
                                                                          travelList[i]
                                                                              .expenses,
                                                                          travelList[i]
                                                                              .createdAt
                                                                              .toString())),
                                                                ).then((value) {
                                                                  return fetch();
                                                                });
                                                              },
                                                              child: const Icon(
                                                                Icons.edit,
                                                                color:
                                                                    whiteColor,
                                                              )),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          InkWell(
                                                              onTap: () async {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Text(
                                                                        'Delete',
                                                                        style: RegularTextStyle.regular14600(
                                                                            blackColor),
                                                                      ),
                                                                      content:
                                                                          Text(
                                                                        'Are you sure you want to Delete?',
                                                                        style: RegularTextStyle.regular14600(
                                                                            blackColor),
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Cancel',
                                                                            style:
                                                                                RegularTextStyle.regular14600(blackColor),
                                                                          ),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () async {
                                                                            var response =
                                                                                await ApiProvider().processTravelDelete(travelList[i].id);

                                                                            if (response.message !=
                                                                                null) {
                                                                              Get.back();
                                                                              Get.snackbar(
                                                                                "Assets deleted successfully",
                                                                                '',
                                                                                backgroundColor: newGradient6,
                                                                                colorText: whiteColor,
                                                                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                                                                duration: const Duration(milliseconds: 4000),
                                                                                snackPosition: SnackPosition.BOTTOM,
                                                                              );
                                                                              // var snackBar = SnackBar(
                                                                              //     content: Text(
                                                                              //         "Assets created successfully"));
                                                                              // ScaffoldMessenger.of(context)
                                                                              //     .showSnackBar(snackBar);
                                                                            } else {
                                                                              Get.snackbar(
                                                                                "Something gone wrong",
                                                                                '',
                                                                                backgroundColor: newGradient6,
                                                                                colorText: whiteColor,
                                                                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                                                                duration: const Duration(milliseconds: 4000),
                                                                                snackPosition: SnackPosition.BOTTOM,
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Delete',
                                                                            style:
                                                                                RegularTextStyle.regular14600(dotColor),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                // var response = await ApiProvider().processTravelDelete(travelList[i].id);
                                                                // if(response.message != null){
                                                                //   var snackBar = SnackBar(content: Text(response.message!));
                                                                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                                // }else{
                                                                //   var snackBar = SnackBar(content: Text("Something went wrong"));
                                                                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                                // }
                                                              },
                                                              child: const Icon(
                                                                Icons.delete,
                                                                size: 30,
                                                                color: redColor,
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 55,
                                        width: width * 0.7,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor2,
                                                surfaceTintColor: blackColor,
                                                shadowColor: whiteColor,
                                                elevation: 4),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CreateNewTripPage()),
                                              ).then((value) {
                                                return fetch();
                                              });
                                            },
                                            child: Text("Create new trip",
                                                textAlign: TextAlign.center,
                                                style: RegularTextStyle
                                                    .regular14600(whiteColor))),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ]));
  }
}
