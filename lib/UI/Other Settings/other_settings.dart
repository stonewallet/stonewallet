import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Other%20Settings/terms_and_conditions.dart';


class OtherSettingsPage extends StatefulWidget {
  const OtherSettingsPage({super.key});

  @override
  State<OtherSettingsPage> createState() => _OtherSettingsPageState();
}

class _OtherSettingsPageState extends State<OtherSettingsPage> {

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
        title:  Text("Other Settings",
            style: LargeTextStyle.large20700(whiteColor)
        ),
      ),
      body:   Column(
        children: [
          SizedBox(height: height*0.03,),
          ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: (){

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
                            Text("Fee priority",
                              style: RegularTextStyle.regular15600(whiteColor) ),
                            Text("Automatic",
                              style: RegularTextStyle.regular15600(iconColor))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(width: width, height: 1,
                      color:  drawerColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context)
                  //   =>  const BackupPage()),
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
                          Text("Default Buy Provider",
                            style: RegularTextStyle.regular15600(whiteColor) ),
                          Text("Ask each time",
                            style: RegularTextStyle.regular15600(iconColor)  )                        ],
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
                  =>  const TermAndConditionsPage()),
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
                          Text("Terms and Conditions",
                            style: RegularTextStyle.regular15600(whiteColor) ),
                          const Icon(Icons.arrow_forward_ios, size: 20, color:  iconColor)
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
