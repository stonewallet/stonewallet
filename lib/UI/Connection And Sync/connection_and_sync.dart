import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Connection%20And%20Sync/manage_nodes.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class ConnectionAndSyncPage extends StatefulWidget {
  const ConnectionAndSyncPage({super.key});

  @override
  State<ConnectionAndSyncPage> createState() => _ConnectionAndSyncPageState();
}

class _ConnectionAndSyncPageState extends State<ConnectionAndSyncPage> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showAlertDialog(BuildContext context) {

      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("Cancel", style: RegularTextStyle.regular16700(redColor),),
        onPressed:  () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = TextButton(
        child: Text("Ok", style:  RegularTextStyle.regular16700(whiteColor),),
        onPressed:  () {
          Navigator.pop(context);
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: Color(0xff1A2330),
        title:
        Center(
            child: Text("Reconnection",
                style: RegularTextStyle.regular18600(whiteColor))),
        content: Text("Are you sure you want to reconnect",
          style: RegularTextStyle.regular16700(whiteColor)),
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
        backgroundColor:appBarBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:appBarBackgroundColor,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
          ),
          title: Text("Connection and sync",
              style: LargeTextStyle.large20700(whiteColor)
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.03,),
              InkWell(
                onTap: (){
                  showAlertDialog(context);
                },
                child: Container(

                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text("Reconnect",
                            style: RegularTextStyle.regular15600(whiteColor) ),
                          const Icon(Icons.arrow_forward_ios, color: iconColor2 ,size: 15,)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: width, height: 1,
                        color: drawerColor,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const ManageNodesPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Manage Nodes",
                            style: RegularTextStyle.regular15600(whiteColor)),
                          const Icon(Icons.arrow_forward_ios, color: iconColor2,size: 15,)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: width, height: 1,
                        color: drawerColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
