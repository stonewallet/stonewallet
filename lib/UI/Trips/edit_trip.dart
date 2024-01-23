import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../../API/api_provider.dart';
import '../../Responses/travel2_response.dart';
import '../../Responses/travel_list_response.dart';
import '../Constants/colors.dart';
import 'new_trip.dart';


class EditTripPage extends StatefulWidget {
  final int id;
  final String name;
  final int quantity;
  final int pricePaid;
  final int priceSold;
  final Expenses expenses;
  final String createdAt;
  final int profit;
  const EditTripPage(this.id,this.name,this.quantity, this.pricePaid, this.priceSold, this.expenses,
      this.createdAt,this.profit,{super.key});

  @override
  State<EditTripPage> createState() => _EditTripPageState();
}

class _EditTripPageState extends State<EditTripPage> {

  // List<TravelList> travelList = <TravelList>[];
  bool isSwitch = true;
  bool isLoading = false;
  late TextEditingController nameController ;

  // TextEditingController nameController = TextEditingController();
  late TextEditingController quantityController;
  late TextEditingController pricePaidController;
  late TextEditingController priceSoldController;
  late TextEditingController transportController;
  late TextEditingController hotelController;
  late TextEditingController foodController;
  late TextEditingController profitController;



  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    quantityController = TextEditingController(text: widget.quantity.toString());
    pricePaidController = TextEditingController(text: widget.pricePaid.toString());
    priceSoldController = TextEditingController(text: widget.priceSold.toString());
    transportController = TextEditingController(text: widget.expenses.transport.toString());
    hotelController = TextEditingController(text: widget.expenses.hotel.toString());
    foodController = TextEditingController(text: widget.expenses.food.toString());
    profitController = TextEditingController(text: widget.profit.toString());


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
          backgroundColor:  appBarBackgroundColor,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
          ),
          // title: const Text("Trips",  style: TextStyle(
          //     color: whiteColor, fontSize: 20, fontWeight: FontWeight.w500
          // )
          // ),
        ),        body: SingleChildScrollView(
      child:  Container(
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_new_wallet.png"),
                fit: BoxFit.fill,
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.04,),
              Container(
                width: width,
                // height: height,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        newGradient5,
                        newGradient6
                      ],
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    SizedBox(height: height*0.03,),
                    Text("Edit Trip",
                        style: LargeTextStyle.large20700(whiteColor)),
                    const SizedBox(height: 8,),
                    Container(width: width*0.15, height: 2, color:  lineColor,),
                    Container(width: width*0.9, height: 1, color:  lineColor2,),
                    SizedBox(height: height*0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // const SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Trip Name", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: nameController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Trip Quantity", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: quantityController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price Paid", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: pricePaidController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price Sold", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: priceSoldController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Transport Expenses", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: transportController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hotel Expenses", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: hotelController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Food Expenses", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: foodController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profit", style: RegularTextStyle.regular16600(Colors.white) ),
                              SizedBox(height: 6,),

                              SizedBox(
                                height: 45,
                                width: width ,
                                // padding: EdgeInsets.only(left: 15, right: 15),
                                // alignment: Alignment.center,
                                child: TextField(
                                  // autofocus: true,
                                  cursorColor: Colors.blue,
                                  controller: profitController,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: RegularTextStyle.regular16600(whiteColor) ,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    fillColor:  fillColor,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: borderColor, width: 1.0),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                  ),
                                  textInputAction: TextInputAction.next,

                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child:
                          SizedBox(
                            height: 45,
                            width: width * 0.8,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor2,
                                    surfaceTintColor: blackColor,
                                    shadowColor: whiteColor,
                                    elevation: 4
                                ),
                                onPressed: () async{
                                  print(widget.id);
                                  print(nameController.text);
                                  print(quantityController.text);
                                  print(pricePaidController.text);
                                  print(priceSoldController.text);
                                  print(transportController.text);
                                  print(hotelController.text);
                                  print(foodController.text);
                                  print(widget.createdAt);
                                  print(profitController.text);

                                  setState(() {

                                    isLoading = true;
                                  });
                                  var response = await ApiProvider().processTravelPut(
                                    widget.id, nameController.text, int.parse(quantityController.text),int.parse(pricePaidController.text),
                                      int.parse(priceSoldController.text),int.parse(transportController.text), int.parse(hotelController.text),
                                      int.parse(foodController.text), widget.createdAt, int.parse(profitController.text)
                                  );

                                  if(response.expenses != null){
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pop(context);
                                    var snackBar = SnackBar(content: Text("Trip edited successfully"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                  }else{
                                    setState(() {
                                      isLoading = false;
                                    });
                                    var snackBar = SnackBar(content: Text("Something gone wrong"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                  }




                                },
                                child: isLoading == true ? CircularProgressIndicator(color: Colors.white,) :
                                Text("Edit Trip",
                                    textAlign: TextAlign.center,
                                    style: RegularTextStyle.regular14600(whiteColor) )
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    )
    );
  }
}
