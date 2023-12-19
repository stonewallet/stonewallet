import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Constants/colors.dart';
import '../Constants/text_styles.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {

  late TextEditingController btcController = TextEditingController();

  String? data;

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
        title:  Text("Receive",
          style: LargeTextStyle.large20700(whiteColor),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.share,
              color: buttonColor,
              size: 30,
            ),
            onPressed: () {

            },
          )
        ],
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Tap to open full screen QR code",
                style: RegularTextStyle.regular18600(whiteColor) ),
              const SizedBox(height: 20,),
              QrImageView(
                size: 200,
                backgroundColor: whiteColor,
                  data: data.toString(),
              ),
              const SizedBox(height: 20,),
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
                  style: const TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                  decoration:  InputDecoration(
                    hintText: "BTC:",
                    hintStyle: RegularTextStyle.regular16600(cursorColor),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: cursorColor),
                    ),
                  ),
                  onChanged: (val) => setState(() => data = val),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: width * 0.9,
                  child:  Text(
                    "jhbrfu3yfgbjl2bal98ejbreuybjueygruebkjvkjh9289b23980",
                    style: RegularTextStyle.regular18600(whiteColor),
                    textAlign: TextAlign.center,
                  )
              ),
              SizedBox(height: height* 0.15,),

              SizedBox(
                  width: width * 0.9,
                  child:  Text(
                    "We generate new addresses each time you use one, but previous addresses continue to work",
                    style: RegularTextStyle.regular16600(cursorColor),
                    textAlign: TextAlign.center,
                  )
              ),


            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: const Color(0xff121b27),
      //   elevation: 0,
      //   child:   SizedBox(
      //       width: width * 0.9,
      //       child: const Text(
      //         "We generate new addresses each time you use one, but previous addresses continue to work",
      //         style: TextStyle(color: cursorColor, fontSize: 16),
      //         textAlign: TextAlign.center,
      //       )
      //   ),
      // ),
    );
  }
}
