import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart';
import 'package:stone_wallet_main/Responses/travel_list_response.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Trips/add_new_purchase.dart';
import 'package:stone_wallet_main/UI/Trips/edit_trip.dart';

import '../Constants/colors.dart';


class NewTripPage extends StatefulWidget {
  final int travelId;
  const NewTripPage(this.travelId, {super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {


  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async{
    travel2response = await ApiProvider().processTravel2(widget.travelId);
    setState(() {

    });
  }

  Travel2Response travel2response = Travel2Response();

  @override
  Widget build(BuildContext context) {
    print("travel2response ${travel2response.id}");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appBarBackgroundColor,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_new_wallet.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.04,),
                  Container(
                    width: width,
                    height: height * 0.85,
                    decoration:  const BoxDecoration(
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
                    child: travel2response.id == null ? Center(child: SizedBox(
                        width: 50,height: 50,
                        child: CircularProgressIndicator(color: whiteColor,))) : Column(
                      children: [
                        SizedBox(height: height*0.03,),
                        Text("Trip ${travel2response.name}",
                            style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(height: 8,),
                        Container(width: width*0.3, height: 2, color:  lineColor,),
                        Container(width: width*0.9, height: 1, color: lineColor2,),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>  EditTripPage(travel2response.id!, travel2response.name!, travel2response.quantity!,travel2response.pricePaid!,
                                          travel2response.priceSold!, travel2response.expenses!, travel2response.createdAt!,travel2response.profit!)),
                                    ).then((value) {
                                      return fetch();
                                    });
                                  },
                                  child: Icon(Icons.edit, color: whiteColor,)),
                              SizedBox(width: 10,),
                              InkWell(
                                  onTap: () async{
                                    var response = await ApiProvider().processTravelDelete(travel2response.id!);
                                    if(response.message != null){
                                      var snackBar = SnackBar(content: Text(response.message!));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }else{
                                      var snackBar = SnackBar(content: Text("Something went wrong"));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  },
                                  child: Icon(Icons.delete, color: whiteColor))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date",
                                      style: RegularTextStyle.regular16600(whiteColor)),
                                  Text(travel2response.createdAt!,
                                    style: RegularTextStyle.regular16600(whiteColor),)
                                ],
                              ),
                              const SizedBox(height: 15,),

                              Container(
                                padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: lineColor2)
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Name",
                                          style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text(travel2response.name!,style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Quantity", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text(travel2response.quantity!.toString(),style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price Paid", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text("\$ ${travel2response.pricePaid!.toString()}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price Sold", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text("\$ ${travel2response.priceSold!.toString()}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap:(){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context)
                                                => const AddNewPurchasePage()),
                                              );

                                            },
                                            child: Icon(Icons.add,color: whiteColor,))
                                      ],
                                    )


                                  ],
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Expenses", style: RegularTextStyle.regular18600(whiteColor)),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: lineColor2)
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Transport", style:  RegularTextStyle.regular16600(whiteColor)),
                                        Text("\$ ${travel2response.expenses!.transport!.toString()}",style:  RegularTextStyle.regular16600(whiteColor))
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Hotel", style: RegularTextStyle.regular16600(whiteColor)),
                                        Text("\$ ${travel2response.expenses!.hotel!.toString()}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Food", style:  RegularTextStyle.regular16600(whiteColor)),
                                        Text("\$ ${travel2response.expenses!.food!.toString()}",style: RegularTextStyle.regular16600(whiteColor))
                                      ],
                                    ),
                                    // const SizedBox(height: 5,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text("Maintanence", style:  RegularTextStyle.regular16600(whiteColor),),
                                    //     Text("\$50.00",style: RegularTextStyle.regular16600(whiteColor),)
                                    //   ],
                                    // ),
                                    const SizedBox(height: 5,),
                                    const Row(
                                      children: [
                                        Icon(Icons.add, color: whiteColor,),
                                        Icon(Icons.remove, color: whiteColor,)
                                      ],
                                    )

                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: lineColor2)
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Profit", style: RegularTextStyle.regular16600(whiteColor),),
                                        Text("\$ ${travel2response.profit!.toString()}",style: RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    // const SizedBox(height: 20,),

                                    const SizedBox(height: 10,)

                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 45,
                                    width: width * 0.45,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonColor2,
                                            surfaceTintColor: blackColor,
                                            shadowColor: whiteColor,
                                            elevation: 4
                                        ),
                                        onPressed: (){
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context)
                                          //   => const NewTripPage()),
                                          // );
                                        },
                                        child:  Text("Invite Trip Partner",
                                            textAlign: TextAlign.center,
                                            style: RegularTextStyle.regular16600(whiteColor)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45,
                                    width: width * 0.45,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonColor2,
                                            surfaceTintColor: blackColor,
                                            shadowColor: whiteColor,
                                            elevation: 4
                                        ),
                                        onPressed: (){
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context)
                                          //   => const NewTripPage()),
                                          // );
                                        },
                                        child:  Text("End Trip",
                                            textAlign: TextAlign.center,
                                            style: RegularTextStyle.regular16600(whiteColor)
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),

                            ],
                          ),
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
