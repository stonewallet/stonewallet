import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class EditBackupPasswordPage extends StatefulWidget {
  const EditBackupPasswordPage({super.key});

  @override
  State<EditBackupPasswordPage> createState() => _EditBackupPasswordPageState();
}

class _EditBackupPasswordPageState extends State<EditBackupPasswordPage> {

  bool button = false;

  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    passwordController.text = 'wkbf7869asf097sd78sd8979s7d879s8f0s90';
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
        title:  Text("Edit Backup Password",
            style: LargeTextStyle.large20500(whiteColor)
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller: passwordController,
              style: RegularTextStyle.regular18600(whiteColor),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor2,
              surfaceTintColor: blackColor,
              shadowColor: whiteColor,
              elevation: 4
          ),
          onPressed: () {  },
          child:  Text("Save",
            style: RegularTextStyle.regular18600(whiteColor),),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
