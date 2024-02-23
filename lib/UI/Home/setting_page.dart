import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/logout/logout.dart';
import 'package:stone_wallet_main/UI/AddressBook/address_book.dart';
import 'package:stone_wallet_main/UI/Connection%20And%20Sync/connection_and_sync.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Help%20And%20Support/help_and_support.dart';
import 'package:stone_wallet_main/UI/Other%20Settings/other_settings.dart';
import 'package:stone_wallet_main/UI/Privacy/privacy.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/security_and_backup.dart';
import 'package:stone_wallet_main/UI/Wallet/wallet.dart';
import 'package:stone_wallet_main/UI/welcome_page.dart';

import '../Constants/colors.dart';
import '../Model/settings_model.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SettingModel> settings = [
    SettingModel(name: "Account Settings", image: "assets/Icons/user.png"),
    SettingModel(name: "Connection and sync", image: "assets/Icons/sync.png"),
    SettingModel(name: "Address book", image: "assets/Icons/address-book.png"),
    SettingModel(name: "Security and backup", image: "assets/Icons/lock.png"),
    SettingModel(name: "Privacy", image: "assets/Icons/view.png"),
    SettingModel(
        name: "Display settings", image: "assets/Icons/light-mode.png"),
    SettingModel(name: "Help & Support", image: "assets/Icons/support.png"),
    SettingModel(
        name: "Terms & Condition",
        image: "assets/Icons/terms-and-conditions.png"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background_new_wallet.png"),
                fit: BoxFit.fill,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [newGradient5, newGradient6],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text("Settings",
                            style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: width * 0.15,
                          height: 2,
                          color: lineColor,
                        ),
                        Container(
                          width: width * 0.9,
                          height: 1,
                          color: lineColor2,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                // InkWell(
                                //   onTap: (){},
                                //   child: Container(
                                //     margin: const EdgeInsets.only(bottom: 30),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           children: [
                                //             SizedBox(width: width*0.05,),
                                //             Image.asset("assets/Icons/user.png",height: 20,width: 20,color: iconColor,),
                                //             SizedBox(width: width*0.05,),
                                //             Text("Account Settings",
                                //               style: TextStyle(color: whiteColor),),
                                //           ],
                                //         ),
                                //         SizedBox(height: 10,),
                                //         Container(width: width, height: 1,
                                //           color:drawerColor,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WalletPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/wallet-filled-money-tool.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text("Wallets",
                                                style: RegularTextStyle
                                                    .regular15700(whiteColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConnectionAndSyncPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/sync.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Connection and sync",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressBookPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/address-book.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Address Book",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SecurityAndBackupPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/lock.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Security and Backup",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PrivacyPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/view.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Privacy",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: (){},
                                //   child: Container(
                                //     margin: const EdgeInsets.only(bottom: 30),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           children: [
                                //             SizedBox(width: width*0.05,),
                                //             Image.asset("assets/Icons/light-mode.png",height: 20,width: 20,color: iconColor,),
                                //             SizedBox(width: width*0.05,),
                                //             Text("Display Settings",
                                //               style: TextStyle(color: whiteColor),),
                                //           ],
                                //         ),
                                //         SizedBox(height: 10,),
                                //         Container(width: width, height: 1,
                                //           color:drawerColor,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OtherSettingsPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/settings.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Other Settings",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HelpAndSupportPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Image.asset(
                                              "assets/Icons/support.png",
                                              height: 20,
                                              width: 20,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Help & Support",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _showLogoutConfirmationDialog(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            const Icon(
                                              Icons.logout_sharp,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Log Out",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      whiteColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'LogOut',
            style: RegularTextStyle.regular14600(blackColor),
          ),
          content: Text(
            'Are you sure you want to LogOut?',
            style: RegularTextStyle.regular14600(blackColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: RegularTextStyle.regular14600(blackColor),
              ),
            ),
            TextButton(
              onPressed: () async {
                var response = await ApiServiceForLogOut().logOut();

                if (response.message != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ));
                  Get.snackbar(
                    "Logout successfully",
                    '',
                    backgroundColor: newGradient6,
                    colorText: whiteColor,
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    duration: const Duration(milliseconds: 4000),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  // var snackBar = SnackBar(
                  //     content: Text(
                  //         "Assets created successfully"));
                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(snackBar);
                } else {
                  Get.snackbar(
                    "Something gone wrong",
                    '',
                    backgroundColor: newGradient6,
                    colorText: whiteColor,
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    duration: const Duration(milliseconds: 4000),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
                // Navigator.pop(context);
              },
              child: Text(
                'LogOut',
                style: RegularTextStyle.regular14600(dotColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
