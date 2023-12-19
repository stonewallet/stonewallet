import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/AddressBook/contact.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';


class AddressBookPage extends StatefulWidget {
  const AddressBookPage({super.key});

  @override
  State<AddressBookPage> createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showAlertDialog1(BuildContext context) {

      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("Cancel",
          style: RegularTextStyle.regular16600(redColor)),
        onPressed:  () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = TextButton(
        child: Text("Ok",
          style:  RegularTextStyle.regular16600(whiteColor)
            ),
        onPressed:  () {
          Navigator.pop(context);
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: appBarBackgroundColor,
        title: Center(
            child: Text("Exalted Step-uncle",
              style: RegularTextStyle.regular18600(whiteColor) )),
        content: Text("ret7wf878w6v87s6vcswef68w7f68wfe697dv87vs9897sv7f8vhw79",
          style: RegularTextStyle.regular16600(whiteColor)  ),
        shape:
        RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }


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
        title:  Text("Address Book",  style: LargeTextStyle.large20700(whiteColor)

        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)
                  =>  const AddContactPage()),
                );

              },
              icon: const Icon(Icons.add, color: whiteColor,size: 25,)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text("My Wallets",
              style: LargeTextStyle.large28600(whiteColor),),
          ),

          InkWell(
            onTap: (){
              showAlertDialog1(context);
            },
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Image.asset("assets/Icons/Bitcoin.svg.png", width: 30, height: 30,),
                  const SizedBox(width: 10,),
                  Text("Exalted Step-uncle",
                    style: RegularTextStyle.regular18600(whiteColor)
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              showAlertDialog1(context);
            },
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Image.asset("assets/Icons/monero-symbol-on-white-480.png", width: 30, height: 30,),
                  const SizedBox(width: 10,),
                   Text("jkbkjnk",
                    style: RegularTextStyle.regular18600(whiteColor)),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.02,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, ),
            child: Text("Contacts",
              style: LargeTextStyle.large28600(whiteColor)),
          ),



        ],
      ),
    );
  }
}
