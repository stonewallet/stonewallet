import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Send/receive.dart';

import '../Constants/colors.dart';
import '../Model/coin_model.dart';
import '../Send/send_page.dart';

class MyWalletBalancePage extends StatefulWidget {
  const MyWalletBalancePage({super.key});

  @override
  State<MyWalletBalancePage> createState() => _MyWalletBalancePageState();
}

class _MyWalletBalancePageState extends State<MyWalletBalancePage> {

  bool selectCoins = true;
  TextEditingController searchController = TextEditingController();
  List<CoinModel> coins = [
    CoinModel(name: "XMR", type: "Monero", icon: "assets/Icons/monero-symbol-on-white-480.png", amount: "4 XMR", usdAmount: "\$789.60"),
    CoinModel(name: "BTC", type: "Bitcoin", icon: "assets/Icons/Bitcoin.svg.png", amount: "0.1245 BTC", usdAmount: "\$10,504"),
    CoinModel(name: "ETH", type: "Ethereum", icon: "assets/Icons/ethereum.png", amount: "1 ETH", usdAmount: "\$4879.6"),
    CoinModel(name: "USDT", type: "TetherUS", icon: "assets/Icons/tether.png", amount: "60 USDT", usdAmount: "\$60.60"),
    CoinModel(name: "XRP", type: "Ripple", icon: "assets/Icons/ripple.png", amount: "1000 XRP", usdAmount: "\$1240")
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.02,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Wallet',
                    textAlign: TextAlign.center,
                    style: RegularTextStyle.regular15600(termsColor)
                  ),
                  const Icon(Icons.arrow_drop_down, color: termsColor,)
                ],
              ),
              SizedBox(height: height*0.02,),
               Text(
                'Balance',
                textAlign: TextAlign.center,
                style: RegularTextStyle.regular15600(whiteColor)
              ),
              SizedBox(height: height*0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor4,
                          shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20)
                        ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)
                              => const ReceivePage()),
                            );
                          },
                          child: Image.asset("assets/Icons/download.png",width: 25,height: 25,color: whiteColor)
                      ),
                      const SizedBox(height: 5,),
                       Text("Receive",
                        style: RegularTextStyle.regular15600(whiteColor))
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:  buttonColor4,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)
                              => const SendPage()),
                            );
                          },
                          child: Image.asset("assets/Icons/upload.png",width: 25,height: 25,color: whiteColor,)
                      ),
                      const SizedBox(height: 5,),
                       Text("Send",
                         style: RegularTextStyle.regular15600(whiteColor))
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6, height: 6,
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    width: 6, height: 6,
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                width: width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      // begin: Alignment(0.00, -1.00),
                      // end: Alignment(0, 1),
                      colors: [
                        newGradient5,
                        newGradient6
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    SizedBox(height: height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                               Text("Coins",
                                style: RegularTextStyle.regular15600(whiteColor)
                               ),
                              const SizedBox(height: 3,),
                              selectCoins ? Container(
                                width: width*0.2, height: 3,
                                color:  lineColor,
                              ) : Container()
                            ],
                          ),
                          onTap: (){
                            setState(() {
                              selectCoins = true;
                            });
                          },
                        ),
                        SizedBox(width: width*0.2,),
                        GestureDetector(
                          child: Column(
                            children: [
                               Text("Transactions",
                                style:RegularTextStyle.regular15600(whiteColor)),
                              const SizedBox(height: 3,),
                              !selectCoins? Container(
                                width: width*0.2, height: 3,
                                color: lineColor,
                              ) : Container()
                            ],
                          ),
                          onTap: (){
                            setState(() {
                              selectCoins = false;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: width*0.9, height: 1,
                      color:  lineColor2,
                    ),
                    SizedBox(height: height*0.02,),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: width*0.05, right: width*0.05),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: searchController,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        style: RegularTextStyle.regular14600(whiteColor),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: textfieldColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: textfieldColor, width: 1.0),
                          ),
                          filled: true,
                          fillColor: textfieldColor,
                          prefixIcon: Icon(Icons.search_rounded, color: hintColor,),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                   selectCoins == true ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: width*0.06),
                              child:  Text(
                                'Name',
                                style: RegularTextStyle.regular15600(whiteColor)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: width*0.06),
                              child:  Text(
                                'Holdings',
                                style:RegularTextStyle.regular15600(whiteColor)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          child: ListView.builder(

                            key: UniqueKey(),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.transparent,
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: width*0.05,),
                                        SizedBox(
                                          width: 40, height: 40,
                                          child: Image.asset(coins[index].icon,),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text("${coins[index].name}\n${coins[index].type}",
                                          style: RegularTextStyle.regular15600(whiteColor)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text("${coins[index].amount}",
                                              style: RegularTextStyle.regular15600(whiteColor)),
                                            Text("${coins[index].usdAmount}",
                                              style: RegularTextStyle.regular15600(greenAccentColor)),
                                          ],
                                        ),
                                        SizedBox(width: width*0.05,)
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: coins.length,
                          ),
                        )
                      ],
                    ) : Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: width*0.06),
                             child:  Text(
                               'Name',
                               style: RegularTextStyle.regular15600(whiteColor)
                             ),
                           ),
                           Container(
                             margin: EdgeInsets.only(right: width*0.06),
                             child:  Text(
                               'Amount',
                               style: RegularTextStyle.regular15600(whiteColor)
                             ),
                           ),
                         ],
                       ),
                       const SizedBox(height: 10,),
                       SizedBox(
                         height: height*0.4,
                         child: ListView.builder(
                           key: UniqueKey(),
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (BuildContext context, int index) {
                             return Container(
                               margin: const EdgeInsets.only(bottom: 15),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       SizedBox(width: width*0.05,),
                                       Text("${coins[index].name}  (${coins[index].type})",
                                         style: RegularTextStyle.regular15600(whiteColor)),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Column(
                                         children: [
                                           Text(coins[index].amount, style: RegularTextStyle.regular15600(whiteColor)),
                                         ],
                                       ),
                                       SizedBox(width: width*0.05,)
                                     ],
                                   )
                                 ],
                               ),
                             );
                           },
                           itemCount: 2,
                         ),
                       )
                     ],
                   ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
