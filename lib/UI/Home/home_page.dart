
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Home/portfolio_page.dart';
import 'package:stone_wallet_main/UI/Home/setting_page.dart';
import 'package:stone_wallet_main/UI/Home/stocks_page.dart';
import '../AddressBook/address_book.dart';
import '../Connection And Sync/connection_and_sync.dart';
import '../Constants/colors.dart';
import '../Constants/text_styles.dart';
import '../Help And Support/help_and_support.dart';
import '../Model/settings_model.dart';
import '../Other Settings/other_settings.dart';
import '../Privacy/privacy.dart';
import '../Security And Backup/security_and_backup.dart';
import '../Trips/trips.dart';
import '../Wallet/wallet.dart';
import 'mywallet_balance_page.dart';
import 'notification_page.dart';

class BottomNavigationPage extends StatefulWidget {

  const BottomNavigationPage( {Key? key}): super(key: key);

  @override
  BottomNavigationPageState createState() => BottomNavigationPageState();
}

class BottomNavigationPageState extends State<BottomNavigationPage> {

  GlobalKey bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // List<Widget> widgetList = [MyWalletBalancePage(), StocksPage(), PortfolioPage(), SettingPage(),];
  List<Widget> widgetList = [
    const MyWalletBalancePage(),
    const TripsPage(),
    const StocksPage(),
    const PortfolioPage(),
    const SettingPage()
  ];
  bool _isClickedDrawer = false;

  List<SettingModel> settings = [
    SettingModel(name: "Connection and sync", image: "assets/Icons/sync.png"),
    SettingModel(name: "Address book", image: "assets/Icons/address-book.png"),
    SettingModel(name: "Privacy and sync", image: "assets/Icons/view.png"),
    SettingModel(name: "Security and backup", image: "assets/Icons/lock.png"),
    SettingModel(name: "Display settings", image: "assets/Icons/light-mode.png"),
    SettingModel(name: "Help & Support", image: "assets/Icons/support.png"),
    SettingModel(name: "Privacy settings", image: "assets/Icons/check.png"),
  ];



  @override
  void initState() {
    setState(() {
      // selectedPos = widget.index;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          leading: GestureDetector(
            child: const Icon(Icons.list, color: buttonColor, size: 40,),
            onTap: () {
              setState(() {
                _isClickedDrawer = true;
              });
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add_alert,
                color: buttonColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)
                  => const NotificationPage()),
                );
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background1.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: width,
            height: height,
            child: widgetList.elementAt(_selectedIndex),
          ),
            Visibility(
              visible: _isClickedDrawer,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: width*0.6,
                  height: 500,
                  decoration:  const BoxDecoration(
                    color: drawerColor2,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ListView(
                    children: [
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                            margin: const EdgeInsets.only(left: 20),
                            child: Icon(Icons.account_circle_rounded,
                              size: width*0.1,color:  buttonColor,),
                          ),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.close,
                                color:  buttonColor, size: width*0.06,),
                            ),
                            onTap: (){
                              setState(() {
                                _isClickedDrawer = false;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: width, height: 1,
                        color:  drawerColor,
                      ),
                      const SizedBox(height: 10,),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const WalletPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/wallet-filled-money-tool.png",height: 20,width: 20,color: iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Wallets",
                                        style: RegularTextStyle.regular14600(whiteColor)
                                       ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const ConnectionAndSyncPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/sync.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Connection and sync",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const AddressBookPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/address-book.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Address Book",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const SecurityAndBackupPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/lock.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Security and Backup",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const PrivacyPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/view.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Privacy",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const OtherSettingsPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),

                                      Image.asset("assets/Icons/settings.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Other Settings",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                =>  const HelpAndSupportPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      Image.asset("assets/Icons/support.png",height: 20,width: 20,color:  iconColor,),
                                      SizedBox(width: width*0.05,),
                                       Text("Help & Support",
                                        style: RegularTextStyle.regular14600(whiteColor),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(width: width, height: 1,
                                    color: drawerColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]

        ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: whiteColor,
        inactiveColor:  iconColor,
        backgroundColor: bottomBackgroundColor,
        currentIndex: _selectedIndex,
        height: 70,
        onTap: _onItemTapped,
        iconSize: 30,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/Icons/wallet-filled-money-tool.png",height: 30,width: 30,color:  iconColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.flight),
            icon: Image.asset("assets/Icons/plane.png",height: 30,width: 30,color:  iconColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Icons/trend.png", height: 30,width: 30,color: iconColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Icons/pie-chart-2.png",height: 30,width: 30,color: iconColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Icons/gear.png",height: 30,width: 30,color: iconColor,),
            label: '',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.wallet))
        ],
      ),


    );
  }
}