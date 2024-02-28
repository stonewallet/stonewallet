import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/splash/controller/splash_controller.dart';
import 'package:stone_wallet_main/widgets/customspinkit_widget.dart';

class SplashView extends GetView<SplashController> {
  final SplashController splashController = Get.put(SplashController());
  SplashView({Key? key}) : super(key: key);

  
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
                height: height * 0.3,
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
                height: height * 0.06,
              ),
              const CustomSpinKitFadingCube(
                color: whiteColor,
                size: 30,
              )
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
          ),
        ),
        Positioned(
          top: height * 0.05,
          left: width * 0.3,
          child: Image.asset(
            "assets/Icons/btc.png",
            height: 40,
            width: 40,
          ),
        ),
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
            top: height * 0.60,
            left: width * 0.1,
            child: Transform(
                transform: Matrix4.rotationZ(51),
                child: Image.asset(
                  "assets/Icons/eth.png",
                  height: 35,
                  width: 25,
                ))),
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
            top: height * 0.73,
            left: width * 0.25,
            child: Transform(
                transform: Matrix4.rotationZ(150),
                child: Image.asset(
                  "assets/Icons/monero.png",
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
            top: height * 0.7,
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
        Positioned(
            top: height * 0.65,
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
