import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart' as trip;
import 'package:stone_wallet_main/UI/Constants/strings.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import '../../API/api_provider.dart';
import '../Constants/colors.dart';

class AddNewPurchasePage extends StatefulWidget {
  final trip.Travel2Response travel2response;
  const AddNewPurchasePage(this.travel2response, {super.key});

  @override
  State<AddNewPurchasePage> createState() => _AddNewPurchasePageState();
}

class _AddNewPurchasePageState extends State<AddNewPurchasePage> {
  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController pricePaidController = TextEditingController();
  TextEditingController priceSoldController = TextEditingController();
  TextEditingController transportController = TextEditingController();
  TextEditingController hotelController = TextEditingController();
  TextEditingController foodController = TextEditingController();

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
                        Text("Add New Product",
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
                                  Text("Name",
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Trip Quantity",
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
                                      controller: quantityController,
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
                                  Text("Price Paid",
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
                                      controller: pricePaidController,
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
                                  Text("Price Sold",
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
                                      controller: priceSoldController,
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
                                      List<Map<String, dynamic>> list = [];
                                      List<Map<String, dynamic>> expensesList =
                                          [];
                                      final SharedPreferences sharedPref =
                                          await SharedPreferences.getInstance();
                                      final String? userName =
                                          sharedPref.getString('name');

                                      print(
                                          "name that for user${userNameController.text}");
                                      print(
                                          "nnn ${widget.travel2response.product!.length}");
                                      for (int i = 0;
                                          i <=
                                              widget.travel2response.product!
                                                      .length -
                                                  1;
                                          i++) {
                                        list.add({
                                          "product_name": widget.travel2response
                                              .product![i].productName,
                                          "quantity": widget.travel2response
                                              .product![i].quantity,
                                          "price_paid": widget.travel2response
                                              .product![i].pricePaid,
                                          "price_sold": widget.travel2response
                                              .product![i].priceSold,
                                          "user": widget
                                              .travel2response.product![i].user,
                                        });
                                      }
                                      list.add({
                                        "product_name": nameController.text,
                                        "quantity":
                                            int.parse(quantityController.text),
                                        "price_paid":
                                            int.parse(pricePaidController.text),
                                        "price_sold":
                                            int.parse(priceSoldController.text),
                                        "user": userName,
                                      });

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
                                          "user": widget.travel2response
                                              .expenses![i].user,
                                        });
                                      }

                                      Map<String, dynamic> addEvents = {
                                        "trip_name":
                                            widget.travel2response.tripName,
                                        "product": list,
                                        "expenses": expensesList,
                                        "user": widget.travel2response.user,
                                      };

                                      print(addEvents);

                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response = await ApiProvider()
                                          .processAddEvent(addEvents,
                                              widget.travel2response.id!);

                                      if (response.message != null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pop(context);
                                        var snackBar = SnackBar(
                                            content: Text(
                                                "Event created successfully"));
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
                                        : Text("Add Product",
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
