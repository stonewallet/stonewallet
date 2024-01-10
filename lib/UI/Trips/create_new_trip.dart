import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../../API/api_provider.dart';
import '../../Responses/travel_list_response.dart';
import '../Constants/colors.dart';
import 'new_trip.dart';


class CreateNewTripPage extends StatefulWidget {
  const CreateNewTripPage({super.key});

  @override
  State<CreateNewTripPage> createState() => _CreateNewTripPageState();
}

class _CreateNewTripPageState extends State<CreateNewTripPage> {

  List<TravelList> travelList = <TravelList>[];
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
                height: height,
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
                    Text("Create New Trip",
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
                                  print(nameController.text);
                                  print(quantityController.text);
                                  print(pricePaidController.text);
                                  print(priceSoldController.text);
                                  print(transportController.text);
                                  print(hotelController.text);
                                  print(foodController.text);
                                  setState(() {

                                  isLoading = true;
                                  });
                                 var response = await ApiProvider().processPostTravel(
                                      nameController.text, int.parse(quantityController.text),int.parse(pricePaidController.text),
                                      int.parse(priceSoldController.text),int.parse(transportController.text), int.parse(hotelController.text),
                                    int.parse(foodController.text)
                                  );

                                  if(response.message == "Trip created successfully"){
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pop(context);
                                    var snackBar = SnackBar(content: Text(response.message!));
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
                                Text("Add Trip",
                                    textAlign: TextAlign.center,
                                    style: RegularTextStyle.regular14600(whiteColor) )
                            ),
                          ),
                        )
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
