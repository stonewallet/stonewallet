import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Home/home_page.dart';

import 'Constants/colors.dart';
import 'Constants/text_styles.dart';
import 'Create New Wallet/create_new_wallet.dart';

class WelcomePage extends StatefulWidget {
  // const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration:    const BoxDecoration(
            // color: Colors.amber,
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              // stops: [0.1, 0.3, 0.7, 0.9],
              colors: [
                gradientColor1,
                gradientColor2
              ],
            ),
          ),
          child:
          Column(
            children: [
              SizedBox(height: height * 0.2,),
              Image.asset("assets/images/welcome_logo.png",height: 110,width: 120,fit: BoxFit.fill,),

               Text("Welcome To \nSTONE WALLET",
                style: NasalTextStyle.nasal(whiteColor),textAlign:TextAlign.center,
              ),

              SizedBox(height: height * 0.13,),

              // Container(
              //   height: 50,
              //   width: 200,
              //   decoration:  BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //       gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         // stops: [0.6,0.85],
              //         colors: [Color(0xff152131), Color(0xff2a4267),],
              //         // tileMode: TileMode.repeated,
              //       ),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Colors.indigo,
              //       //     blurRadius: 4.0,
              //       //     spreadRadius: 4.0,
              //       //     offset: Offset(
              //       //       0.0,
              //       //       0.0,
              //       //     ),
              //       //   ),
              //       // ]
              //   ),
              //   child:
              //   Text("Login",
              //       textAlign:TextAlign.center),
              // ),
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
                        => const CreateNewWalletPage()),
                      );
                    },
                    child:  Text("+ Create a New Wallet",
                        textAlign: TextAlign.center,
                        style: LargeTextStyle.large20700(whiteColor)
                    )
                ),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                height: 65,
                width: width * 0.75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:  buttonColor3,
                        surfaceTintColor: blackColor,
                      shadowColor: whiteColor,
                      elevation: 4
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)
                        => const BottomNavigationPage()),
                      );
                    },
                    child:  Text("Login to Existing Wallet",
                        textAlign: TextAlign.center,
                        style: LargeTextStyle.large20700(textColor)

              )
                ),
              ),
              const SizedBox(height: 10,),
               Text("Please select below to Create or login to your wallet",
                style: LightTextStyle.light13300(whiteColor)
              )
            ],
          ),
        )
    );
  }
}
