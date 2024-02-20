import 'dart:convert';
import 'dart:io';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:web3dart/web3dart.dart';
import '../Constants/colors.dart';
import '../Model/key_model.dart';
import '../global.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:http/http.dart' as http;

import 'create_new_wallet_4.dart';

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

  Future<void> loadResponseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('seed');
    setState(() {
      responseData = storedData ?? "no data";
    });
  }

  getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    privateKey = await HEX.encode(master.key);
    getPublicKey(privateKey!);
  }

  Future<Map<String, dynamic>> fetchMoneroInfo() async {
    final response = await http.get(
      Uri.parse('https://api.coinpaprika.com/v1/tickers/xmr-monero'),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Monero information');
    }
  }

  getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    publicKey = await private.address.toString();
    print(publicKey); //rinkeby.infura.io/v3
    String rpcUrl = 'https://rpc.ankr.com/eth_goerli';
    final credentials = EthPrivateKey.fromHex(privateKey);
    final client = Web3Client(rpcUrl, http.Client());
    final address = credentials.address;
    print(address);
    final balance = await client.getBalance(address);
    debugPrint("Balance, ${balance}");
  }

  loadKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privateKey = prefs.getString('privateKey');
    publicKey = prefs.getString('publicKey');
    mnemonic = prefs.getString('mnemonic');
  }

  setKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('privateKey', privateKey!);
    prefs.setString('publicKey', publicKey!);
    prefs.setString('mnemonic', mnemonic!);
  }

  getCoin() async {
    CoinGeckoApi api = CoinGeckoApi();
    final result = await api.coins.getCoinOHLC(
      id: 'monero',
      vsCurrency: 'usd',
      days: 7,
    );
    if (!result.isError) {
      print('getCoinOHLC method returned result');
      result.data.forEach(
        (item) => print(
          '${item.timestamp}: open = ${item.open}, high = ${item.high}, low = ${item.low}, close = ${item.close}',
        ),
      );
    } else {
      print(
          'getCoinOHLC method returned error ${result.errorCode}: ${result.errorMessage}');
    }
  }

  getkeys() async {
    var url = Uri.parse("http://95.217.91.73:3000/create");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.get(url).then((http.Response response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        KeyModel resultData = KeyModel.fromJson(jsonResponse);
        setState(() {
          List<String> temp = resultData.privateKey.split(" ");
          print(temp.length);
          mnemonic = temp.take(12).join("  ");
          publicAddress = resultData.publicKey;
          prefs.setString('publicAddress', publicAddress!);
          prefs.setString('seed', mnemonic!);
          print(mnemonic);
          print(publicAddress);
        });
      }
    });
  }

  saveFile(String text) async {
    var paths = await ExternalPath.getExternalStorageDirectories();
    Directory dir = Directory(paths[0]);
    List<FileSystemEntity> lister = await dir.list(recursive: false).toList();

    final file = File('${lister.first.path}/seed.txt');
    file.writeAsString(text).then((value) {
      alert("your seed file saved to ${file.path}");
    });
  }

  copyFile() async {
    Clipboard.setData(ClipboardData(text: mnemonic!)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("your seed copied to clipboard")));
    });
  }

  @override
  void initState() {
    getkeys();
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
          // height: height,
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
                height: height,
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
                      height: height * 0.04,
                    ),
                    Container(
                        width: width * 0.2,
                        height: width * 0.18,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/shield.png"),
                          fit: BoxFit.fill,
                        ))),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text('Your Secret Phrase is this, keep it protected!',
                        textAlign: TextAlign.center,
                        style: RegularTextStyle.regular15700(termsColor)),
                    Text(
                      responseData ?? "no data",
                      style: RegularTextStyle.regular14600(whiteColor),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Container(
                      width: width * 0.8,
                      child: Text(mnemonic == null ? "" : mnemonic!,
                          textAlign: TextAlign.center,
                          style: RegularTextStyle.regular15700(whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                              width: width * 0.35,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [buttonGradient1, buttonGradient2],
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1, 1),
                                    color: whiteColor,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text('Save',
                                  textAlign: TextAlign.center,
                                  style: RegularTextStyle.regular18600(
                                      whiteColor))),
                          onTap: () {
                            // saveFile(mnemonic!);
                          },
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        GestureDetector(
                          child: Container(
                              width: width * 0.35,
                              height: 60,
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
                                  style: RegularTextStyle.regular18600(
                                      whiteColor))),
                          onTap: () {
                            // copyFile();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.14,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: Text(
                          'On the Next Page you’ll see these 12 words scrambled arrange them in order to verify',
                          textAlign: TextAlign.center,
                          style: LightTextStyle.light12300(whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GestureDetector(
                      child: Container(
                          width: width * 0.8,
                          height: height * 0.09,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateNewWalletPage4(
                                  // seed: mnemonic!.split("  "),
                                  )),
                        );
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
