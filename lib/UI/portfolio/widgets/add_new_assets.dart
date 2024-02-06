import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart'
    as port;

class AddAssetsDetail extends StatefulWidget {
  final RxList<port.Portfolio> portfolio;
  const AddAssetsDetail(this.portfolio, {super.key});

  @override
  State<AddAssetsDetail> createState() => AddAssetsDetailState();
}

class AddAssetsDetailState extends State<AddAssetsDetail> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController assestNameController = TextEditingController();
  TextEditingController assestAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                        Text("Add New Assets",
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
                                      // List <Map<String, dynamic>> productList = [];
                                      List<Map<String, dynamic>> expensesList =[];

                                      // print("nnn ${widget.travel2response.product!.length}" );
                                      // for(int i = 0; i<= widget.travel2response.product!.length -1; i++){
                                      //   productList.add(
                                      //       {
                                      //         "product_name" :  widget.travel2response.product![i].productName,
                                      //         "quantity" : widget.travel2response.product![i].quantity,
                                      //         "price_paid" : widget.travel2response.product![i].pricePaid,
                                      //         "price_sold" : widget.travel2response.product![i].priceSold
                                      //       });
                                      // }

                                      // Add existing assets from portfolio to expensesList
                                      // Add existing assets from portfolio to expensesList
                                      for (int i = 0;
                                          i <= widget.portfolio.length - 1;
                                          i++) {
                                        expensesList.add({
                                          "coin_name":
                                              widget.portfolio[i].coinName,
                                          "quantity":
                                              widget.portfolio[i].quantity,
                                        });
                                      }

                                      // Add new asset to expensesList
                                      expensesList.add({
                                        "coin_name": assestNameController.text,
                                        "quantity": int.parse(
                                            assestAmountController.text),
                                      });

                                      setState(() {
                                        isLoading = true;
                                      });

                                      // Call the API service to add the asset
                                      await ApiServiceForADDAssets().addAsset(
                                        assestNameController.text,
                                        double.parse(
                                            assestAmountController.text),
                                      );
                                      // var response = await ApiServiceForADDAssets().addAsset(addExpense, widget.travel2response.id!);

                                      // if(response.message != null){
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   Navigator.pop(context);
                                      //   var snackBar = SnackBar(content: Text("Expense created successfully"));
                                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      // }else{
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   var snackBar = SnackBar(content: Text("Something gone wrong"));
                                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      // }
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
