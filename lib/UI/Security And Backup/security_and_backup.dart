import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/backup.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/setup2FA.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/wallet_keys.dart';

import '../Constants/colors.dart';


class SecurityAndBackupPage extends StatefulWidget {
  const SecurityAndBackupPage({super.key});

  @override
  State<SecurityAndBackupPage> createState() => _SecurityAndBackupPageState();
}

class _SecurityAndBackupPageState extends State<SecurityAndBackupPage> {

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
        title:  Text("Security and backup", 
            style: LargeTextStyle.large20700(whiteColor) 
        ),
      ),
      body:   Column(
        children: [
          SizedBox(height: height*0.03,),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const WalletKeysPage()),
                  );
                },
                child: Column(
                  children: [
                    const SizedBox(height: 10,),

                     SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Show seed/keys ",
                              style: RegularTextStyle.regular15600(whiteColor)),
                            const Icon(Icons.arrow_forward_ios, size: 20, color: iconColor,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: drawerColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const BackupPage()),
                  );
                },
                child: Column(
                  children: [
                     Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Create backup",
                            style: RegularTextStyle.regular15600(whiteColor)),
                          const Icon(Icons.arrow_forward_ios, size: 20, color: iconColor,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: drawerColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  screenLockCreate(
                    context: context,
                    title: const Text('Enter your PIN'),
                    confirmTitle: const Text('Enter your pin again'),
                    onConfirmed: (value) => Navigator.of(context).pop(),
                    config: const ScreenLockConfig(
                      backgroundColor: appBarBackgroundColor,
                    ),
                    secretsConfig: const SecretsConfig(
                      spacing: 15, // or spacingRatio
                      padding: EdgeInsets.all(40),
                      secretConfig: SecretConfig(
                        // borderColor: Colors.amber,
                          borderSize: 2.0,
                          disabledColor: Colors.black,
                          enabledColor: whiteColor
                        // enabledColor: Colors.amber,

                      ),
                    ),
                    keyPadConfig: const KeyPadConfig(
                      buttonConfig: KeyPadButtonConfig(
                          backgroundColor: Colors.transparent,
                          fontSize: 20,
                          foregroundColor: whiteColor

                      ),
                      displayStrings: [
                        '0',
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9'
                      ],
                    ),
                    cancelButton: const Icon(Icons.close),
                    // deleteButton: const Icon(Icons.delete),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context)
                  //   =>  const ChangePinPage()),
                  // );
                },
                child: Column(
                  children: [
                     Container(
                       height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Change PIN",
                            style: RegularTextStyle.regular15600(whiteColor)),
                          const Icon(Icons.arrow_forward_ios, size: 20, color: iconColor,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: drawerColor,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                   const SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Allow biometrical authentication",
                          style: RegularTextStyle.regular15600(whiteColor)),
                        Switch.adaptive(
                            value: button,
                          onChanged: (value) => setState(() => button = value),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(width: width, height: 1,
                    color: drawerColor,
                  )
                ],
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){},
                child: Column(
                  children: [
                     Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Require PIN after",
                            style: RegularTextStyle.regular15600(whiteColor)),
                          Text("10 minutes",
                            style: RegularTextStyle.regular14600(iconColor) )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: drawerColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const Setup2FA()),
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
                          Text("Setup  2FA",
                            style:  RegularTextStyle.regular15600(whiteColor)),
                          const Icon(Icons.arrow_forward_ios, size: 20, color: iconColor,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color: drawerColor,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
