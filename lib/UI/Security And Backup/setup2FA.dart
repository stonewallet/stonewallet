import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/setup2FA_next.dart';

import '../Constants/colors.dart';


class Setup2FA extends StatefulWidget {
  const Setup2FA({super.key});

  @override
  State<Setup2FA> createState() => _Setup2FAState();
}

class _Setup2FAState extends State<Setup2FA> {

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
          child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        title:  Text("Setup 2FA",  
            style: LargeTextStyle.large20700(whiteColor)
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: height*0.02,),

            Text("Important note",
                style: LargeTextStyle.large20600(whiteColor) 
            ),
            const SizedBox(height: 10,),

            Text("Setup  2FA"
                " 2FA is NOT as secure as cold storage. 2FA protects against basic types of attacks, such as your friend providing your fingerprint while you are sleeping."
               "  2FA does NOT protect against a compromised device by a sophisticated attacker. If you lose access to your 2FA codes, YOU WILL LOSE ACCESS TO THIS WALLET. You will need to restore your wallet from mnemonic seed. YOU MUST THEREFORE BACK UP YOUR MNEMONIC SEEDS! Further, someone with access to your mnemonic seed(s) will be able to steal your funds, bypassing  2FA.  support staff will be unable to assist you if you lose access to your mnemonic seed, since is a noncustodial wallet.",
                style: RegularTextStyle.regular14500(whiteColor)
            ),

            const SizedBox(height: 100,),

            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)
                  =>  const Setup2FANext()),
                );
              },
              child: Column(
                children: [
                  Container(
                    height:40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Set up TOTP (Recommended)",
                          style: RegularTextStyle.regular15600(whiteColor)),
                        const Icon(Icons.arrow_forward_ios, size: 20, color:  iconColor,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(width: width, height: 1,
                    color:  drawerColor,
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );

  }
}
