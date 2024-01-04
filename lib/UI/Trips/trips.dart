import 'package:flutter/material.dart';
import 'package:stone_wallet_main/Responses/travel_list_response.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Trips/trips_next.dart';

import '../../API/api_provider.dart';
import '../Constants/colors.dart';


class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {



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
                          colors: [newGradient5,
                            newGradient6],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.03,),
                         Text("Trips",
                          style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(height: 8,),
                        Container(width: width*0.15, height: 2, color:  lineColor,),
                        Container(width: width*0.9, height: 1, color:  lineColor2,),
                        SizedBox(height: height*0.1,),
                        Column(
                          children: [
                            SizedBox(height: height*0.03,),
                            CircleAvatar(
                              backgroundColor:  iconColor,
                              radius: 80,
                                child: Image.asset(
                                  "assets/Icons/plane.png",
                                  color:   bottomBackgroundColor,
                                  width: 80,
                                    height: 80,
                                )
                            ),
                            const SizedBox(height: 30,),

                            SizedBox(
                              height: 65,
                              width: width * 0.75,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor2,
                                      surfaceTintColor: blackColor,
                                      shadowColor: whiteColor,
                                      elevation: 4
                                  ),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      => const TripsNextPage()),
                                    );
                                  },
                                  child:  Text("Verified to be a trip member",
                                      textAlign: TextAlign.center,
                                      style: LargeTextStyle.large20700(whiteColor))
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
