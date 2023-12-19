import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

class TrocadorProvidersPage extends StatefulWidget {
  const TrocadorProvidersPage({super.key});

  @override
  State<TrocadorProvidersPage> createState() => _TrocadorProvidersPageState();
}

class _TrocadorProvidersPageState extends State<TrocadorProvidersPage> {

  bool swapter = true;
  bool steathEx = true;
  bool simpleswap = true;
  bool swapuzChangeNow = true;
  bool changeHero = true;
  bool fixedFloat = true;
  bool letsExchange = true;
  bool exolix = true;
  bool godex = true;
  bool exch = true;
  bool coinCraddle = true;


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
        title:  Text("Trocador Providers",
            style: LargeTextStyle.large20700(whiteColor)
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [

          const SizedBox(height: 20,),
          Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Swapter",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: swapter,
                      onChanged: (value) => setState(() => swapter = value),
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
                     Text("StealthEx",
                      style: RegularTextStyle.regular15600(whiteColor) ,),
                    Switch.adaptive(
                      value: steathEx,
                      onChanged: (value) => setState(() => steathEx = value),
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
                     Text("Simpleswap",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: simpleswap,
                      onChanged: (value) => setState(() => simpleswap = value),
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
                     Text("SwapuzChangeNow",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: swapuzChangeNow,
                      onChanged: (value) => setState(() => swapuzChangeNow = value),
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
                     Text("Changehero",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: changeHero,
                      onChanged: (value) => setState(() => changeHero = value),
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
                     Text("FixedFloat",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: fixedFloat,
                      onChanged: (value) => setState(() => fixedFloat = value),
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
                     Text("LetsExchange",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: letsExchange,
                      onChanged: (value) => setState(() => letsExchange = value),
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
                     Text("Exolix",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: exolix,
                      onChanged: (value) => setState(() => exolix = value),
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
                     Text("Godex",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: godex,
                      onChanged: (value) => setState(() => godex = value),
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
                     Text("Exch",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: exch,
                      onChanged: (value) => setState(() => exch = value),
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
                     Text("CoinCraddle",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: coinCraddle,
                      onChanged: (value) => setState(() => coinCraddle = value),
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

        ],

      ),
    );
  }
}
