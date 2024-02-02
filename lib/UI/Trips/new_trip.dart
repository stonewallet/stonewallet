import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart' as trip;
import 'package:stone_wallet_main/Responses/travel_list_response.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Trips/add_new_expense.dart';
import 'package:stone_wallet_main/UI/Trips/add_new_purchase.dart';
import 'package:stone_wallet_main/UI/Trips/add_user_trip.dart';
import 'package:collection/collection.dart';
import '../../Responses/travel2_response.dart';
import '../Constants/colors.dart';
import 'delete_expense.dart';
import 'edit_trip.dart';


class NewTripPage extends StatefulWidget {
  final int travelId;
  const NewTripPage(this.travelId, {super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {

  List<Product> events = [] ;
  List<Map<String, dynamic>> newData = [];
  int totalQuantity = 0;
  List numbers = [];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async{
    events.clear();
    setState(() {

    });
    travel2response = await ApiProvider().processTravel2(widget.travelId);
    await ApiProvider().processTravel2(widget.travelId).then((value) {
      events.clear();

      events.addAll(value.product! as Iterable<Product>);
      for(int i=0; i<=events.length -1; i++ ){
        newData.add({
          "Item Name" : events[i].productName,
          "Quantity" : events[i].quantity,
          "Bought" : events[i].pricePaid,
          "Sold" : events[i].priceSold
        });
        // totalQuantity = events[i].quantity! ;
        numbers.add(events[i].quantity!);
      }
      totalQuantity = numbers.reduce((value, element) => value + element);
      setState(() {

      });

    });

  }

  trip.Travel2Response travel2response = trip.Travel2Response();

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      print("travel2response ${travel2response.id}");
      print(numbers);
    }



    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<DataColumn> getColumns() {
      return newData.isNotEmpty
          ? newData.first.keys
          .map((String key) => DataColumn(
        label: SizedBox(
            width: 75,
            child: Center(child: Text(key, style: RegularTextStyle.regular14600(whiteColor) ))),
      ))
          .toList()
          : [];
    }



    print("totalQuantity $totalQuantity");
    List<DataRow> getRows() {
      return newData.map((Map<String, dynamic> rowData) {
        return DataRow(
          cells: rowData.keys.map((String key) {
            return DataCell(
              SizedBox(
                width: 75,
                  child: Center(child: Text(rowData[key].toString(), style: RegularTextStyle.regular14600(whiteColor) ,))),
            );
          }).toList(),
        );
      }).toList();
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appBarBackgroundColor,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: whiteColor,),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_new_wallet.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.04,),
                  Container(
                    width: width,
                    height: height * 0.85,
                    decoration:  const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            newGradient5,
                            newGradient6
                          ],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: travel2response.id == null ? Center(child: SizedBox(
                        width: 50,height: 50,
                        child: CircularProgressIndicator(color: whiteColor,))) : Column(
                      children: [
                        SizedBox(height: height*0.03,),
                        Text("Trip ${travel2response.tripName}",
                            style: LargeTextStyle.large20700(whiteColor)),
                        const SizedBox(height: 8,),
                        Container(width: width*0.3, height: 2, color:  lineColor,),
                        Container(width: width*0.9, height: 1, color: lineColor2,),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>  EditTripPage(travel2response.id!, travel2response.tripName!, travel2response.product!,
                                          travel2response.expenses!, travel2response.createdAt!)),
                                    ).then((value) {
                                      return fetch();
                                    });
                                  },
                                  child: Icon(Icons.edit, color: whiteColor,)),
                              SizedBox(width: 10,),
                              InkWell(
                                  onTap: () async{
                                    var response = await ApiProvider().processTravelDelete(travel2response.id!);
                                    if(response.message != null){
                                      var snackBar = SnackBar(content: Text(response.message!));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }else{
                                      var snackBar = SnackBar(content: Text("Something went wrong"));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  },
                                  child: Icon(Icons.delete, color: whiteColor))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date",
                                      style: RegularTextStyle.regular16600(whiteColor)),
                                  Text(travel2response.createdAt!,
                                    style: RegularTextStyle.regular16600(whiteColor),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Quantity",
                                      style: RegularTextStyle.regular16600(whiteColor)),
                                  Text(totalQuantity.toString(),
                                    style: RegularTextStyle.regular16600(whiteColor),)
                                ],
                              ),
                              const SizedBox(height: 15,),
                              SizedBox(
                                height: 150,
                                child: ListView(
                                  // padding: EdgeInsets.symmetric(horizontal: 10),
                                  // physics:,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    DataTable(

                                      headingRowHeight: 30,
                                      dataRowMaxHeight: double.infinity,       // Code to be changed.
                                      dataRowMinHeight: 30,
                                      columnSpacing: 5,
                                      border: TableBorder.all(color: lineColor2,borderRadius: BorderRadius.circular(15) ),
                                      // dataRowColor: MaterialStateProperty.all(Colors.transparent),

                                      columns: getColumns(),

                                      rows: getRows(),

                                    ),
                                  ],
                                ),
                              ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap:(){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context)
                                                =>  AddNewPurchasePage( travel2response)),
                                              ).then((value) {
                                                setState(() {

                                                });
                                                return fetch();

                                              });

                                            },
                                            child: Icon(Icons.add,color: whiteColor,))
                                      ],
                                    ),


                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Expenses", style: RegularTextStyle.regular18600(whiteColor)),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: lineColor2)
                                    ),
                                    child: ListView.builder(
                                      itemCount: travel2response.expenses!.length,
                                      itemBuilder: (BuildContext context, int index){
                                      return   Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(travel2response.expenses![index].expenseName!, style:  RegularTextStyle.regular16600(whiteColor)),
                                              Text("\$ ${travel2response.expenses![index].expenseAmount!.toString()}",style:  RegularTextStyle.regular16600(whiteColor))
                                            ],
                                          ),
                                          const SizedBox(height: 5,),

                                        ],
                                      );
                                    },
                                    ),

                                    // Column(
                                    //   children: [
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Text("Transport", style:  RegularTextStyle.regular16600(whiteColor)),
                                    //         Text("\$ ${travel2response.expenses!.transport.toString()}",style:  RegularTextStyle.regular16600(whiteColor))
                                    //       ],
                                    //     ),
                                    //     const SizedBox(height: 5,),
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Text("Hotel", style: RegularTextStyle.regular16600(whiteColor)),
                                    //         Text("\$ ${travel2response.expenses!.hotel.toString()}",style:  RegularTextStyle.regular16600(whiteColor),)
                                    //       ],
                                    //     ),
                                    //     const SizedBox(height: 5,),
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Text("Food", style:  RegularTextStyle.regular16600(whiteColor)),
                                    //         Text("\$ ${travel2response.expenses!.food.toString()}",style: RegularTextStyle.regular16600(whiteColor))
                                    //       ],
                                    //     ),
                                    //     const SizedBox(height: 5,),
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Text("Food", style:  RegularTextStyle.regular16600(whiteColor)),
                                    //         Text("\$ ${travel2response.expenses!.food.toString()}",style: RegularTextStyle.regular16600(whiteColor))
                                    //       ],
                                    //     ),
                                    //
                                    //     const SizedBox(height: 5,),
                                    //      Row(
                                    //       children: [
                                    //         InkWell(
                                    //             onTap: (){
                                    //               Navigator.push(
                                    //                 context,
                                    //                 MaterialPageRoute(builder: (context)
                                    //                 =>  AddNewExpensePage( travel2response)),
                                    //               ).then((value) {
                                    //                 return fetch();
                                    //               });
                                    //             },
                                    //             child: const Icon(Icons.add, color: whiteColor,)),
                                    //         Icon(Icons.remove, color: whiteColor,)
                                    //       ],
                                    //     )
                                    //
                                    //   ],
                                    // ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: MediaQuery.of(context).size.width * 0.45,
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context)
                                                =>  AddNewExpensePage( travel2response)),
                                              ).then((value) {
                                                setState(() {

                                                });
                                                return fetch();
                                              });
                                            },
                                            child: const Icon(Icons.add, color: whiteColor,)),
                                        SizedBox(width: 10,),
                                        InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context)
                                                =>  DeleteExpensePage( travel2response)),
                                              ).then((value) {
                                                setState(() {

                                                });
                                                return fetch();
                                              });
                                            },
                                            child: const Icon(Icons.remove, color: whiteColor,)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 15,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: lineColor2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Profit", style: RegularTextStyle.regular16600(whiteColor),),
                                    Text("\$ ${travel2response.profit!.toString()}",style: RegularTextStyle.regular16600(whiteColor),)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 45,
                                    width: width * 0.45,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonColor2,
                                            surfaceTintColor: blackColor,
                                            shadowColor: whiteColor,
                                            elevation: 4
                                        ),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context)
                                            => const AddUserTripPage()),
                                          );
                                        },
                                        child:  Text("Invite Trip Partner",
                                            textAlign: TextAlign.center,
                                            style: RegularTextStyle.regular16600(whiteColor)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45,
                                    width: width * 0.45,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonColor2,
                                            surfaceTintColor: blackColor,
                                            shadowColor: whiteColor,
                                            elevation: 4
                                        ),
                                        onPressed: (){
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context)
                                          //   => const NewTripPage()),
                                          // );
                                        },
                                        child:  Text("End Trip",
                                            textAlign: TextAlign.center,
                                            style: RegularTextStyle.regular16600(whiteColor)
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),

                            ],
                          ),
                        ),
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
