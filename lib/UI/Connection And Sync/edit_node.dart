import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class EditNodePage extends StatefulWidget {
  const EditNodePage({super.key});

  @override
  State<EditNodePage> createState() => _EditNodePageState();
}

class _EditNodePageState extends State<EditNodePage> {
  TextEditingController nodeAddressController = TextEditingController();
  TextEditingController nodePortController = TextEditingController();


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
        title:  Text("Edit Node",  style: LargeTextStyle.large20700(whiteColor)
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: height*0.02,),

          Container(
            height: 45,
            width: width * 0.95,
            padding: const EdgeInsets.only(left:15, right: 15),
            alignment: Alignment.center,
            child: TextField(
              autofocus: true,
              cursorColor: cursorColor,
              controller: nodeAddressController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: RegularTextStyle.regular16bold(whiteColor),
              decoration:  InputDecoration(
                hintText: "Node Address",
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

          const SizedBox(height: 15,),
          Container(
            height: 45,
            width: width * 0.95,
            padding: const EdgeInsets.only(left:15, right: 15),
            alignment: Alignment.center,
            child: TextField(
              autofocus: true,
              cursorColor: cursorColor,
              controller: nodePortController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: RegularTextStyle.regular16bold(whiteColor),
              decoration:  InputDecoration(
                hintText: "Node port",
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


        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.4,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange
                  ),
                  onPressed: (){},
                  child: Text("Delete",
                      style: RegularTextStyle.regular18600(whiteColor)
                  )
              ),
            ),
            SizedBox(
              width: width * 0.4,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent
                  ),

                  onPressed: (){},
                  child: Text("Save",
                      style: RegularTextStyle.regular18600(whiteColor))
              ),
            ),

            // SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
