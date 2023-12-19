import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class WalletKeysPage extends StatefulWidget {
  const WalletKeysPage({super.key});

  @override
  State<WalletKeysPage> createState() => _WalletKeysPageState();
}

class _WalletKeysPageState extends State<WalletKeysPage> {

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
        title:  Text("Wallet seed/keys",
            style: LargeTextStyle.large20700(whiteColor)  
        ),
      ),
      body:   Column(
        children: [
          SizedBox(height: height*0.03,),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
             Container(
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: decorationColor

               ),
               child:  Text(
                 "DO NOT SHARE THESE WITH ANYONE ELSE INCLUDING SUPPORT.\n YOUR FUNDS CAN AND WILL BE STOLEN!",
               style: RegularTextStyle.regular16600(redColor),textAlign: TextAlign.center,),
             ),
              const SizedBox(height: 20,),
              Text("Spend key (public):",  style: RegularTextStyle.regular16600(iconColor)),
              const SizedBox(height: 10,),
              Text("98jh499ibibir873biu3h4983u93knbkjbk98jh499ibibir873biu3h4983u93knbkjbk",
                style: RegularTextStyle.regular16600(whiteColor) ),
              const SizedBox(height: 10,),
              Container(width: width, height: 1,
                color: drawerColor,
              ),
              const SizedBox(height: 20,),
              Text("Spend key (private):", style: RegularTextStyle.regular16600(iconColor),),
              const SizedBox(height: 10,),
              Text("98jh499ibibir873biu3h4983u93knbkjbk98jh499ibibir873biu3h4983u93knbkjbk",
                style: RegularTextStyle.regular16600(whiteColor)),
              const SizedBox(height: 10,),
              Container(width: width, height: 1,
                color: drawerColor,
              ),
              const SizedBox(height: 20,),
              Text("View key (public):",
                style: RegularTextStyle.regular16600(iconColor) ),
              const SizedBox(height: 10,),
              Text("98jh499ibibir873biu3h4983u93knbkjbk98jh499ibibir873biu3h4983u93knbkjbk",
                style:  RegularTextStyle.regular16600(whiteColor) ),
              const SizedBox(height: 10,),
              Container(width: width, height: 1,
                color: drawerColor,
              ),
              SizedBox(height: 20,),
              Text("View key (private):",
                style:  RegularTextStyle.regular16600(iconColor)),
              SizedBox(height: 10,),
              Text("98jh499ibibir873biu3h4983u93knbkjbk98jh499ibibir873biu3h4983u93knbkjbk",
                style: RegularTextStyle.regular16600(whiteColor) ),
              const SizedBox(height: 10,),
              Container(width: width, height: 1,
                color: drawerColor,
              ),
              const SizedBox(height: 20,),
              Text("Wallet seed:",
                style:  RegularTextStyle.regular16600(iconColor) ),
              const SizedBox(height: 10,),
              Text("stellar timber howls rigid identity snake palace tucks farming vane pouch fixate azure enraged "
                  "taxi bacon nuns honked zapped boxes situate sates hiker hitched farming",
                style:  RegularTextStyle.regular16600(iconColor) ),
              const SizedBox(height: 10,),



            ],
          )
        ],
      ),
    );
  }
}
