import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Create%20New%20Wallet/create_new_wallet.dart';
import 'package:stone_wallet_main/UI/Wallet/restore_wallet.dart';

import '../Constants/colors.dart';
import '../Constants/text_styles.dart';


class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {


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
          title:  Text("Wallet",
              style: LargeTextStyle.large20700(whiteColor)
          ),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: height*0.03,),

                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset("assets/Icons/Bitcoin.svg.png", width: 30, height: 30,),
                      const SizedBox(width: 10,),
                       Text("Exalted Step-uncle",
                        style: LargeTextStyle.large18800(whiteColor),),
                    ],
                  ),
                ),

                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/Icons/monero-symbol-on-white-480.png", width: 30, height: 30,),
                          const SizedBox(width: 10,),
                           Text("jkbkjnk",
                            style: LargeTextStyle.large18800(whiteColor),),
                        ],
                      ),
                      const Icon(Icons.edit, size: 20, color: whiteColor,)
                    ],
                  ),
                ),
              ],
            ),
            // Expanded(
            //   flex: 4,
            //   child:
            // ),


          ],
        ),
      floatingActionButton:  Column(

        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 50,
            width: width * 0.8,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const CreateNewWalletPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:  buttonColor2,
                    surfaceTintColor: blackColor,
                    shadowColor: whiteColor,
                    elevation: 4
                ),
                child:  Text("+  Create New Wallet",
                  style: LargeTextStyle.large20700(whiteColor)
            )),
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:   buttonColor3,
                    surfaceTintColor: blackColor,
                    shadowColor: whiteColor,
                    elevation: 4
                ),

                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const RestoreWalletPage()),
                  );

                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.restart_alt, size: 20,color: whiteColor,),
                    const SizedBox(width: 5,),
                    Text("Restore Wallet",
                      style: LargeTextStyle.large20700(whiteColor)),
                  ],
                )),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
    );
  }
}
