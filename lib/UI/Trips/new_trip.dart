import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class NewTripPage extends StatefulWidget {
  final Map travelList;
  const NewTripPage(this.travelList, {super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.04,),
                  Container(
                    width: width,
                    height: height,
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
                    child: Column(
                      children: [
                        SizedBox(height: height*0.03,),
                         Text("Trip Name",
                          style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(height: 8,),
                        Container(width: width*0.3, height: 2, color:  lineColor,),
                        Container(width: width*0.9, height: 1, color: lineColor2,),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date",
                                    style: RegularTextStyle.regular16600(whiteColor)),
                                  Text(widget.travelList["created_at"],
                                    style: RegularTextStyle.regular16600(whiteColor),)
                                ],
                              ),
                              const SizedBox(height: 15,),
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
                                        Text("Name",
                                          style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text(widget.travelList["name"],style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Quantity", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text(widget.travelList["quantity"].toString(),style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price Paid", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text("\$ ${widget.travelList["price_paid"]}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price Sold", style:  RegularTextStyle.regular16600(whiteColor),),
                                        Text("\$ ${widget.travelList["price_sold"]}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),

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
                                        Text("\$ ${widget.travelList["expenses"]["transport"]}",style:  RegularTextStyle.regular16600(whiteColor))
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Hotel", style: RegularTextStyle.regular16600(whiteColor)),
                                        Text("\$ ${widget.travelList["expenses"]["hotel"]}",style:  RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Food", style:  RegularTextStyle.regular16600(whiteColor)),
                                        Text("\$ ${widget.travelList["expenses"]["food"]}",style: RegularTextStyle.regular16600(whiteColor))
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
                                        Text("\$120.00",style: RegularTextStyle.regular16600(whiteColor),)
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    SizedBox(
                                      height: 45,
                                      width: width * 0.5,
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
                                          child:  Text("Add profit in portfolio",
                                              textAlign: TextAlign.center,
                                              style: RegularTextStyle.regular16600(whiteColor) 
                                      )
                                      ),
                                    ),
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
