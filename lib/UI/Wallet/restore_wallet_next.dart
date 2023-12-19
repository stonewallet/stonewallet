import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Wallet/restore_from_seed.dart';

import '../Constants/colors.dart';
import '../Constants/text_styles.dart';


class RestoreWalletNextPage extends StatefulWidget {
  const RestoreWalletNextPage({super.key});

  @override
  State<RestoreWalletNextPage> createState() => _RestoreWalletNextPageState();
}

class _RestoreWalletNextPageState extends State<RestoreWalletNextPage> {
  TextEditingController searchController = TextEditingController();



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
        title:  Text("Restore Wallet", 
            style: LargeTextStyle.large20500(whiteColor)
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),

          Center(
              child: Text("Please choose wallet currency:",
            style: RegularTextStyle.regular18600(whiteColor))),
          const SizedBox(height: 20,),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: width*0.05, right: width*0.05),
            alignment: Alignment.center,
            child: TextField(
              controller: searchController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: RegularTextStyle.regular16400(whiteColor),
              decoration:  InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: whiteColor, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: whiteColor, width: 1.0),
                ),
                hintText: 'Browse Currency',
                hintStyle: RegularTextStyle.regular16400(hintColor),
                prefixIcon: const Icon(Icons.search_rounded, color: hintColor,),
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(height: height*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width*0.45,
                height: height*0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: whiteColor,
                      blurRadius: 5.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    // stops: [0.1, 0.3, 0.7, 0.9],
                    colors: [
                      gradientColor5,
                      gradientColor6
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Icons/monero-symbol-on-white-480.png"),
                              fit: BoxFit.fill,
                            )
                        )
                    ),
                    const SizedBox(width: 20,),
                     Text("XMR\nMonero",
                      style: RegularTextStyle.regular16bold(whiteColor)
                    )
                  ],
                ),
              ),
              SizedBox(width: width*0.015,),
              Container(
                width: width*0.45,
                height: height*0.11,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Icons/Bitcoin.svg.png"),
                              fit: BoxFit.fill,
                            )
                        )
                    ),
                    const SizedBox(width: 20,),
                     Text("BTC\nBitcoin",
                      style: RegularTextStyle.regular16bold(whiteColor),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width*0.45,
                height: height*0.11,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Icons/ethereum.png"),
                              fit: BoxFit.fill,
                            )
                        )
                    ),
                    const SizedBox(width: 20,),
                     Text("ETH\nEthereum",
                      style: RegularTextStyle.regular16bold(whiteColor),
                    )
                  ],
                ),
              ),
              SizedBox(width: width*0.015,),
              Container(
                width: width*0.45,
                height: height*0.11,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Icons/tether.png"),
                              fit: BoxFit.fill,
                            )
                        )
                    ),
                    const SizedBox(width: 20,),
                     Text("USDT\nTetherUS",
                      style:RegularTextStyle.regular16bold(whiteColor),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.2,),
          InkWell(
            child: Container(
              width: width*0.45,
              height: height*0.06,
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
              child:  Text(
                "Next",
                style: LargeTextStyle.large20700(whiteColor),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)
                =>  const RestoreFromSeedPage()),
              );
            },
          )


        ],
      ),
    );
  }
}
