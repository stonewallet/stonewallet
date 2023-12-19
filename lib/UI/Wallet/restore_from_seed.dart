import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class RestoreFromSeedPage extends StatefulWidget {
  const RestoreFromSeedPage({super.key});

  @override
  State<RestoreFromSeedPage> createState() => _RestoreFromSeedPageState();
}

class _RestoreFromSeedPageState extends State<RestoreFromSeedPage> {
  TextEditingController walletNameController = TextEditingController();
  TextEditingController seedPhraseController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController restoreFromBlockHeightController = TextEditingController();
  TextEditingController restoreFromDateController = TextEditingController();



  @override
  void initState() {
    super.initState();
    languageController = TextEditingController(text: "English (Seed language)");
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
          child: Icon(Icons.arrow_back_ios, color: whiteColor,),
        ),
        title:  Text("Restore from seed",
            style: LargeTextStyle.large20500(whiteColor)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 17,
            child: ListView(
              children: [
                const SizedBox(height: 30,),

                Container(
                  height: 45,
                  width: width * 0.95,
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    controller: walletNameController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style:  RegularTextStyle.regular16bold(whiteColor),
                    decoration:  InputDecoration(
                      hintText: "Wallet name",
                      hintStyle:  RegularTextStyle.regular16bold(cursorColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 45,
                  width: width * 0.95,
                  padding: EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    controller: seedPhraseController,
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    textAlignVertical: TextAlignVertical.center,
                    style: RegularTextStyle.regular16bold(whiteColor),
                    decoration:  InputDecoration(
                      hintText: "Enter your seed phrase",
                      hintStyle: RegularTextStyle.regular16bold(cursorColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  // height: 45,
                  width: width * 0.95,
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    controller: languageController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style: RegularTextStyle.regular16bold(whiteColor),
                    decoration:  InputDecoration(
                      hintText: "English",
                      hintStyle:  RegularTextStyle.regular16bold(cursorColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 45,
                  width: width * 0.95,
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    controller: restoreFromBlockHeightController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style: RegularTextStyle.regular16bold(whiteColor),
                    decoration:  InputDecoration(
                      hintText: "Restore from blockheight",
                      hintStyle: RegularTextStyle.regular16bold(cursorColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("or",style: RegularTextStyle.regular18600(Colors.white)),
                ),
                // SizedBox(height: 10,),
                Container(
                  height: 45,
                  width: width * 0.95,
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: TextField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    controller: restoreFromDateController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style: RegularTextStyle.regular16bold(whiteColor),
                    decoration:  InputDecoration(
                      hintText: "Restore from date",
                      hintStyle: RegularTextStyle.regular16bold(cursorColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: cursorColor),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.7,
                      child: Text("Please enter a date a few days before you created this wallet. Or if you kn0w the blockheight, please enter it instead",
                      style: LightTextStyle.light12300(cursorColor),
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),


              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context)
                          //   =>  const CreateNewWalletPage()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor2,
                            surfaceTintColor: Colors.black,
                            shadowColor: whiteColor,
                            elevation: 4
                        ),
                        child: Text("Restore", 
                            style: LargeTextStyle.large20700(whiteColor))),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Advanced Privacy Settings",
                        style: RegularTextStyle.regular15700(whiteColor)),
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
