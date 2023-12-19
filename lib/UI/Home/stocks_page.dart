import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';
import '../Model/stocks_model.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({super.key});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {

  bool selectCoins = true;
  TextEditingController searchController = TextEditingController();
  List<StocksModel> stocks = [
    StocksModel(name: "XMR", description: "Monero", image: "assets/Icons/Group79.png", amount: "34,396.63", add_minus_amount: "+135.21"),
    StocksModel(name: "BTC", description: "Bitcoin", image: "assets/Icons/Group78.png", amount: "4,478.52", add_minus_amount: "+39.25"),
    StocksModel(name: "ETH", description: "Ethereum", image: "assets/Icons/Group77.png", amount: "34,396.63", add_minus_amount: "+135.21"),
    StocksModel(name: "USDT", description: "TetherUS", image: "assets/Icons/Group76.png", amount: "111.24", add_minus_amount: "-1.21"),
    StocksModel(name: "XRP", description: "Ripple", image: "assets/Icons/Group74.png", amount: "108.08", add_minus_amount: "+0.02"),
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
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Coins',
                        textAlign: TextAlign.center,
                        style: RegularTextStyle.regular15700(termsColor)
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    height: 2, width: width*0.2,
                    color:  lineColor,
                  ),
                  Container(
                    height: 1, width: width*0.9,
                    color:  lineColor2,
                  ),
                  SizedBox(height: height*0.04,),
                  Container(
                    height: height*0.8,
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            newGradient5,
                            newGradient6],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.02,),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: width*0.05, right: width*0.05),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: searchController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            style: RegularTextStyle.regular14400(whiteColor),
                            decoration:  InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: textfieldColor, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: textfieldColor, width: 1.0),
                              ),
                              hintText: "Coins",
                              hintStyle: RegularTextStyle.regular15400(whiteColor),
                              filled: true,
                              fillColor: textfieldColor,
                              prefixIcon: const Icon(Icons.search_rounded, color: hintColor,),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Column(
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
                                    'Sep 26',
                                    style: RegularTextStyle.regular15600(whiteColor)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: width*0.05,),
                                          const SizedBox(width: 10,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(stocks[index].name,
                                                style: RegularTextStyle.regular15600(whiteColor)),
                                              Text(stocks[index].description,
                                                style: LightTextStyle.light12300(whiteColor),),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: width*0.15, height: 60,
                                        child: Image.asset(stocks[index].image,),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(stocks[index].amount,
                                                style: RegularTextStyle.regular15600(whiteColor)  ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: stocks[index].add_minus_amount.contains("+") ? stockGreenColor : redColor,
                                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                ),
                                                padding: const EdgeInsets.all(3),
                                                child:  Text(stocks[index].add_minus_amount,
                                                  style: RegularTextStyle.regular15600(whiteColor)),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: width*0.05,)
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: stocks.length,
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
