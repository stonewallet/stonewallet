
import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';


class TermAndConditionsPage extends StatefulWidget {
  const TermAndConditionsPage({super.key});

  @override
  State<TermAndConditionsPage> createState() => _TermAndConditionsPageState();
}

class _TermAndConditionsPageState extends State<TermAndConditionsPage> {

  bool permissionGranted = false;


  @override
  void initState() {
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
          title:  Text("Terms of Use",
              style: LargeTextStyle.large20500(whiteColor)
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [

            SizedBox(height: height*0.015,),
             Text(
              'Terms and Conditions',
              textAlign: TextAlign.center,
              style: LargeTextStyle.large24600(whiteColor)
            ),
            SizedBox(height: height*0.01,),
             Text(
              'Legal Disclaimer\nAnd\nTerms of Use',
              textAlign: TextAlign.center,
              style: RegularTextStyle.regular14500(whiteColor)
            ),
            SizedBox(height: height*0.015,),
            SizedBox(
              width: width*0.8,
              child:
               Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By accessing or using any or all of the Services, you expressly acknowledge that (i) you have read and understood these Terms; (ii) you agree to be bound by these Terms; and (iii) you are legally competent to enter into these Terms. If you do not agree to be bound by these Terms or any updates or modifications to these Terms, you may not access or use our Services. WE DO NOT PROVIDE INVESTMENT OR FINANCIAL ADVICE OR CONSULTING SERVICES. WE ARE SOLELY THE PROVIDER OF TRUST WALLET ANDWE DO NOT ADVISE OR MAKE RECOMMENDATIONS ABOUT ENGAGING IN DIGITAL ASSET TRANSACTIONS OR OPERATIONS. DECISIONS TO ENGAGE IN TRANSACTIONS OR PERFORM OPERATIONS INVOLVING DIGITAL ASSETS SHOULD BE TAKEN ON YOUR OWN ACCORD.\nPRIVACY POLICY\nFor an explanation on how we collect, use and disclose information from our users please see our Privacy Policy at ',
                      style: RegularTextStyle.regular15300(whiteColor)
                    ),
                    TextSpan(
                      text: 'https://trustwallet.com/privacy-policy',
                      style: RegularTextStyle.regular15300(whiteColor)
                      // recognizer: TapGestureRecognizer()..onTap = () => _launchURL("https://trustwallet.com/privacy-policy")
                    ),
                    TextSpan(
                      text: '. You acknowledge and agree that your use of the Services is subject to, and that we can collect, use and/or disclose your information (including any personal data you provide to us) in accordance with our Privacy Policy.\nUPDATES TO TERMS OR SERVICES\nWe reserve the right to update or modify these Terms at any time at our sole discretion. If we do so, we’ll let you know by either posting the revised Terms on our website, on our mobile application or through other methods of communication which we deem reasonable. Such revised Terms as posted will take effect immediately, unless otherwise indicated. You should regularly check our website to inform yourself of any such changes and decide whether or not to accept the revised version of these Terms. If you continue to use Trust Wallet following any update or modification of the Terms you shall be deemed to have accepted the revised Terms. If you do not agree to the Terms or any update or modification to the Terms, you must cease to access or use our Services. Our Services are evolving over time, we may change or discontinue all or any part of the Services, at any time and without prior notice, and at our sole discretion.',
                      style: RegularTextStyle.regular15300(whiteColor)
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: height*0.02,),


          ],
        )
    );
  }
}
