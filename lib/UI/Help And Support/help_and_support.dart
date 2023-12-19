import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';


class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {


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
        title:  Text("Support",
            style: LargeTextStyle.large20500(whiteColor)
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),

          InkWell(
            onTap: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context)
              //   =>  const RestoreWalletNextPage()),
              // );
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: decorationColor
                ),
                child: Row(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        // stops: [0.5, 1],
                        colors: [
                          gradientColor3,
                          gradientColor4,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.access_time,
                        size: 40,
                      ),
                    ),
                    // Icon(Icons.wallet, color: Colors.deepPurple,size: 40,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: width * 0.7,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Live support",
                            style: LargeTextStyle.large20500(whiteColor),
                          ),
                          Text("Free and fast! Trained support representative are available to assist",
                            style: RegularTextStyle.regular14400(whiteColor) ,
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){},
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: decorationColor
                ),
                child: Row(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        // stops: [0.5, 1],
                        colors: [
                          gradientColor3,
                          gradientColor4
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    // Icon(Icons.wallet, color: Colors.deepPurple,size: 40,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: width * 0.7,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Stone Wallet guides",
                            style: LargeTextStyle.large20600(whiteColor),
                          ),
                          Text("Documentation and support for common issues",
                            style: RegularTextStyle.regular14400(whiteColor),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){},
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: decorationColor
                ),
                child: Row(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        // stops: [0.5, 1],
                        colors: [
                          gradientColor3,
                          gradientColor4,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    // Icon(Icons.wallet, color: Colors.deepPurple,size: 40,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: width * 0.7,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Other support links",
                            style: LargeTextStyle.large20600(whiteColor) ,
                          ),
                          Text("Join our communities or reach us or out partners through other methods",
                            style: RegularTextStyle.regular14400(whiteColor) ,
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),


        ],
      ),
    );
  }
}
