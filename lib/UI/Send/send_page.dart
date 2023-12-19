import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {

  late TextEditingController addressController = TextEditingController();
  late TextEditingController btcController = TextEditingController();
  late TextEditingController usdController = TextEditingController();
  late TextEditingController noteController = TextEditingController();
  bool visibility = false;

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
        backgroundColor: appBarBackgroundColor,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios,
            color: buttonColor, size: 30,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Send",
          style: LargeTextStyle.large20700(whiteColor)
      ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.add_alert,
        //       color: Color(0xff91AFDB),
        //       size: 30,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context)
        //         => const NotificationPage()),
        //       );
        //     },
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_new_wallet.png"),
                fit: BoxFit.fill,
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.02,),

              Container(
                height: 45,
                width: width * 0.95,
                padding: const EdgeInsets.only(left:15, right: 15),
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  cursorColor: cursorColor,
                  controller: addressController,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style: RegularTextStyle.regular16600(whiteColor) ,
                  decoration:  InputDecoration(
                    hintText: "Address",
                    hintStyle:  RegularTextStyle.regular16600(cursorColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 45,
                width: width * 0.95,
                padding: const EdgeInsets.only(left:15, right: 15),
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  cursorColor: cursorColor,
                  controller: btcController,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style:RegularTextStyle.regular16600(whiteColor),
                  decoration:  InputDecoration(
                    hintText: "BTC",
                    hintStyle:  RegularTextStyle.regular16600(cursorColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 45,
                width: width * 0.95,
                padding: const EdgeInsets.only(left:15, right: 15),
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  cursorColor: cursorColor,
                  controller: usdController,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style: RegularTextStyle.regular16600(whiteColor),
                  decoration:  InputDecoration(
                    hintText: "USD",
                    hintStyle:  RegularTextStyle.regular16600(cursorColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),

              Container(
                height: 45,
                width: width * 0.95,
                padding: const EdgeInsets.only(left:15, right: 15),
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  cursorColor: cursorColor,
                  controller: noteController,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style: RegularTextStyle.regular16600(whiteColor),
                  decoration:  InputDecoration(
                    hintText: "Note (optional)",
                    hintStyle: RegularTextStyle.regular16600(cursorColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Estimated fee:",
                      style: RegularTextStyle.regular16600(whiteColor)),
                    Row(
                      children: [
                        Text("0.000005032 BTC",
                          style: RegularTextStyle.regular16600(whiteColor)),
                        const SizedBox(width: 5,),
                        const Icon(Icons.arrow_forward_ios,size: 15,color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15,),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Coin control (optional)",
                      style: RegularTextStyle.regular16600(whiteColor)),
                    const Icon(Icons.arrow_forward_ios,size: 15,color: whiteColor,)                    ],
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: width*0.9,
        height: height*0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            // stops: [0.1, 0.3, 0.7, 0.9],
            colors: [
              gradientColor7,
              gradientColor8
            ],
          ),
        ),
        alignment: Alignment.center,
        child:  Text("Send",
          style: LargeTextStyle.large20700(whiteColor)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
