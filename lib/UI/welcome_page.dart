import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/login/createwallet_login.dart';

import 'Constants/colors.dart';
import 'Constants/text_styles.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

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
        body: Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientColor1, gradientColor2],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Image.asset(
                "assets/images/welcome_logo.png",
                height: 110,
                width: 120,
                fit: BoxFit.fill,
              ),
              Text(
                "Welcome To \nSTONE WALLET",
                style: NasalTextStyle.nasal(whiteColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              SizedBox(
                height: 65,
                width: width * 0.75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor2,
                        surfaceTintColor: blackColor,
                        shadowColor: whiteColor,
                        elevation: 4),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewWalletLoginPage()),
                      );
                    },
                    child: Text("+ Create a New Wallet",
                        textAlign: TextAlign.center,
                        style: LargeTextStyle.large20700(whiteColor))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 65,
                width: width * 0.75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor3,
                        surfaceTintColor: blackColor,
                        shadowColor: whiteColor,
                        elevation: 4),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context)
                      //   => const BottomNavigationPage()),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text("Login to Existing Wallet",
                        textAlign: TextAlign.center,
                        style: LargeTextStyle.large20700(textColor))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Please select below to Create or login to your wallet",
                  style: LightTextStyle.light13300(whiteColor))
            ],
          ),
        ),
        Positioned(
            top: height * 0.14,
            left: width * 0.55,
            child: Image.asset(
              "assets/Icons/eth.png",
              height: 25,
              width: 25,
            )),
        Positioned(
            top: height * 0.05,
            left: width * 0.3,
            child: Image.asset(
              "assets/Icons/btc.png",
              height: 40,
              width: 40,
            )),
        Positioned(
            top: height * 0.25,
            left: width * 0.8,
            child: Transform(
                transform: Matrix4.rotationZ(
                  -3.1415926535897932 / 3,
                ),
                child: Image.asset(
                  "assets/Icons/btc.png",
                  height: 34,
                  width: 34,
                ))),
        Positioned(
            top: height * 0.22,
            left: width * 0.07,
            child: Image.asset(
              "assets/Icons/iitc.png",
              height: 35,
              width: 35,
            )),
        Positioned(
            top: height * 0.1,
            left: width * 0.8,
            child: Image.asset(
              "assets/Icons/monero.png",
              height: 35,
              width: 35,
            )),
        Positioned(
            top: height * 0.8,
            left: width * 0.1,
            child: Transform(
                transform: Matrix4.rotationZ(51),
                child: Image.asset(
                  "assets/Icons/eth.png",
                  height: 35,
                  width: 25,
                ))),
        Positioned(
            top: height * 0.93,
            left: width * 0.25,
            child: Transform(
                transform: Matrix4.rotationZ(30),
                child: Image.asset(
                  "assets/Icons/monero.png",
                  height: 35,
                  width: 35,
                ))),
        Positioned(
            top: height * 0.8,
            left: width * 0.5,
            child: Transform(
                transform: Matrix4.rotationZ(51),
                child: Image.asset(
                  "assets/Icons/iitc.png",
                  height: 35,
                  width: 35,
                ))),
        Positioned(
            top: height * 0.9,
            left: width * 0.6,
            child: Transform(
                transform: Matrix4.rotationZ(100),
                child: Image.asset(
                  "assets/Icons/iitc.png",
                  height: 25,
                  width: 25,
                ))),
        Positioned(
            top: height * 0.85,
            left: width * 0.8,
            child: Transform(
                transform: Matrix4.rotationZ(50),
                child: Image.asset(
                  "assets/Icons/btc.png",
                  height: 40,
                  width: 40,
                ))),
      ],
    ));
  }
}
