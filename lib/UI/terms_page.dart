import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/welcome_page.dart';

import 'Constants/colors.dart';

class TermsOfPage extends StatefulWidget {
  const TermsOfPage({super.key});

  @override
  State<TermsOfPage> createState() => _TermsOfPageState();
}

class _TermsOfPageState extends State<TermsOfPage> {
  bool permissionGranted = false;

  // _launchURL(String webUrl) async {
  //   if (await canLaunch(webUrl)) {
  //     await launch(webUrl);
  //   } else {
  //     throw 'Could not launch $webUrl';
  //   }
  // }
  // Future<void> getStoragePermission() async {
  //   DeviceInfoPlugin plugin = DeviceInfoPlugin();
  //   AndroidDeviceInfo android = await plugin.androidInfo;
  //   if (android.version.sdkInt < 33) {
  //     if (await Permission.storage.request().isGranted && await Permission.manageExternalStorage.request().isGranted) {
  //       setState(() {
  //         permissionGranted = true;
  //       });
  //     } else if (await Permission.storage.request().isPermanentlyDenied) {
  //       await openAppSettings();
  //     } else if (await Permission.audio.request().isDenied) {
  //       setState(() {
  //         permissionGranted = false;
  //       });
  //     }
  //   } else {
  //     if (await Permission.photos.request().isGranted && await Permission.videos.request().isGranted && await Permission.audio.request().isGranted) {
  //       setState(() {
  //         permissionGranted = true;
  //       });
  //     } else if (await Permission.photos.request().isPermanentlyDenied) {
  //       await openAppSettings();
  //     } else if (await Permission.photos.request().isDenied) {
  //       setState(() {
  //         permissionGranted = false;
  //       });
  //     }
  //   }
  // }
  
Future<void> getStoragePermission() async {
  if (Platform.isAndroid) {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo? android = await plugin.androidInfo;
    if (android != null) {
      if (android.version.sdkInt < 33) {
        if (await Permission.storage.request().isGranted &&
            await Permission.manageExternalStorage.request().isGranted) {
          setState(() {
            permissionGranted = true;
          });
        } else if (await Permission.storage.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.audio.request().isDenied) {
          setState(() {
            permissionGranted = false;
          });
        }
      } else {
        if (await Permission.photos.request().isGranted &&
            await Permission.videos.request().isGranted &&
            await Permission.audio.request().isGranted) {
          setState(() {
            permissionGranted = true;
          });
        } else if (await Permission.photos.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.photos.request().isDenied) {
          setState(() {
            permissionGranted = false;
          });
        }
      }
    }
  } else {
    // Handle iOS specific logic here if needed
  }
}
  @override
  void initState() {
    getStoragePermission();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 25),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background1.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Text('Terms of Use',
                textAlign: TextAlign.center,
                style: RegularTextStyle.regular16700(termsColor)),
            SizedBox(
              height: height * 0.015,
            ),
            Text(
              'Terms and Conditions',
              textAlign: TextAlign.center,
              style: LargeTextStyle.large24600(whiteColor),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text('Legal Disclaimer\nAnd\nTerms of Use',
                textAlign: TextAlign.center,
                style: RegularTextStyle.regular14500(whiteColor)),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              height: height * 0.6,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'By accessing or using any or all of the Services, you expressly acknowledge that (i) you have read and understood these Terms; (ii) you agree to be bound by these Terms; and (iii) you are legally competent to enter into these Terms. If you do not agree to be bound by these Terms or any updates or modifications to these Terms, you may not access or use our Services. WE DO NOT PROVIDE INVESTMENT OR FINANCIAL ADVICE OR CONSULTING SERVICES. WE ARE SOLELY THE PROVIDER OF TRUST WALLET ANDWE DO NOT ADVISE OR MAKE RECOMMENDATIONS ABOUT ENGAGING IN DIGITAL ASSET TRANSACTIONS OR OPERATIONS. DECISIONS TO ENGAGE IN TRANSACTIONS OR PERFORM OPERATIONS INVOLVING DIGITAL ASSETS SHOULD BE TAKEN ON YOUR OWN ACCORD.\nPRIVACY POLICY\nFor an explanation on how we collect, use and disclose information from our users please see our Privacy Policy at ',
                              style: LightTextStyle.light15300(whiteColor)),
                          TextSpan(
                              text: 'https://trustwallet.com/privacy-policy',
                              style: LightTextStyle.light15300(whiteColor)
                              // recognizer: TapGestureRecognizer()..onTap = () => _launchURL("https://trustwallet.com/privacy-policy")
                              ),
                          TextSpan(
                              text:
                                  '. You acknowledge and agree that your use of the Services is subject to, and that we can collect, use and/or disclose your information (including any personal data you provide to us) in accordance with our Privacy Policy.\nUPDATES TO TERMS OR SERVICES\nWe reserve the right to update or modify these Terms at any time at our sole discretion. If we do so, we’ll let you know by either posting the revised Terms on our website, on our mobile application or through other methods of communication which we deem reasonable. Such revised Terms as posted will take effect immediately, unless otherwise indicated. You should regularly check our website to inform yourself of any such changes and decide whether or not to accept the revised version of these Terms. If you continue to use Trust Wallet following any update or modification of the Terms you shall be deemed to have accepted the revised Terms. If you do not agree to the Terms or any update or modification to the Terms, you must cease to access or use our Services. Our Services are evolving over time, we may change or discontinue all or any part of the Services, at any time and without prior notice, and at our sole discretion.',
                              style: LightTextStyle.light15300(whiteColor)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_box_outlined,
                  color: whiteColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('I agree to Terms of Use',
                    textAlign: TextAlign.center,
                    style: RegularTextStyle.regular15700(whiteColor))
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.35,
              height: 49,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: Text("Accept",
                      style: LargeTextStyle.large20700(whiteColor))),
            ),
            // GestureDetector(
            //   child: Container(
            //     width: width*0.35,
            //     height: 49,
            //     alignment: Alignment.center,
            //     // decoration: ShapeDecoration(
            //     //   gradient: const LinearGradient(
            //     //     begin: Alignment(-0.00, -1.00),
            //     //     end: Alignment(0, 1),
            //     //     colors: [Color(0xFF94BFFF), Color(0xFF192943)],
            //     //   ),
            //     //   shape: RoundedRectangleBorder(
            //     //     borderRadius: BorderRadius.circular(39.50),
            //     //   ),
            //     // ),
            //     decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage("assets/button.png"),
            //           fit: BoxFit.fill,
            //         )
            //     ),
            //     child: const Text(
            //       'Accept',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontFamily: 'Archivo',
            //         fontWeight: FontWeight.w700,
            //       ),
            //     ),
            //   ),
            //   onTap: (){
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //       builder: (context)
            //     //       builder: (context)
            //     //       => WelcomePage()),
            //     // );
            //   },
            // ),
          ],
        ),
      ),
    ));
  }
}
