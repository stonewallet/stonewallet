import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart' as trip;
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Trips/trips.dart';
import '../../API/api_provider.dart';
import '../../Responses/travel_list_response.dart';
import '../Constants/colors.dart';

class AddNewExpensePage extends StatefulWidget {
  final trip.Travel2Response travel2response;
  const AddNewExpensePage(this.travel2response, {super.key});

  @override
  State<AddNewExpensePage> createState() => _AddNewExpensePageState();
}

class _AddNewExpensePageState extends State<AddNewExpensePage> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();

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
                        Text("Add New Expense",
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
                                  Text("Expense Name",
                                      style: RegularTextStyle.regular16600(
                                          Colors.white)),
                                  SizedBox(
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
                                      controller: expenseNameController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: RegularTextStyle.regular16600(
                                          whiteColor),
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        fillColor: fillColor,
                                        filled: true,
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.only(left: 20),
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
                                  Text("Expense Amount",
                                      style: RegularTextStyle.regular16600(
                                          Colors.white)),
                                  SizedBox(
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
                                      controller: expenseAmountController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: RegularTextStyle.regular16600(
                                          whiteColor),
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        fillColor: fillColor,
                                        filled: true,
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              color: borderColor, width: 1.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.only(left: 20),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
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
                                      List<Map<String, dynamic>> productList =
                                          [];
                                      List<Map<String, dynamic>> expensesList =
                                          [];

                                      print(
                                          "nnn ${widget.travel2response.product!.length}");
                                      for (int i = 0;
                                          i <=
                                              widget.travel2response.product!
                                                      .length -
                                                  1;
                                          i++) {
                                        productList.add({
                                          "product_name": widget.travel2response
                                              .product![i].productName,
                                          "quantity": widget.travel2response
                                              .product![i].quantity,
                                          "price_paid": widget.travel2response
                                              .product![i].pricePaid,
                                          "price_sold": widget.travel2response
                                              .product![i].priceSold
                                        });
                                      }
                                      for (int i = 0;
                                          i <=
                                              widget.travel2response.expenses!
                                                      .length -
                                                  1;
                                          i++) {
                                        expensesList.add({
                                          "expense_name": widget.travel2response
                                              .expenses![i].expenseName,
                                          "expense_amount": widget
                                              .travel2response
                                              .expenses![i]
                                              .expenseAmount,
                                        });
                                      }

                                      expensesList.add({
                                        "expense_name":
                                            expenseNameController.text,
                                        "expense_amount": int.parse(
                                            expenseAmountController.text),
                                      });

                                      Map<String, dynamic> addExpense = {
                                        "trip_name":
                                            widget.travel2response.tripName,
                                        "product": productList,
                                        "expenses": expensesList,
                                        "user": widget.travel2response.user,
                                      };

                                      print(addExpense);

                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response = await ApiProvider()
                                          .processAddEvent(addExpense,
                                              widget.travel2response.id!);

                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pop(context);
                                        var snackBar = SnackBar(
                                            content: Text(
                                                "Expense created successfully"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        var snackBar = SnackBar(
                                            content:
                                                Text("Something gone wrong"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    child: isLoading == true
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text("Add Expense",
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
