import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Privacy/domain_lookups.dart';
import 'package:stone_wallet_main/UI/Privacy/trocador_providers.dart';


class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  bool saveRecipient = false;
  bool autoGenerate = false;
  bool prevent = false;
  bool buyAction = false;
  bool sellAction = false;
  List<bool> isSelected = [true, false, false];
  bool isEnabled = true;
  bool isTorOnly = false;
  bool isDisabled = false;
  bool isEnabledEx = true;
  bool isTorOnlyEx = false;
  bool isDisabledEx = false;

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
        title:  Text("Privacy Settings",  
            style: LargeTextStyle.large20700(whiteColor) 
        ),
      ),
      body: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
            const SizedBox(height: 20,),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Flat API",
                  style: RegularTextStyle.regular16600(whiteColor) ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.9,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: drawerColor
                      ),
                      child: Row(
                      children: [
                        InkWell(
                          onTap: (){

                            setState(() {
                              isEnabled = true;
                              isDisabled = false;
                              isTorOnly = false;

                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: width * 0.3,
                              height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isEnabled  == true ? blueAccentColor : Colors.transparent
                              ),
                              child: Text("Enabled",
                                style: isEnabled ==true? RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2)  )),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isTorOnly = true;
                              isDisabled = false;
                              isEnabled = false;

                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                            width: width * 0.3,
                              height: 35,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isTorOnly  == true ? blueAccentColor : Colors.transparent
                              ),
                              child: Text("Tor only", style: isTorOnly ==true?  RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2) ,)),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isDisabled = true;
                              isEnabled = false;
                              isTorOnly = false;

                            });
                          },
                          child: Container(
                              width: width * 0.3,
                              height: 35,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isDisabled  == true ? blueAccentColor : Colors.transparent
                              ),
                              alignment: Alignment.center,
                              child: Text("Disabled",
                                style: isDisabled ==true?  RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2) )),
                        ),
                      ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Exchange",
                  style: RegularTextStyle.regular16600(whiteColor)),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.9,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: drawerColor
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){

                              setState(() {
                                isEnabledEx = true;
                                isDisabledEx = false;
                                isTorOnlyEx = false;

                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: width * 0.3,
                                height: 35,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isEnabledEx  == true ? blueAccentColor : Colors.transparent
                                ),
                                child: Text("Enabled",
                                  style: isEnabledEx ==true?  RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2) )),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isTorOnlyEx = true;
                                isDisabledEx = false;
                                isEnabledEx = false;

                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: width * 0.3,
                                height: 35,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isTorOnlyEx  == true ? blueAccentColor : Colors.transparent
                                ),
                                child: Text("Tor only", style: isTorOnlyEx ==true?  RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2) )),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isDisabledEx = true;
                                isEnabledEx = false;
                                isTorOnlyEx = false;

                              });
                            },
                            child: Container(
                                width: width * 0.3,
                                height: 35,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isDisabledEx  == true ? blueAccentColor : Colors.transparent
                                ),
                                alignment: Alignment.center,
                                child: Text("Disabled",
                                  style: isDisabledEx ==true?  RegularTextStyle.regular16600(whiteColor) : RegularTextStyle.regular16600(textColor2) )),
                          ),
                        ],
                      ),
                    ),
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
                         Text("Save recipient address",
                          style: RegularTextStyle.regular14600(whiteColor),),
                        Switch.adaptive(
                          value: saveRecipient,
                          onChanged: (value) => setState(() => saveRecipient = value),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Auto generate subaddresses",
                          style: RegularTextStyle.regular14600(whiteColor),),
                        Switch.adaptive(
                          value: autoGenerate,
                          onChanged: (value) => setState(() => autoGenerate = value),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Prevent screenshots & screen recording",
                          style: RegularTextStyle.regular14600(whiteColor),),
                        Switch.adaptive(
                          value: prevent,
                          onChanged: (value) => setState(() => prevent = value),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Disable buy action",
                          style: RegularTextStyle.regular14600(whiteColor),),
                        Switch.adaptive(
                          value: buyAction,
                          onChanged: (value) => setState(() => buyAction = value),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Disable sell action",
                          style: RegularTextStyle.regular14600(whiteColor),),
                        Switch.adaptive(
                          value: sellAction,
                          onChanged: (value) => setState(() => sellAction = value),
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
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    =>  const DomainLookupPage()),
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
                          Text("Domain lookups",
                            style: RegularTextStyle.regular14600(whiteColor),),
                          const Icon(Icons.arrow_forward_ios, size: 20, color:  iconColor,)
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
                    =>  const TrocadorProvidersPage()),
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
                          Text("Trocador providers",
                            style: RegularTextStyle.regular14600(whiteColor),),
                          const Icon(Icons.arrow_forward_ios, size: 20, color:  iconColor,)
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

      ),
    );
  }
}
