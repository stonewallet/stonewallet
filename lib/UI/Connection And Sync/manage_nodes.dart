import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Connection%20And%20Sync/add_new_node.dart';
import 'package:stone_wallet_main/UI/Connection%20And%20Sync/edit_node.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class ManageNodesPage extends StatefulWidget {
  const ManageNodesPage({super.key});

  @override
  State<ManageNodesPage> createState() => _ManageNodesPageState();
}

class _ManageNodesPageState extends State<ManageNodesPage> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


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
          title: Text("Manage nodes", 
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const AddNewNodePage()),
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
                          Text("Add new node",
                            style: RegularTextStyle.regular14600(whiteColor)),
                          const Icon(Icons.add, color: whiteColor,size: 15,)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: width, height: 1,
                        color:drawerColor,
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
                    =>  const EditNodePage()),
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
                          Text("electrum.stonewallet.com:3004",
                            style: RegularTextStyle.regular14600(iconColor2),),
                          const Icon(Icons.edit, color: iconColor2,size: 15,)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: width, height: 1,
                        color:drawerColor,
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
