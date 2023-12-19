import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class Setup2FANext extends StatefulWidget {
  const Setup2FANext({super.key});

  @override
  State<Setup2FANext> createState() => _Setup2FANextState();
}

class _Setup2FANextState extends State<Setup2FANext> {

  bool button = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;




    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarBackgroundColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
        ),
        title:  Text("Setup 2FA",
            style: LargeTextStyle.large20700(whiteColor)
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.02,),
                  Text("Add this secret code to another device",
                    style: RegularTextStyle.regular15600(iconColor) ),
                  const SizedBox(height: 15,),

                  Image.asset("assets/images/qr_image.png",height: height * 0.4, width: width * 0.9,),

                ],
              ),
            ),
            const SizedBox(height: 15,),
            Text("TOTP Secret Code",
              style: RegularTextStyle.regular15600(iconColor)  ),
            const SizedBox(height: 10,),
            Text("WRFUY62938798IHJKWEBF8Y872639HIDUYSBIIWJN",
              style:  RegularTextStyle.regular15600(whiteColor)  ),
            const SizedBox(height: 15,),
            Text("TOTP AUTH URL",
              style:  RegularTextStyle.regular15600(iconColor) ),
            const SizedBox(height: 10,),
            Text("otpauth://totp/Stone%10Wallet:samduns:ieurbjk",
              style:  RegularTextStyle.regular15600(whiteColor) )
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor2,
              surfaceTintColor: blackColor,
              shadowColor: whiteColor,
              elevation: 4
          ),
          onPressed: () {  },
          child:  Text("Continue",
            style: LargeTextStyle.large18800(whiteColor) ,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );

  }
}
