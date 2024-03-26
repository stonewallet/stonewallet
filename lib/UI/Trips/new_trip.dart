import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/Endtrip/endtrip.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/API/pdf/getpdf.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart' as trip;
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/Getpdf/getpdf_model.dart';
import 'package:stone_wallet_main/UI/Trips/add_new_expense.dart';
import 'package:stone_wallet_main/UI/Trips/add_new_purchase.dart';
import 'package:stone_wallet_main/UI/Trips/provider/new_trip_provider.dart';
import 'package:stone_wallet_main/UI/Trips/widgets/invite_trip.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/colors.dart';
import 'edit_trip.dart';

class NewTripPage extends StatefulWidget {
  final int travelId;
  const NewTripPage(this.travelId, {super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  // List<Product> events = [];
  // List<Map<String, dynamic>> newData = [];
  // int totalQuantity = 0;
  // List numbers = [];

  late ApiForGetPdf apiForGetPdf;

  @override
  void initState() {
    fetch();
    getDownloadsDirectory();
    super.initState();
    apiForGetPdf = ApiForGetPdf();
  }

  String? userName;
  fetch() async {
    final provider = Provider.of<NewTripProvider>(context, listen: false);
    trip.Travel2Response travel2response =
        await ApiProvider().processTravel2(widget.travelId);

    provider.setTravelData(travel2response);
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    userName = sharedPref.getString('name');
  }

  // trip.Travel2Response travel2response = trip.Travel2Response();

  Color hexToColor(String hexColor) {
    return Color(int.parse('0xFF$hexColor'));
  }

  String? hexColor;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewTripProvider>(context);
    if (kDebugMode) {
      print("travel2response ${provider.travel2response.id}");
      print(provider.numbers);
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<DataColumn> getColumns() {
      return provider.newData.isNotEmpty
          ? provider.newData.first.keys
              .map((String key) => DataColumn(
                    label: SizedBox(
                        width: 75,
                        child: Center(
                            child: Text(key,
                                style: RegularTextStyle.regular14600(
                                    whiteColor)))),
                  ))
              .toList()
          : [];
    }

    print("totalQuantity ${provider.totalQuantity}");
    List<DataRow> getRows() {
      return provider.newData.map((Map<String, dynamic> rowData) {
        return DataRow(
          cells: rowData.keys.map((String key) {
            return DataCell(
              SizedBox(
                  width: 75,
                  child: Center(
                      child: Text(
                    rowData[key].toString(),
                    style: RegularTextStyle.regular14600(whiteColor),
                  ))),
            );
          }).toList(),
        );
      }).toList();
    }

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
              child:
                  Consumer<NewTripProvider>(builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      width: width,
                      height: height * 0.85,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [newGradient5, newGradient6],
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: value.travel2response.id == null
                          ? const Center(
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: whiteColor,
                                  )))
                          : Column(
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text("Trip ${value.travel2response.tripName}",
                                    style:
                                        LargeTextStyle.large20700(whiteColor)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: width * 0.3,
                                  height: 2,
                                  color: lineColor,
                                ),
                                Container(
                                  width: width * 0.9,
                                  height: 1,
                                  color: lineColor2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditTripPage(
                                                        value.travel2response
                                                            .id!,
                                                        value.travel2response
                                                            .tripName!,
                                                        value.travel2response
                                                            .product!,
                                                        value.travel2response
                                                            .expenses!,
                                                        value.travel2response
                                                            .createdAt!,
                                                        value.travel2response
                                                            .user!,
                                                        value.travel2response
                                                            .userOrder!,
                                                      )),
                                            ).then((value) => fetch());
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: whiteColor,
                                            size: 30,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            _showDeleteConfirmationDialog(
                                                context, value);

                                            if (kDebugMode) {
                                              print(value.travel2response.id!);
                                            }
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: redColor,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Date",
                                              style:
                                                  RegularTextStyle.regular16600(
                                                      whiteColor)),
                                          Text(
                                            value.travel2response.createdAt!,
                                            style:
                                                RegularTextStyle.regular16600(
                                                    whiteColor),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Quantity",
                                              style:
                                                  RegularTextStyle.regular16600(
                                                      whiteColor)),
                                          Text(
                                            value.totalQuantity.toString(),
                                            style:
                                                RegularTextStyle.regular16600(
                                                    whiteColor),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        height: 150,
                                        child: ListView(
                                          // padding: EdgeInsets.symmetric(horizontal: 10),
                                          // physics:,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            DataTable(
                                              headingRowHeight: 30,
                                              dataRowMaxHeight: double
                                                  .infinity, // Code to be changed.
                                              dataRowMinHeight: 30,
                                              columnSpacing: 5,
                                              border: TableBorder.all(
                                                  color: lineColor2,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              columns: value.newData.isNotEmpty
                                                  ? (value.newData.first.keys
                                                      .map((String key) {
                                                      if (key ==
                                                          'Colour Code') {
                                                        return const DataColumn(
                                                            label: SizedBox());
                                                      }
                                                      return DataColumn(
                                                        label: SizedBox(
                                                          width: 75,
                                                          child: Center(
                                                            child: Text(
                                                              key,
                                                              style: RegularTextStyle
                                                                  .regular14600(
                                                                      whiteColor),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList())
                                                  : [],

                                              rows: value.newData.map(
                                                  (Map<String, dynamic>
                                                      rowData) {
                                                return DataRow(
                                                  cells: rowData.keys
                                                      .map((String key) {
                                                    String hexColor = '';
                                                    rowData
                                                        .forEach((key, value) {
                                                      if (key ==
                                                          'Colour Code') {
                                                        hexColor =
                                                            value.toString();
                                                      }
                                                    });

                                                    Color color =
                                                        hexToColor(hexColor);
                                                    if (key == 'Colour Code') {
                                                      return const DataCell(
                                                          SizedBox.shrink());
                                                    }
                                                    return DataCell(
                                                      SizedBox(
                                                        width: 75,
                                                        child: Center(
                                                          child: Text(
                                                            rowData[key]
                                                                .toString(),
                                                            style:
                                                                RegularTextStyle
                                                                    .regular14600(
                                                                        color),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddNewPurchasePage(value
                                                              .travel2response)),
                                                ).then((value) => fetch());
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: whiteColor,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Expenses",
                                              style:
                                                  RegularTextStyle.regular18600(
                                                      whiteColor)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: lineColor2)),
                                            child: ListView.builder(
                                              itemCount: value.travel2response
                                                  .expenses!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                hexColor = value
                                                    .travel2response
                                                    .expenses![index]
                                                    .colourCode!;
                                                Color color =
                                                    hexToColor(hexColor!);
                                                return Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            value
                                                                .travel2response
                                                                .expenses![
                                                                    index]
                                                                .expenseName!,
                                                            style: TextStyle(
                                                                color: color)),
                                                        Text(
                                                            "\$ ${value.travel2response.expenses![index].expenseAmount!.toString()}",
                                                            style: RegularTextStyle
                                                                .regular16600(
                                                                    whiteColor))
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddNewExpensePage(
                                                                    value
                                                                        .travel2response)),
                                                      ).then(
                                                          (value) => fetch());
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: whiteColor,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                // InkWell(
                                                //     onTap: () {
                                                //       Navigator.push(
                                                //         context,
                                                //         MaterialPageRoute(
                                                //             builder: (context) =>
                                                //                 DeleteExpensePage(
                                                //                     travel2response)),
                                                //       ).then((value) {
                                                //         return fetch();
                                                //       });
                                                //     },
                                                //     child: const Icon(
                                                //       Icons.remove,
                                                //       color: whiteColor,
                                                //     )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: lineColor2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Profit",
                                              style:
                                                  RegularTextStyle.regular16600(
                                                      whiteColor),
                                            ),
                                            Text(
                                              "\$ ${value.travel2response.profit!.toString()}",
                                              style:
                                                  RegularTextStyle.regular16600(
                                                      whiteColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 45,
                                            // width: width * 0.35,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        buttonColor2,
                                                    surfaceTintColor:
                                                        blackColor,
                                                    shadowColor: whiteColor,
                                                    elevation: 4),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InviteUserTripScreen(
                                                              centerTitle:
                                                                  'Invite User',
                                                              tripName: value
                                                                  .travel2response
                                                                  .tripName!,
                                                              iD: value
                                                                  .travel2response
                                                                  .id!,
                                                            )),
                                                  );
                                                },
                                                child: Text(
                                                    "Invite Trip\nPartner",
                                                    textAlign: TextAlign.center,
                                                    style: RegularTextStyle
                                                        .regular16400(
                                                            whiteColor))),
                                          ),
                                          SizedBox(
                                            height: 45,
                                            // width: width * 0.35,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        buttonColor2,
                                                    surfaceTintColor:
                                                        blackColor,
                                                    shadowColor: whiteColor,
                                                    elevation: 4),
                                                onPressed: () async {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(builder: (context)
                                                  //   => const NewTripPage()),
                                                  // );
                                                  var response =
                                                      await ApiForEndTrip()
                                                          .endTrip(value
                                                              .travel2response
                                                              .id!);

                                                  if (response.message !=
                                                      null) {
                                                    Get.back();
                                                    Get.snackbar(
                                                      " Ended successfully",
                                                      '',
                                                      backgroundColor:
                                                          newGradient6,
                                                      colorText: whiteColor,
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20, 5, 0, 0),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
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
                                                      backgroundColor:
                                                          newGradient6,
                                                      colorText: whiteColor,
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20, 5, 0, 0),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                    );
                                                  }
                                                },
                                                child: Text("End Trip",
                                                    textAlign: TextAlign.center,
                                                    style: RegularTextStyle
                                                        .regular16600(
                                                            whiteColor))),
                                          ),
                                          SizedBox(
                                            height: 45,
                                            // width: width * 0.35,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        buttonColor2,
                                                    surfaceTintColor:
                                                        blackColor,
                                                    shadowColor: whiteColor,
                                                    elevation: 4),
                                                onPressed: () async {
                                                  GetPdf? pdfUrl =
                                                      await apiForGetPdf
                                                          .fetchPdfData(
                                                              widget.travelId);
                                                  final permissionStatus =
                                                      await requestStoragePermission();

                                                  final dir =
                                                      await getDownloadDirectorypath();
                                                  if ((permissionStatus[
                                                          Permission.storage] ==
                                                      PermissionStatus
                                                          .granted)) {
                                                    if (dir != null) {
                                                      String savename =
                                                          "${value.travel2response.tripName}.pdf";
                                                      String savePath =
                                                          "$dir/$savename";
                                                      print(savePath);
                                                      //output:  /storage/emulated/0/Download/banner.png

                                                      try {
                                                        await Dio().download(
                                                            "$baseUrl${pdfUrl.url}",
                                                            savePath,
                                                            onReceiveProgress:
                                                                (received,
                                                                    total) {
                                                          if (received != -1) {
                                                            print(
                                                                "${(received / total * 100).toStringAsFixed(0)}%");

                                                            //you can build progressbar feature too
                                                          }
                                                        });
                                                        print(
                                                            "File is saved to download folder.");

                                                        Get.snackbar(
                                                          "File Downloaded",
                                                          '',
                                                          backgroundColor:
                                                              newGradient6,
                                                          colorText: whiteColor,
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  20, 5, 0, 0),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                        );
                                                        if (Platform
                                                            .isAndroid) {
                                                          OpenFile.open(
                                                              savePath);
                                                        } else if (Platform
                                                            .isIOS) {
                                                          await launchUrl(
                                                              Uri.file(
                                                                  savePath));
                                                        }
                                                      } on DioException catch (e) {
                                                        print(e.message);
                                                      }
                                                    }
                                                  } else {
                                                    if (kDebugMode) {
                                                      print(
                                                          "No permission to read and write.");
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            "Permission Denied !"),
                                                      ));
                                                    }
                                                  }
                                                },
                                                child: Text("Export",
                                                    textAlign: TextAlign.center,
                                                    style: RegularTextStyle
                                                        .regular16600(
                                                            whiteColor))),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              })),
        ));
  }

  Future<String?> getDownloadDirectorypath() async {
    if (Platform.isAndroid) {
      return (await DownloadsPathProvider.downloadsDirectory)?.path;
    } else if (Platform.isIOS) {
      return (await getApplicationDocumentsDirectory()).path;
    } else {
      return null;
    }
  }

  Future<Map<Permission, PermissionStatus>> requestStoragePermission() async {
    return await [
      Permission.storage,
    ].request();
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, NewTripProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete',
            style: RegularTextStyle.regular14600(blackColor),
          ),
          content: Text(
            'Are you sure you want to Delete?',
            style: RegularTextStyle.regular14600(blackColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: RegularTextStyle.regular14600(blackColor),
              ),
            ),
            TextButton(
              onPressed: () async {
                // var response = await ApiServiceForADDAssets().delete(
                //   expenseController[0].text,
                //   double.parse(expenseController[1].text),
                //   int.parse(expenseController[2].text),
                // );
                // controller.update();
                // cashcontroller.update();
                // assetscontroller.update();
                // if (response.message != null) {
                //   setState(() {
                //     isLoading = false;
                //   });
                //   Get.back();
                //   Get.snackbar(
                //     "Assets deleted successfully",
                //     '',
                //     backgroundColor: newGradient6,
                //     colorText: whiteColor,
                //     padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                //     duration: const Duration(milliseconds: 4000),
                //     snackPosition: SnackPosition.BOTTOM,
                //   );
                //   // var snackBar = SnackBar(
                //   //     content: Text(
                //   //         "Assets created successfully"));
                //   // ScaffoldMessenger.of(context)
                //   //     .showSnackBar(snackBar);
                // } else {
                //   setState(() {
                //     isLoading = false;
                //   });
                //   Get.snackbar(
                //     "Something gone wrong",
                //     '',
                //     backgroundColor: newGradient6,
                //     colorText: whiteColor,
                //     padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                //     duration: const Duration(milliseconds: 4000),
                //     snackPosition: SnackPosition.BOTTOM,
                //   );
                // }
                var response = await ApiProvider()
                    .processTravelDelete(provider.travel2response.id!);

                if (response.message != null) {
                  Get.back();
                  var snackBar = SnackBar(content: Text(response.message!));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  var snackBar =
                      SnackBar(content: Text("Something went wrong"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
                style: RegularTextStyle.regular14600(dotColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
