import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Home/home_page.dart';
import 'package:web3dart/web3dart.dart';
import '../Constants/colors.dart';
import 'package:bip39/bip39.dart' as bip39;
// import 'package:http/http.dart' as http;

class CreateNewWalletPage3 extends StatefulWidget {
  const CreateNewWalletPage3({super.key});

  @override
  State<CreateNewWalletPage3> createState() => _CreateNewWalletPage3State();
}

class _CreateNewWalletPage3State extends State<CreateNewWalletPage3> {
  late TextEditingController searchController = TextEditingController();
  bool visibility = false;
  String? mnemonic;
  String? privateKey;
  String? publicKey;
  String? publicAddress;
  String? responseData;

  Web3Client? client;

  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  List<String> mnemonicWords = walletResponse.mnemonicSeed.split(' ');

  Future<void> loadResponseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('seed');
    setState(() {
      responseData = storedData ?? "no data";
    });
  }

  // getPrivateKey(String mnemonic) async {
  //   final seed = bip39.mnemonicToSeed(mnemonic);
  //   final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
  //   privateKey = await HEX.encode(master.key);
  //   getPublicKey(privateKey!);
  // }

  // Future<Map<String, dynamic>> fetchMoneroInfo() async {
  //   final response = await http.get(
  //     Uri.parse('https://api.coinpaprika.com/v1/tickers/xmr-monero'),
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load Monero information');
  //   }
  // }

  // getPublicKey(String privateKey) async {
  //   final private = EthPrivateKey.fromHex(privateKey);
  //   publicKey = await private.address.toString();
  //   print(publicKey); //rinkeby.infura.io/v3
  //   String rpcUrl = 'https://rpc.ankr.com/eth_goerli';
  //   final credentials = EthPrivateKey.fromHex(privateKey);
  //   final client = Web3Client(rpcUrl, http.Client());
  //   final address = credentials.address;
  //   print(address);
  //   final balance = await client.getBalance(address);
  //   debugPrint("Balance, ${balance}");
  // }

  // loadKeys() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   privateKey = prefs.getString('privateKey');
  //   publicKey = prefs.getString('publicKey');
  //   mnemonic = prefs.getString('mnemonic');
  // }

  // setKeys() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('privateKey', privateKey!);
  //   prefs.setString('publicKey', publicKey!);
  //   prefs.setString('mnemonic', mnemonic!);
  // }

  // getCoin() async {
  //   CoinGeckoApi api = CoinGeckoApi();
  //   final result = await api.coins.getCoinOHLC(
  //     id: 'monero',
  //     vsCurrency: 'usd',
  //     days: 7,
  //   );
  //   if (!result.isError) {
  //     print('getCoinOHLC method returned result');
  //     result.data.forEach(
  //       (item) => print(
  //         '${item.timestamp}: open = ${item.open}, high = ${item.high}, low = ${item.low}, close = ${item.close}',
  //       ),
  //     );
  //   } else {
  //     print(
  //         'getCoinOHLC method returned error ${result.errorCode}: ${result.errorMessage}');
  //   }
  // }

  // getkeys() async {
  //   var url = Uri.parse("http://95.217.91.73:3000/create");
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   http.get(url).then((http.Response response) {
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       KeyModel resultData = KeyModel.fromJson(jsonResponse);
  //       setState(() {
  //         List<String> temp = resultData.privateKey.split(" ");
  //         print(temp.length);
  //         mnemonic = temp.take(12).join("  ");
  //         publicAddress = resultData.publicKey;
  //         prefs.setString('publicAddress', publicAddress!);
  //         prefs.setString('seed', mnemonic!);
  //         print(mnemonic);
  //         print(publicAddress);
  //       });
  //     }
  //   });
  // }

  // saveFile(String text) async {
  //   var paths = await ExternalPath.getExternalStorageDirectories();
  //   Directory dir = Directory(paths[0]);
  //   List<FileSystemEntity> lister = await dir.list(recursive: false).toList();

  //   final file = File('${lister.first.path}/seed.txt');
  //   file.writeAsString(text).then((value) {
  //     alert("your seed file saved to ${file.path}");
  //   });
  // }

  copyFile() async {
    Clipboard.setData(ClipboardData(text: walletResponse.mnemonicSeed))
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("your seed copied to clipboard")));
    });
  }

  @override
  void initState() {
    // getkeys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color(0xff182C4B),
        appBar: AppBar(
          leading: GestureDetector(
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
          backgroundColor: const Color(0xff182C4B),
          centerTitle: true,
          title: Text("Create New Wallet",
              style: LargeTextStyle.large20500(whiteColor)),
        ),
        body: Column(
          children: [
            // GestureDetector(
            //   child: Container(
            //     margin: const EdgeInsets.only(left: 30),
            //     child: const Icon(
            //       Icons.arrow_back_ios,
            //       color: textColor,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // SizedBox(
            //   height: height * 0.02,
            // ),
            Container(
              width: width * 0.2,
              height: height * 0.09,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/shield.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.symmetric(vertical: 1),
              width: MediaQuery.sizeOf(context).width / 1.3,
              decoration: BoxDecoration(
                color: Colors.red
                    .withOpacity(0.1), // Set warning color with opacity
                borderRadius: BorderRadius.circular(10), // Rounded corners
                border: Border.all(color: Colors.red), // Red border
              ),
              child: const Text(
                "Warning: Please keep your mnemonic seed secure, this can be used for wallet recovery!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            // Text('Your Secret Phrase is this, keep it protected!',
            //     textAlign: TextAlign.center,
            //     style: RegularTextStyle.regular15700(termsColor)),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
            //   child: Text(
            //     ' walletResponse.mnemonicSeed',
            //     style: RegularTextStyle.regular14600(whiteColor),
            //   ),
            // ),
            // SizedBox(
            //   height: height * 0.01,
            // ),

            // // Container(
            // //   width: width * 0.8,
            // //   child: Text(mnemonic == null ? "data" : mnemonic!,
            // //       textAlign: TextAlign.center,
            // //       style: RegularTextStyle.regular15700(whiteColor)),
            // // ),
            // SizedBox(
            //   height: height * 0.05,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       child: Container(
            //           width: width * 0.35,
            //           height: 60,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(40),
            //             gradient: const LinearGradient(
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               colors: [buttonGradient1, buttonGradient2],
            //             ),
            //             boxShadow: const [
            //               BoxShadow(
            //                 offset: Offset(1, 1),
            //                 color: whiteColor,
            //                 blurRadius: 5.0,
            //               ),
            //             ],
            //           ),
            //           alignment: Alignment.center,
            //           child: Text('Save',
            //               textAlign: TextAlign.center,
            //               style: RegularTextStyle.regular18600(
            //                   whiteColor))),
            //       onTap: () {
            //         // saveFile(mnemonic!);
            //       },
            //     ),
            //     SizedBox(
            //       width: width * 0.1,
            //     ),
            //     GestureDetector(
            //       child: Container(
            //           width: width * 0.35,
            //           height: 60,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(40),
            //             boxShadow: const [
            //               BoxShadow(
            //                 offset: Offset(1, 1),
            //                 color: whiteColor,
            //                 blurRadius: 5.0,
            //               ),
            //             ],
            //             gradient: const LinearGradient(
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               colors: [gradientColor5, buttonGradient3],
            //             ),
            //           ),
            //           alignment: Alignment.center,
            //           child: Text('Copy',
            //               textAlign: TextAlign.center,
            //               style: RegularTextStyle.regular18600(
            //                   whiteColor))),
            //       onTap: () {
            //         // copyFile();
            //       },
            //     ),
            //   ],
            // ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                ),
                itemCount: mnemonicWords.length,
                itemBuilder: (context, index) {
                  int displayIndex = index + 1;
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        Container(
                          height: 45,
                          width: 35,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: gradientColor1,
                            borderRadius: BorderRadius.circular(4),
                            border: const Border.fromBorderSide(
                                BorderSide(color: Colors.blue)),
                          ),
                          child: Text(
                            displayIndex.toString(),
                            textAlign: TextAlign.center,
                            style: RegularTextStyle.regular16bold(whiteColor),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text(
                          mnemonicWords[index],
                          textAlign: TextAlign.center,
                          style: RegularTextStyle.regular16700(whiteColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // SizedBox(
            //   height: height * 0.04,
            // ),

            // SizedBox(
            //   height: height * 0.10,
            // ),
            // SizedBox(
            //   width: width * 0.8,
            //   child: Text(
            //       'On the Next Page you’ll see these 12 words scrambled arrange them in order to verify',
            //       textAlign: TextAlign.center,
            //       style: LightTextStyle.light12300(whiteColor)),
            // ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                      width: width * 0.30,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            color: whiteColor,
                            blurRadius: 5.0,
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [gradientColor5, buttonGradient3],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Copy',
                          textAlign: TextAlign.center,
                          style: RegularTextStyle.regular18600(whiteColor))),
                  onTap: () {
                    copyFile();
                  },
                ),
                GestureDetector(
                  child: Container(
                      width: width * 0.30,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [gradientColor7, gradientColor8],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Next',
                          textAlign: TextAlign.center,
                          style: LargeTextStyle.large20700(whiteColor))),
                  onTap: () async {
                    // ApiServiceForADDAssets().createPortfolio1();

                    Get.to(() => const BottomNavigationPage());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           const BottomNavigationPage()),
                    // );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
