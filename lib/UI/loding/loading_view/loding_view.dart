import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/loding/controller/controller.dart';
import 'package:stone_wallet_main/UI/splash/controller/splash_controller.dart';

class LoadingView extends GetView<SplashController> {
  final LoadingController splashController = Get.put(LoadingController());
  LoadingView({Key? key}) : super(key: key);

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
              Lottie.asset(
                'assets/Animation - 1709118889865.json',
                height: MediaQuery.sizeOf(context).height / 3.5,
                animate: true,
                backgroundLoading: true,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Your wallet is being created,',
                style: RegularTextStyle.regular18600(whiteColor),
              ),
              Text(
                'please be patient.',
                style: RegularTextStyle.regular18600(whiteColor),
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
