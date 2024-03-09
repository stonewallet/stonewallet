import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/Endtrip/endtrip.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import '../../API/api_provider.dart';
import '../../Responses/travel2_response.dart';
import '../Constants/colors.dart';

class EditTripPage extends StatefulWidget {
  final int id;
  final String name;
  final List<Product> product;
  final List<Expenses> expenses;
  final List<int> userid;
  final String createdAt;
  // final int profit;
  const EditTripPage(
    this.id,
    this.name,
    this.product,
    this.expenses,
    this.createdAt,
    this.userid, {
    super.key,
  });

  @override
  State<EditTripPage> createState() => _EditTripPageState();
}

class _EditTripPageState extends State<EditTripPage> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;
  late TextEditingController nameController;

  // TextEditingController nameController = TextEditingController();
  // late TextEditingController itemController;
  // late TextEditingController quantityController;
  // late TextEditingController pricePaidController;
  // late TextEditingController priceSoldController;
  late TextEditingController transportController;
  late TextEditingController hotelController;
  late TextEditingController foodController;
  List<TextEditingController> productName = [];
  List<TextEditingController> productQuantity = [];
  List<TextEditingController> productPricePaid = [];
  List<TextEditingController> productPriceSold = [];
  List<TextEditingController> expenseController = [];
  // late TextEditingController profitController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    // itemController = TextEditingController(text: widget.product.first.productName);
    // quantityController = TextEditingController(text: widget.product.first.quantity.toString());
    // pricePaidController = TextEditingController(text: widget.product.first.pricePaid.toString());
    // priceSoldController = TextEditingController(text: widget.product.first.priceSold.toString());
    // transportController = TextEditingController(text: widget.expenses.transport.toString());
    // hotelController = TextEditingController(text: widget.expenses.hotel.toString());
    // foodController = TextEditingController(text: widget.expenses.food.toString());
    // profitController = TextEditingController(text: widget.profit.toString());

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
          // title: const Text("Trips",  style: TextStyle(
          //     color: whiteColor, fontSize: 20, fontWeight: FontWeight.w500
          // )
          // ),
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
                    // height: height,
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
                        Text("Edit Trip",
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
                            // const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Trip Name",
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
                                      controller: nameController,
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
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  if (index >= productName.length) {
                                    productName.add(TextEditingController(
                                        text: widget.product[index].productName
                                            .toString()));
                                  }
                                  if (index >= productQuantity.length) {
                                    productQuantity.add(TextEditingController(
                                        text: widget.product[index].quantity
                                            .toString()));
                                  }
                                  if (index >= productPricePaid.length) {
                                    productPricePaid.add(TextEditingController(
                                        text: widget.product[index].pricePaid
                                            .toString()));
                                  }
                                  if (index >= productPriceSold.length) {
                                    productPriceSold.add(TextEditingController(
                                        text: widget.product[index].priceSold
                                            .toString()));
                                  }
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Product Name",
                                                style: RegularTextStyle
                                                    .regular16600(
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
                                                controller: productName[index],
                                                textAlign: TextAlign.start,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: RegularTextStyle
                                                    .regular16600(whiteColor),
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  fillColor: fillColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                ),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Trip Quantity",
                                                style: RegularTextStyle
                                                    .regular16600(
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
                                                controller:
                                                    productQuantity[index],
                                                textAlign: TextAlign.start,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: RegularTextStyle
                                                    .regular16600(whiteColor),
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  fillColor: fillColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                ),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Price Paid",
                                              style:
                                                  RegularTextStyle.regular16600(
                                                      Colors.white),
                                            ),
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
                                                controller:
                                                    productPricePaid[index],
                                                textAlign: TextAlign.start,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: RegularTextStyle
                                                    .regular16600(whiteColor),
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  fillColor: fillColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                ),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Price Sold",
                                                style: RegularTextStyle
                                                    .regular16600(
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
                                                controller:
                                                    productPriceSold[index],
                                                textAlign: TextAlign.start,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: RegularTextStyle
                                                    .regular16600(whiteColor),
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  fillColor: fillColor,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    borderSide: BorderSide(
                                                        color: borderColor,
                                                        width: 1.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                ),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                // separatorBuilder: (){},
                                itemCount: widget.product.length),

                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.expenses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index >= expenseController.length) {
                                    expenseController.add(TextEditingController(
                                        text: widget
                                            .expenses[index].expenseAmount
                                            .toString()));
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            widget.expenses[index].expenseName!,
                                            style:
                                                RegularTextStyle.regular16600(
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
                                            controller:
                                                expenseController[index],
                                            textAlign: TextAlign.start,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style:
                                                RegularTextStyle.regular16600(
                                                    whiteColor),
                                            decoration: const InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: borderColor,
                                                    width: 1.0),
                                              ),
                                              fillColor: fillColor,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: borderColor,
                                                    width: 1.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                            ),
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),

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
                                      setState(() {
                                        isLoading = true;
                                      });

                                      List<Map<String, dynamic>> productList =
                                          [];
                                      List<Map<String, dynamic>> expensesList =
                                          [];

                                      for (int i = 0;
                                          i <= widget.product.length - 1;
                                          i++) {
                                        productList.add({
                                          "product_name": productName[i].text,
                                          "quantity": int.parse(
                                              productQuantity[i].text),
                                          "price_paid": int.parse(
                                              productPricePaid[i].text),
                                          "price_sold": int.parse(
                                              productPriceSold[i].text)
                                        });
                                      }
                                      for (int i = 0;
                                          i <= widget.expenses.length - 1;
                                          i++) {
                                        expensesList.add({
                                          "expense_name":
                                              widget.expenses[i].expenseName,
                                          "expense_amount": int.parse(
                                              expenseController[i].text),
                                        });
                                      }

                                      Map<String, dynamic> edit = {
                                        "trip_name": nameController.text,
                                        "product": productList,
                                        "expenses": expensesList,
                                        "user": widget.userid
                                      };

                                      print(edit);
                                      ApiForEndTrip().resumeTrip(widget.id);
                                      var response = await ApiProvider().processTravelPut(
                                          widget.id, edit
                                          // widget.id, nameController.text, int.parse(quantityController.text),int.parse(pricePaidController.text),
                                          //   int.parse(priceSoldController.text),int.parse(transportController.text), int.parse(hotelController.text),
                                          //   int.parse(foodController.text), widget.createdAt
                                          );

                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pop(context);
                                        var snackBar = SnackBar(
                                            content: Text(response.message!));
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
                                        : Text("Edit Trip",
                                            textAlign: TextAlign.center,
                                            style:
                                                RegularTextStyle.regular14600(
                                                    whiteColor))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
