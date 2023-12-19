import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';

import '../Constants/colors.dart';

class DomainLookupPage extends StatefulWidget {
  const DomainLookupPage({super.key});

  @override
  State<DomainLookupPage> createState() => _DomainLookupPageState();
}

class _DomainLookupPageState extends State<DomainLookupPage> {

  bool twitter = true;
  bool mastodon = true;
  bool yatService = true;
  bool unstoppableDomains = true;
  bool openAlias = true;
  bool ethereumNameService = true;


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor:  appBarBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarBackgroundColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
        ),
        title:  Text("Domain lookups", 
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
                     Text("Twitter",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: twitter,
                      onChanged: (value) => setState(() => twitter = value),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(width: width, height: 1,
                color:  drawerColor,
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
                     Text("Mastodon",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: mastodon,
                      onChanged: (value) => setState(() => mastodon = value),
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
                     Text("Yat service",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: yatService,
                      onChanged: (value) => setState(() => yatService = value),
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
                     Text("Unstoppable Domains",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: unstoppableDomains,
                      onChanged: (value) => setState(() => unstoppableDomains = value),
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
                     Text("OpenAlias",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: openAlias,
                      onChanged: (value) => setState(() => openAlias = value),
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
                     Text("Ethereum Name Service",
                      style: RegularTextStyle.regular15600(whiteColor) ),
                    Switch.adaptive(
                      value: ethereumNameService,
                      onChanged: (value) => setState(() => ethereumNameService = value),
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
