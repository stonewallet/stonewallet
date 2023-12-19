import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/edit_backup_password.dart';

import '../Constants/colors.dart';


class BackupPage extends StatefulWidget {
  const BackupPage({super.key});

  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {

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
        title:  Text("Backup",
            style: LargeTextStyle.large20700(whiteColor)
        ),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)
                  =>  const EditBackupPasswordPage()),
                );
              },
              child: Text("Change password",
                style: RegularTextStyle.regular14600(blueAccentColor))
          )
        ],
      ),
      body:   Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height*0.03,),

            Text("Backup password:",
              style: LargeTextStyle.large30400(whiteColor) ),
            Text("b374t7gb8347yr87gb8746g82478gh87sdf8979s79rg872299869870u724",
              style:  LargeTextStyle.large30400(whiteColor),textAlign: TextAlign.center, ),

            const SizedBox(height: 20,),

            Text("Please write dwon your backup password, which is used for the import of your backup files",
              style: RegularTextStyle.regular16400(drawerColor),textAlign: TextAlign.center,
            ),

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
          child:  Text("Export backup",
            style: RegularTextStyle.regular18600(whiteColor)),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
