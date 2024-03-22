import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/generate_api/generate.dart';
import 'package:stone_wallet_main/API/logout/logout.dart';
import 'package:stone_wallet_main/UI/AddressBook/address_book.dart';
import 'package:stone_wallet_main/UI/Connection%20And%20Sync/connection_and_sync.dart';
import 'package:stone_wallet_main/UI/Constants/strings.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Help%20And%20Support/help_and_support.dart';
import 'package:stone_wallet_main/UI/Model/keyFile/key_model.dart';
import 'package:stone_wallet_main/UI/Other%20Settings/other_settings.dart';
import 'package:stone_wallet_main/UI/Privacy/privacy.dart';
import 'package:stone_wallet_main/UI/Security%20And%20Backup/security_and_backup.dart';
import 'package:stone_wallet_main/UI/Wallet/wallet.dart';
import 'package:stone_wallet_main/UI/welcome_page.dart';
import 'package:stone_wallet_main/widgets/customspinkit_widget.dart';

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
  late double width;
  late double height;
  TextEditingController assestAmountController = TextEditingController();
  late ApiForGetKey apiForGetKey;

  @override
  void initState() {
    super.initState();
    apiForGetKey = ApiForGetKey();
  }

  bool _isLoading = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          height: 20,
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
                                    if (kDebugMode) {
                                      print("Generate the Key");
                                    }
                                    // showBottomSheetText(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            const Icon(
                                              Icons.key,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            GestureDetector(
                                              onTap: () => setState(
                                                  () => isVisible = !isVisible),
                                              child: Text(
                                                "Generate Your Key",
                                                style: RegularTextStyle
                                                    .regular15700(whiteColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        if (isVisible) buildTextForm(),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Container(
                                          width: width,
                                          height: 1,
                                          color: drawerColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _showLogoutConfirmationDialog(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            const Icon(
                                              Icons.logout_sharp,
                                              color: redColor,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              "Log Out",
                                              style:
                                                  RegularTextStyle.regular15700(
                                                      redColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
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
                final SharedPreferences sharedPref =
                    await SharedPreferences.getInstance();
                sharedPref.remove('name');

                var response = await ApiServiceForLogOut().logOut();

                if (response.message != null) {
                  Get.offAll(() => const WelcomePage());
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('csrfToken');
                  sharedPreferences.remove('sessionId');
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

  Widget buildTextForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Wallet Name",
                  style: RegularTextStyle.regular16600(whiteColor),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Tooltip(
                message:
                    'Give wallet name for specific wallet key,\n by default it will generate the key of latest wallet.',
                child: InkWell(
                  onTap: () {
                    // Handle onTap event here
                    print('Tooltip icon tapped');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Information'),
                          content: const Text(
                              'Give wallet name for specific wallet key,\n by default it will generate the key of latest wallet.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.info_outline,
                    size: 20,
                    color: whiteColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                height: 45,
                width: width / 2,
                // padding: EdgeInsets.only(left: 15, right: 15),
                // alignment: Alignment.center,
                child: TextField(
                  // autofocus: true,
                  cursorColor: Colors.blue,
                  controller: assestAmountController,
                  textAlign: TextAlign.start,

                  textAlignVertical: TextAlignVertical.center,
                  style: RegularTextStyle.regular16600(whiteColor),
                  decoration: InputDecoration(
                    hintText: 'Optional',
                    hintStyle: RegularTextStyle.regular14400(
                        whiteColor.withOpacity(0.3)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: borderColor, width: 1.0),
                    ),
                    fillColor: fillColor.withOpacity(0.5),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: borderColor, width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 12,
              ),
              Visibility(
                visible: !_isLoading,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor2,
                    surfaceTintColor: blackColor,
                    foregroundColor: whiteColor,
                    shadowColor: whiteColor,
                    elevation: 4,
                  ),
                  onPressed: () async {
                    GetKeyUrl? keyUrl = await apiForGetKey.fetchPdfData(
                        name: assestAmountController.text);
                    // if (keyUrl.message != null) {
                    //   Get.snackbar(
                    //     "${keyUrl.message}",
                    //     '',
                    //     backgroundColor: newGradient6,
                    //     colorText: whiteColor,
                    //     padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    //     duration: const Duration(milliseconds: 4000),
                    //     snackPosition: SnackPosition.BOTTOM,
                    //   );
                    // }
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.storage,
                      //add more permission to request here.
                    ].request();

                    final dir = await getDownloadDirectorypath();
                    if (statuses[Permission.storage]!.isGranted) {
                      if (dir != null) {
                        String fileName = keyUrl.message!.split('/').last;

                        String savename = "$fileName.keys";
                        String savePath = "$dir/$savename";
                        print(savePath);
                        //output:  /storage/emulated/0/Download/banner.png
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await Dio()
                              .download("$baseUrl${keyUrl.message}", savePath,
                                  onReceiveProgress: (received, total) {
                            if (received != -1) {
                              print(
                                  "${(received / total * 100).toStringAsFixed(0)}%");
                            }
                          });
                          print("File is saved to download folder.");
                          Get.snackbar(
                            "File Downloaded",
                            '',
                            backgroundColor: newGradient6,
                            colorText: whiteColor,
                            padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                            duration: const Duration(milliseconds: 4000),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } on DioException catch (e) {
                          print(e.message);
                        }
                      }
                    } else {
                      print("No permission to read and write.");
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Permission Denied !"),
                      ));
                    }

                    Future.delayed(const Duration(seconds: 4), () {
                      setState(() {
                        _isLoading = false;
                        assestAmountController.clear();
                      });
                    });
                  },
                  child: const Text("Save and Download"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Visibility(
                  visible: _isLoading,
                  child: const CustomSpinKitFadingCube(
                    color: whiteColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: height / 18,
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child:
          // )
        ],
      ),
    );
  }

  Future<String?> getDownloadDirectorypath() async {
    if (Platform.isAndroid) {
      return (await DownloadsPathProvider.downloadsDirectory)?.path;
    } else if (Platform.isIOS) {
      return (await getApplicationDocumentsDirectory()).path;
    } else {
      return null;
    }
  }

  Future<Map<Permission, PermissionStatus>> requestStoragePermission() async {
    return await [
      Permission.storage,
    ].request();
  }
}
