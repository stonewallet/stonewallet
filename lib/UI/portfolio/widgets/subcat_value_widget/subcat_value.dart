import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/portfolio/controller/portfolip_controller.dart';

class SubCatListView extends StatefulWidget {
  const SubCatListView({super.key});

  @override
  State<SubCatListView> createState() => _SubCatListViewState();
}

class _SubCatListViewState extends State<SubCatListView> {
  late Future<Map<int, double>> _subCatTotalValues;
  final List<IconData> icons = [
    FontAwesome.bitcoin,
    Foundation.home,
    CupertinoIcons.money_dollar,
  ];

  late IconData icon;

  final controller = Get.put(PortfolioController());
  @override
  void initState() {
    super.initState();
    _subCatTotalValues = controller.getTotalValuesBySubCat();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, double>>(
        future: _subCatTotalValues,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final subCat = snapshot.data!.keys.elementAt(index);
                final totalValue = snapshot.data![subCat];
                if (subCat == 0) {
                  icon = icons[0];
                } else if (subCat == 1) {
                  icon = icons[1];
                } else if (subCat == 2) {
                  icon = icons[2];
                }
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.1,
                  height: 50,
                  child: Card(
                    color: transparent,
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              icon,
                              size: 20,
                              color: whiteColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              totalValue!.toStringAsFixed(2),
                              style: RegularTextStyle.regular15700(whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
