import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/API/portfolio_api/api_services.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart'
    as port;
import 'package:stone_wallet_main/UI/portfolio/controller/assets_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/cash_controller.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';

class ADDTabThreeCash extends StatefulWidget {
  final RxList<port.Portfolio> portfolio;
  final int _portfolio;
  final String centerTitle;
  const ADDTabThreeCash(this.portfolio, this._portfolio,
      {super.key, required this.centerTitle});

  @override
  State<ADDTabThreeCash> createState() => ADDTabThreeCashState();
}

class ADDTabThreeCashState extends State<ADDTabThreeCash> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController assestNameController = TextEditingController();
  TextEditingController assestAmountController = TextEditingController();

  final cashcontroller = Get.put(PortfolioController3());
  final controller = Get.put(PortfolioController2());

  final cryptocontroller = Get.put(PortfolioController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget._portfolio);
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
                                  SizedBox(
                                    height: 45,
                                    width: width,
                                    // padding: EdgeInsets.only(left: 15, right: 15),
                                    // alignment: Alignment.center,
                                    child: TextField(
                                      // autofocus: true,
                                      cursorColor: Colors.blue,
                                      controller: assestNameController,
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
                                      ApiService().removeCachedData("Get_Cash");
                                      //  List <Map<String, dynamic>> productList = [];

                                      // List<Map<String, dynamic>> expensesList =
                                      //     [];

                                      // for (int i = 0;
                                      //     i <=
                                      //         widget.assetsportfolio.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name": widget
                                      //         .assetsportfolio[i].coinName,
                                      //     "quantity": widget
                                      //         .assetsportfolio[i].quantity,
                                      //     "sub_cat":
                                      //         widget.assetsportfolio[i].subCat,
                                      //   });
                                      // }
                                      // for (int i = 0;
                                      //     i <= widget.cashportfolio.length - 1;
                                      //     i++) {
                                      //   expensesList.add({
                                      //     "coin_name":
                                      //         widget.cashportfolio[i].coinName,
                                      //     "quantity":
                                      //         widget.cashportfolio[i].quantity,
                                      //     "sub_cat":
                                      //         widget.cashportfolio[i].subCat,
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
                                      var response =
                                          await ApiServiceForADDAssets()
                                              .addAsset(
                                        assestNameController.text,
                                        double.parse(
                                            assestAmountController.text),
                                        widget._portfolio,
                                      );

                                      cryptocontroller.update();
                                      controller.update();
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
                                        cashcontroller.update();
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
