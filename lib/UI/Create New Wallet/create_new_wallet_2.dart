import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/API/createWallet/createnewwallet.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'create_new_wallet_3.dart';

class CreateNewWalletPage2 extends StatefulWidget {
  const CreateNewWalletPage2({super.key});

  @override
  State<CreateNewWalletPage2> createState() => _CreateNewWalletPage2State();
}

class _CreateNewWalletPage2State extends State<CreateNewWalletPage2> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = false;

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

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
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                width: width,
                height: height * 0.88,
                margin: EdgeInsets.only(top: height * 0.02),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/background_new_wallet1.png"),
                  fit: BoxFit.fill,
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text("Create New Wallet",
                        style: LargeTextStyle.large20500(whiteColor)),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Text("Wallet Name",
                        style: RegularTextStyle.regular15700(termsColor)),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(
                          left: width * 0.15, right: width * 0.15),
                      alignment: Alignment.center,
                      child: TextField(
                        // autofocus: true,
                        cursorColor: Colors.blue,
                        controller: userController,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        style: RegularTextStyle.regular16600(whiteColor),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                          ),
                          fillColor: fillColor,
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          suffixIcon: GestureDetector(
                            child: !visibility
                                ? Container()
                                : const Icon(
                                    Icons.close,
                                    color: termsColor,
                                  ),
                            onTap: () {
                              setState(() {
                                userController.clear();
                              });
                            },
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onChanged: (text) {
                          setState(() {
                            visibility = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text("Wallet Password",
                        style: RegularTextStyle.regular15700(termsColor)),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(
                          left: width * 0.15, right: width * 0.15),
                      alignment: Alignment.center,
                      child: TextField(
                        // autofocus: true,
                        cursorColor: Colors.blue,
                        controller: passwordController,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        style: RegularTextStyle.regular16600(whiteColor),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                          ),
                          fillColor: fillColor,
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: borderColor, width: 1.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          suffixIcon: GestureDetector(
                            child: !visibility
                                ? Container()
                                : const Icon(
                                    Icons.close,
                                    color: termsColor,
                                  ),
                            onTap: () {
                              setState(() {
                                passwordController.clear();
                              });
                            },
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onChanged: (text) {
                          setState(() {
                            visibility = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.75,
                      child: Text(
                        "On the Next Page you’ll see a series of 12 words This is your unique and private seed and it is the ONLY way to recover your wallet in case of loss or malfunction. It is YOUR responsibility to write it down and store it in a safe place outside of the Stone Wallet app.",
                        style: RegularTextStyle.regular14400(whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    GestureDetector(
                      child: Container(
                          width: width * 0.9,
                          height: height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              // stops: [0.1, 0.3, 0.7, 0.9],
                              colors: [gradientColor7, gradientColor8],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: isLoading == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text('I Understand. Show me my seed',
                                  textAlign: TextAlign.center,
                                  style: RegularTextStyle.regular18600(
                                      whiteColor))),
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        walletResponse = await ApiServiceForCreateWallet()
                            .createWallet(
                                userController.text, passwordController.text);
                        if (walletResponse.mnemonicSeed.isNotEmpty) {
                          setState(() {
                            isLoading = false;
                          });
                          ApiServiceForADDAssets().createPortfolio1();
                          Get.to(() => const CreateNewWalletPage3());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const CreateNewWalletPage3()),
                          // );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
