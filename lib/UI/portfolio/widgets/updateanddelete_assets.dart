import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart'
    as port;
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/loan_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/trip_controller.dart';

class UpdateAssetsScreen extends StatefulWidget {
  final int index;
  final port.Portfolio portfolios;
  final SearchData? searchData;

  // final List<port.Portfolio> cashportfolios;
  // final List<port.Portfolio> assetsportfolios;
  const UpdateAssetsScreen({
    super.key,
    required this.index,
    required this.portfolios,
    this.searchData,
  });

  @override
  State<UpdateAssetsScreen> createState() => UpdateAssetsScreenState();
}

class UpdateAssetsScreenState extends State<UpdateAssetsScreen> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController assestNameController = TextEditingController();
  TextEditingController assestAmountController = TextEditingController();
  List<TextEditingController> expenseController = [];

  final controller = Get.put(PortfolioController());
  final cashcontroller = Get.put(PortfolioController3());
  final assetscontroller = Get.put(PortfolioController2());

  final loancontroller = Get.put(PortfolioControllerLoan());
  final tripcontroller = Get.put(PortfolioControllerTrip());

  @override
  void initState() {
    super.initState();

    // Initialize expenseController with enough elements
    for (int i = 0; i < 500; i++) {
      expenseController.add(TextEditingController());
    }

    // if (widget.index < widget.portfolios.length) {
    //   print(widget.portfolios[widget.index].quantity);
    //   print(widget.portfolios[widget.index].coinName);
    //   print(widget.index);
    // }

    final selectedPortfolio = widget.portfolios;
    assestNameController.text = selectedPortfolio.coinName;
    assestAmountController.text = selectedPortfolio.quantity.toString();
    expenseController[0].text = selectedPortfolio.coinName;
    expenseController[1].text = selectedPortfolio.quantity.toString();
    expenseController[2].text = selectedPortfolio.subCat.toString();

    print(selectedPortfolio.quantity);
    // print(widget.portfolios[widget.index].quantity);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.index);
    print(widget.portfolios);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            Text("Update",
                                style: LargeTextStyle.large20700(whiteColor)),
                            IconButton(
                              onPressed: () async {
                                // widget.portfolios.removeAt(widget.index);
                                // print(widget.portfolios);

                                // for (int i = 0;
                                //     i <= widget.assetsportfolios.length - 1;
                                //     i++) {
                                //   expensesList.add({
                                //     "coin_name":
                                //         widget.assetsportfolios[i].coinName,
                                //     "quantity":
                                //         widget.assetsportfolios[i].quantity,
                                //     "sub_cat":
                                //         widget.assetsportfolios[i].subCat,
                                //   });
                                // }
                                // for (int i = 0;
                                //     i <= widget.cashportfolios.length - 1;
                                //     i++) {
                                //   expensesList.add({
                                //     "coin_name":
                                //         widget.cashportfolios[i].coinName,
                                //     "quantity":
                                //         widget.cashportfolios[i].quantity,
                                //     "sub_cat": widget.cashportfolios[i].subCat,
                                //   });
                                // }

                                // for (int i = 0;
                                //     i <= widget.portfolios.length - 1;
                                //     i++) {
                                //   expensesList.add({
                                //     "coin_name": widget.portfolios[i].coinName,
                                //     "quantity": widget.portfolios[i].quantity,
                                //     "sub_cat": widget.portfolios[i].subCat,
                                //   });
                                // }
                                _showDeleteConfirmationDialog(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.delete,
                                color: dotColor,
                              ),
                            )
                          ],
                        ),
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
                                  SizedBox(
                                    height: 45,
                                    width: width,
                                    // padding: EdgeInsets.only(left: 15, right: 15),
                                    // alignment: Alignment.center,
                                    child: TextField(
                                      // autofocus: true,
                                      cursorColor: Colors.blue,
                                      controller: expenseController[0],
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
                                      controller: expenseController[1],

                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
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
                                      // // List <Map<String, dynamic>> productList = [];
                                      // List<Map<String, dynamic>> expensesList =
                                      //     [];

                                      // for (int i = 0;
                                      //     i <= widget.portfolios.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name":
                                      //         widget.portfolios[i].coinName,
                                      //     "quantity":
                                      //         widget.portfolios[i].quantity,
                                      //   });
                                      // }

                                      // // // Add new asset to expensesList
                                      // // expensesList.add({
                                      // //   "coin_name": expenseController[0].text,
                                      // //   "quantity": double.parse(
                                      // //       expenseController[1].text),
                                      // // });

                                      // setState(() {
                                      //   isLoading = true;
                                      // });

                                      // if (widget.index != -1) {
                                      //   expensesList[widget.index]
                                      //           ['coin_name'] =
                                      //       expenseController[0].text;
                                      //   expensesList[widget.index]['quantity'] =
                                      //       double.parse(
                                      //           expenseController[1].text);
                                      // } else {
                                      //   expensesList.add({
                                      //     "coin_name":
                                      //         expenseController[0].text,
                                      //     "quantity": double.parse(
                                      //         expenseController[1].text),
                                      //   });
                                      // }

                                      var response =
                                          await ApiServiceForADDAssets().update(
                                        expenseController[0].text,
                                        double.parse(expenseController[1].text),
                                        int.parse(expenseController[2].text),
                                      );
                                      controller.update();
                                      assetscontroller.update();
                                      cashcontroller.update();
                                      loancontroller.update();
                                      tripcontroller.update();
                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Get.back();
                                        Get.snackbar(
                                          "Assets updated successfully",
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
                                        : Text("Update",
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

  void _showDeleteConfirmationDialog(BuildContext context) {
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
                var response = await ApiServiceForADDAssets().delete(
                  expenseController[0].text,
                  double.parse(expenseController[1].text),
                  int.parse(expenseController[2].text),
                );
                controller.update();
                cashcontroller.update();
                assetscontroller.update();
                loancontroller.update();
                tripcontroller.update();
                if (response.message != null) {
                  setState(() {
                    isLoading = false;
                  });
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
                  setState(() {
                    isLoading = false;
                  });
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
