import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/Responses/travel_post_response.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Create%20New%20Wallet/create_new_wallet.dart';
import 'package:stone_wallet_main/UI/login/createwallet_register.dart';

class NewWalletLoginPage extends StatefulWidget {
  const NewWalletLoginPage({super.key});

  @override
  State<NewWalletLoginPage> createState() => _NewWalletLoginPageState();
}

class _NewWalletLoginPageState extends State<NewWalletLoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  TravelPostResponse travelPostResponse = TravelPostResponse();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      color: gradientColor1,
      child: SafeArea(
        child: ListView(children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [gradientColor1, gradientColor2],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Image.asset(
                      "assets/images/welcome_logo.png",
                      height: 110,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      "Login To \nSTONE WALLET",
                      style: NasalTextStyle.nasal(whiteColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Column(
                      children: [
                        Text(
                          "User Name",
                          style: RegularTextStyle.regular16600(whiteColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          padding: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          alignment: Alignment.center,
                          child: TextField(
                            // autofocus: true,
                            cursorColor: Colors.blue,
                            controller: userNameController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            style: RegularTextStyle.regular16600(whiteColor),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                              ),
                              fillColor: fillColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Password",
                          style: RegularTextStyle.regular16600(whiteColor),
                        ),
                        const SizedBox(
                          height: 5,
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
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                              ),
                              fillColor: fillColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: borderColor, width: 1.0),
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 65,
                      width: width * 0.75,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor3,
                              surfaceTintColor: blackColor,
                              shadowColor: whiteColor,
                              elevation: 4),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (kDebugMode) {
                              print(userNameController.text);
                              print(passwordController.text);
                            }
                            var response = await ApiProvider().processLogin(
                                userNameController.text,
                                passwordController.text);

                            if (response.message == "Login successful") {
                              setState(() {
                                isLoading = false;
                              });
                              var snackBar =
                                  SnackBar(content: Text(response.message!));
                              if (context.mounted) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateNewWalletPage()),
                                );
                              }
                            } else if (response.message ==
                                " Invalid login credentials") {
                              var snackBar =
                                  SnackBar(content: Text(response.message!));
                              if (context.mounted)
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                            } else {
                              var snackBar = const SnackBar(
                                  content: Text("Something went wrong"));
                              if (context.mounted)
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context)
                            //   => const BottomNavigationPage()),
                            // );
                          },
                          child: isLoading == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text("Login",
                                  textAlign: TextAlign.center,
                                  style: LargeTextStyle.large20700(textColor))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: RegularTextStyle.regular16600(whiteColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateNewWalletRegisterPage(),
                                  ));
                            },
                            child: Text(
                              'Sign Up',
                              style: NasalLoginTextStyle.nasal(gradientColor3),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: height * 0.14,
                  left: width * 0.55,
                  child: Image.asset(
                    "assets/Icons/eth.png",
                    height: 25,
                    width: 25,
                  )),
              Positioned(
                  top: height * 0.05,
                  left: width * 0.3,
                  child: Image.asset(
                    "assets/Icons/btc.png",
                    height: 40,
                    width: 40,
                  )),
              Positioned(
                  top: height * 0.25,
                  left: width * 0.8,
                  child: Transform(
                      transform: Matrix4.rotationZ(
                        -3.1415926535897932 / 3,
                      ),
                      child: Image.asset(
                        "assets/Icons/btc.png",
                        height: 34,
                        width: 34,
                      ))),
              Positioned(
                  top: height * 0.22,
                  left: width * 0.07,
                  child: Image.asset(
                    "assets/Icons/iitc.png",
                    height: 35,
                    width: 35,
                  )),
              Positioned(
                  top: height * 0.1,
                  left: width * 0.8,
                  child: Image.asset(
                    "assets/Icons/monero.png",
                    height: 35,
                    width: 35,
                  )),
              Positioned(
                  top: height * 0.8,
                  left: width * 0.1,
                  child: Transform(
                      transform: Matrix4.rotationZ(51),
                      child: Image.asset(
                        "assets/Icons/eth.png",
                        height: 35,
                        width: 25,
                      ))),
              Positioned(
                  top: height * 0.93,
                  left: width * 0.25,
                  child: Transform(
                      transform: Matrix4.rotationZ(30),
                      child: Image.asset(
                        "assets/Icons/monero.png",
                        height: 35,
                        width: 35,
                      ))),
              Positioned(
                  top: height * 0.8,
                  left: width * 0.5,
                  child: Transform(
                      transform: Matrix4.rotationZ(51),
                      child: Image.asset(
                        "assets/Icons/iitc.png",
                        height: 35,
                        width: 35,
                      ))),
              Positioned(
                  top: height * 0.9,
                  left: width * 0.6,
                  child: Transform(
                      transform: Matrix4.rotationZ(100),
                      child: Image.asset(
                        "assets/Icons/iitc.png",
                        height: 25,
                        width: 25,
                      ))),
              Positioned(
                  top: height * 0.85,
                  left: width * 0.8,
                  child: Transform(
                      transform: Matrix4.rotationZ(50),
                      child: Image.asset(
                        "assets/Icons/btc.png",
                        height: 40,
                        width: 40,
                      ))),
            ],
          ),
        ]),
      ),
    ));
  }
}
