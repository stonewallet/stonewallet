import 'package:flutter/material.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart';
import 'package:stone_wallet_main/Responses/travel_list_response.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import '../../API/api_provider.dart';
import '../Constants/colors.dart';
import 'new_trip.dart';


class DeleteExpensePage extends StatefulWidget {
  final Travel2Response travel2response ;
  const DeleteExpensePage(this.travel2response,{super.key});

  @override
  State<DeleteExpensePage> createState() => _DeleteExpensePageState();
}

class _DeleteExpensePageState extends State<DeleteExpensePage> {

  // List<TravelList> travelList = <TravelList>[];
  int? id;
  bool isLoading = false;



  @override
  void initState() {
    // fetch();
    super.initState();
  }

  // fetch() async {
  //   travelList.clear();
  //   travelList = await ApiProvider().processTravel();
  //   setState(() {
  //
  //   });
  //   print("travelList $travelList");
  //
  //
  // }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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

        body: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background_new_wallet.png"),
                        fit: BoxFit.fill,
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height*0.04,),
                      Container(
                        width: width,
                        height: height,
                        decoration:  const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [newGradient5,
                                newGradient6],
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height*0.03,),
                            Text("Expenses",
                                style: LargeTextStyle.large20700(whiteColor)),
                            const SizedBox(height: 8,),
                            Container(width: width*0.25, height: 2, color:  lineColor,),
                            Container(width: width*0.9, height: 1, color:  lineColor2,),
                            SizedBox(height: height*0.05,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                const SizedBox(height: 20,),

                                // travelList.isEmpty ? const CircularProgressIndicator(color: whiteColor,) :
                                SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: widget.travel2response.expenses!.length ,
                                      itemBuilder: (c, i){
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 55,
                                                  width: width * 0.60,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: buttonColor2
                                                  ),
                                                  child: Center(
                                                    child: Text(widget.travel2response.expenses![i].expenseName!,
                                                        textAlign: TextAlign.center,
                                                        style: LargeTextStyle.large20700(whiteColor)),
                                                  )

                                                ),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                  onTap:(){
                                                    print(widget.travel2response.expenses![i].expenseName!);
                                                    widget.travel2response.expenses!.removeAt(i);
                                                  },
                                                    child: Icon(Icons.delete_outline, color: whiteColor,))
                                              ],
                                            ),
                                            const SizedBox(height: 30,),
                                          ],
                                        );
                                      }
                                  ),
                                ),
                                SizedBox(height: 15,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(
                                        height: 55,
                                        width: width * 0.7,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor2,
                                                surfaceTintColor: blackColor,
                                                shadowColor: whiteColor,
                                                elevation: 4
                                            ),
                                            onPressed: () async{

                                              print(widget.travel2response.expenses);

                                              setState(() {
                                                isLoading = true;
                                              });

                                              Map<String, dynamic> expense = {
                                                "trip_name": widget.travel2response.tripName,
                                                "product" : widget.travel2response.product,
                                                "expenses" : widget.travel2response.expenses
                                              };

                                              print(expense);
                                              print(widget.travel2response.expenses!.length);

                                              var response = await ApiProvider().processAddEvent(
                                                expense,   widget.travel2response.id!  );
                                              print(response);

                                              if(response.message != null){
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                Navigator.pop(context);
                                                var snackBar = SnackBar(content: Text(response.message!));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                              }else{
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                var snackBar = SnackBar(content: Text("Something gone wrong"));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                              }



                                            },
                                            child:
                                            isLoading == true ? CircularProgressIndicator(color: Colors.white,) :
                                            Text("Edit Expenses",
                                                textAlign: TextAlign.center,
                                                style: LargeTextStyle.large20700(whiteColor) )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,)



                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ]
        )
    );
  }
}
