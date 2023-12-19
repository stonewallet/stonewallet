import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import '../Constants/colors.dart';
import '../Home/home_page.dart';
import 'create_new_wallet_3.dart';

class CreateNewWalletPage4 extends StatefulWidget {

  // final List<String> seed;
  const CreateNewWalletPage4({Key? key}) : super(key: key);

  // const CreateNewWalletPage4({super.key});

  @override
  State<CreateNewWalletPage4> createState() => _CreateNewWalletPage4State();
}

class _CreateNewWalletPage4State extends State<CreateNewWalletPage4> {

  late TextEditingController searchController = TextEditingController();
  bool visibility = false;
  List<String>? mixed_seeds = ["Delicious", "Bamboo", "Fence", "wait", "doctor", "flying", "ordinary", "great", "cancel",
  "three", "flying", "case"];
  List<bool>? isTaped = [];
  // String? seed;
  // int? random;
  int? tapedIndex;
  @override
  void initState() {
    // setState(() {
    //   print(widget.seed);
    //   seed = widget.seed.join("  ");
    //   mixed_seeds = widget.seed;
    //   mixed_seeds!.shuffle(Random());
      for(int i=0;i<mixed_seeds!.length;i++){
        isTaped!.add(false);
      }
    //   random = Random().nextInt(12);
    // });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_new_wallet.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.05,),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Icon(Icons.arrow_back_ios, color: textColor,),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)
                        => CreateNewWalletPage3()),
                      );
                    },
                  ),
                  Container(
                    width: width,
                    height: height*0.88,
                    margin: EdgeInsets.only(top: height*0.02),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/background_new_wallet1.png"),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.02,),
                         Text("Create New Wallet",
                          style: LargeTextStyle.large20500(whiteColor)
                        ),
                        SizedBox(height: height*0.04,),
                         Text(
                          "Arrange them in order to verify",
                          textAlign: TextAlign.center,
                          style: RegularTextStyle.regular15700(termsColor) 
                        ),
                        SizedBox(height: height*0.07,),
                        // mixed_seeds == null ? Container() :
                        Container(
                            height: height*0.55,
                            width: width*0.95,
                            child:
                            GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: 2.2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: List.generate(mixed_seeds!.length, (index) {
                                  return GestureDetector(
                                    child: Container(
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          // image: DecorationImage(
                                          //   image: AssetImage(!isTaped![index]? "assets/seed.png":"assets/taped_seed.png"),
                                          //   fit: BoxFit.fill,
                                          // )
                                        border: !isTaped![index] ? Border.all(color: Colors.transparent) :
                                        Border.all(color: whiteColor, width: 2),
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: !isTaped![index] ?   const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            newGradient1,
                                            newGradient2
                                          ],
                                        ) : const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            newGradient3,
                                            newGradient4
                                          ],
                                        ),

                                      ),
                                      child: Text(
                                        mixed_seeds![index],
                                        style: RegularTextStyle.regular18600(!isTaped![index]? whiteColor : Colors.black87)

                                      ),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        tapedIndex = index;
                                        if (kDebugMode) {
                                          print(tapedIndex);
                                        print(mixed_seeds![tapedIndex!]);
                                        }
                                        // print(widget.seed[tapedIndex!]);
                                        for(int i=0;i<mixed_seeds!.length;i++){
                                          if(index == i) {
                                            isTaped![index] = true;
                                          } else {
                                            isTaped![i]= false;
                                          }
                                        }
                                      });
                                    },
                                  );
                                },
                                )
                            )
                        ),
                        GestureDetector(
                          child: Container(
                              width: width*0.7,
                              height: height*0.08,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    gradientColor7,
                                    gradientColor8
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child:  Text(
                                'Verify',
                                textAlign: TextAlign.center,
                                style: LargeTextStyle.large20700(whiteColor)
                              )
                          ),
                          onTap: (){
                            // if(tapedIndex == null){
                            //   alert("please select your $random th seed word");
                            // } else {
                            //   if(mixed_seeds![tapedIndex!] == seed!.split("  ")[random!]){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context)
                            //   => const BottomNavigationPage()),
                            // );
                            //   } else {
                            //     setState(() {
                            //       mixed_seeds!.shuffle(Random());
                            //       random = Random().nextInt(12);
                            //     });
                            //   }
                            // }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
