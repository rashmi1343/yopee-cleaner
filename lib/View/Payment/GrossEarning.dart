import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'Earning.dart';

class GrossEarningScreen extends StatefulWidget {
  GrossEarningScreenState createState() => GrossEarningScreenState();
}

class GrossEarningScreenState extends State<GrossEarningScreen> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getGrossEarningsApi(
          provider.monthdropdownvalue.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xff00000029),
                offset: Offset(0, 0.0),
                blurRadius: 6.0,
              )
            ]),
            child: AppBar(
              backgroundColor: Color(0xff0072C6),
              automaticallyImplyLeading: true,
              elevation: 4,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EarningScreen()));
                  // Navigator.of(context).push(PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 400),
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         EarningScreen(),
                  //     transitionsBuilder: (BuildContext context,
                  //         Animation<double> animation,
                  //         Animation<double> secondaryAnimation,
                  //         Widget child) {
                  //       return new SlideTransition(
                  //         position: new Tween<Offset>(
                  //           //Left to right
                  //           begin: const Offset(-1.0, 0.0),
                  //           end: Offset.zero,
                  //
                  //           //Right to left
                  //           // begin: const Offset(1.0, 0.0),
                  //           // end: Offset.zero,
                  //
                  //           //top to bottom
                  //           // begin: const Offset(0.0, -1.0),
                  //           // end: Offset.zero,
                  //
                  //           //   bottom to top
                  //           // begin: Offset(0.0, 1.0),
                  //           // end: Offset.zero,
                  //         ).animate(animation),
                  //         child: child,
                  //       );
                  //     }
                  //     // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                  //     //   var begin = 0.0;
                  //     //   var end = 1.0;
                  //     //   var curve = Curves.ease;
                  //     //
                  //     //   var tween =
                  //     //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  //     //   return ScaleTransition(
                  //     //     scale: animation.drive(tween),
                  //     //     child: page,
                  //     //   );
                  //     // },
                  //     ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              centerTitle: true,
              title: const Text(
                "Gross Earnings",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SemiBold", color: Colors.white),
              ),
            ),
          ),
        ),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      width: 373,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff0000001A),
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          //BoxShadow
                        ],
                      ),
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 15, top: 25, bottom: 24, right: 23),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/earning/earning-icon.png",
                                        height: 39,
                                        width: 58,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                provider.objGrossEarningsResponse.data!
                                            .totalGrassEarning ==
                                        ""
                                    ? Container(
                                        margin: EdgeInsets.only(right: 21),
                                        child: Text(
                                          "₹0",
                                          style: TextStyle(
                                              fontFamily: "SemiBold",
                                              fontSize: 20,
                                              color: Color(0xff000000)),
                                        ),
                                      )
                                    : Container(
                                        constraints: BoxConstraints(
                                            maxHeight: double.infinity,
                                            maxWidth: 100),
                                        margin: EdgeInsets.only(right: 21),
                                        child: Text(
                                          "₹${provider.objGrossEarningsResponse.data!.totalGrassEarning.toString()}",
                                          style: TextStyle(
                                              fontFamily: "SemiBold",
                                              fontSize: 20,
                                              color: Color(0xff000000)),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // provider.objGrossEarningsResponse.data!.transcations.isEmpty
                    //     ? Center(
                    //         child: Container(),
                    //       )
                    //     :
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 22,
                          child: const Text(
                            "Transactions",
                            style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 15,
                                color: Color(0xff001F3F)),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color(0xff707070), width: 1)),
                          height: 27,
                          width: 120,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: DropdownButton(
                              // Initial Value
                              value: provider.monthdropdownvalue,
                              underline: SizedBox(),
                              hint: Text(
                                "Select Month",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Medium",
                                    color: Color(0xff555555)),
                              ),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Medium",
                                  color: Color(0xff555555)),
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: months.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                provider.setMonthDropDown(newValue);
                                provider.getGrossEarningsApi(
                                    provider.monthdropdownvalue.toString(),
                                    context);
                              },
                            ),
                            //     Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       child: Text(
                            //         "December",
                            //         style: TextStyle(
                            //             fontSize: 12,
                            //             fontFamily: "Medium",
                            //             color: Color(0xff555555)),
                            //       ),
                            //     ),
                            //     Container(child: Icon(Icons.keyboard_arrow_down))
                            //   ],
                            // ),
                          ),
                        )
                      ],
                    ),
                    provider.objGrossEarningsResponse.data!.transcations!
                            .isEmpty
                        ? Center(
                            child: Container(
                            margin: EdgeInsets.only(top: 200),
                            child: Text(
                              "No Transactions Available",
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 14,
                                  color: Colors.red),
                            ),
                          ))
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.objGrossEarningsResponse.data!
                                    .transcations!.length ??
                                0,
                            itemBuilder: (context, index) {
                              var myGrossListItem = provider
                                  .objGrossEarningsResponse.data!.transcations;

                              final DateTime? now =
                                  myGrossListItem[index].paymentDate;
                              final DateFormat formatter =
                                  DateFormat('dd MMM yyyy');
                              final String formatted = formatter.format(now!);
                              print(formatted);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 400),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          PaymentDetails(
                                              id: myGrossListItem[index]
                                                  .id
                                                  .toString()),
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
                                        return new SlideTransition(
                                          position: new Tween<Offset>(
                                            //Left to right
                                            // begin: const Offset(-1.0, 0.0),
                                            // end: Offset.zero,

                                            //Right to left
                                            begin: const Offset(1.0, 0.0),
                                            end: Offset.zero,

                                            //top to bottom
                                            // begin: const Offset(0.0, -1.0),
                                            // end: Offset.zero,

                                            //   bottom to top
                                            // begin: Offset(0.0, 1.0),
                                            // end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        );
                                      }
                                      // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                                      //   var begin = 0.0;
                                      //   var end = 1.0;
                                      //   var curve = Curves.ease;
                                      //
                                      //   var tween =
                                      //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      //   return ScaleTransition(
                                      //     scale: animation.drive(tween),
                                      //     child: page,
                                      //   );
                                      // },
                                      ));
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxHeight: double.infinity),
                                  width: 374,
                                  margin: EdgeInsets.only(
                                      right: 20, top: 10, left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF6F6FE),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      myGrossListItem![index]
                                                      .userVehicle!
                                                      .brand!
                                                      .image ==
                                                  "" ||
                                              myGrossListItem![index]
                                                      .userVehicle!
                                                      .brand!
                                                      .image ==
                                                  null
                                          ? Container(
                                              height: 48,
                                              width: 64,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xffCCCCCC))),
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 11,
                                                  top: 23),
                                              child: Image.asset(
                                                  "assets/images/carBrand/Suzuki.png"),
                                            )
                                          : Container(
                                              height: 48,
                                              width: 64,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xffCCCCCC))),
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 11,
                                                  top: 23),
                                              child: Image.network(
                                                  myGrossListItem![index]
                                                      .userVehicle!
                                                      .brand!
                                                      .image
                                                      .toString()),
                                            ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          myGrossListItem![index]
                                                          .userVehicle!
                                                          .brand!
                                                          .name ==
                                                      "" ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .brand!
                                                          .name ==
                                                      null ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .model!
                                                          .name ==
                                                      "" ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .model!
                                                          .name ==
                                                      null
                                              ? Container(
                                                  // height: 19,
                                                  margin: EdgeInsets.only(
                                                      left: 31,
                                                      top: 13,
                                                      bottom: 10),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "SemiBold",
                                                        color: Colors.black),
                                                  ),
                                                )
                                              : Container(
                                                  // height: 19,
                                                  margin: EdgeInsets.only(
                                                      left: 31,
                                                      top: 13,
                                                      bottom: 10),
                                                  child: Text(
                                                    "${myGrossListItem![index].userVehicle!.brand!.name} ${myGrossListItem![index].userVehicle!.model!.name}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "SemiBold",
                                                        color: Colors.black),
                                                  ),
                                                ),
                                          myGrossListItem![index]
                                                          .userVehicle!
                                                          .registrationNo ==
                                                      "" ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .registrationNo ==
                                                      null ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .vehicle!
                                                          .name ==
                                                      "" ||
                                                  myGrossListItem![index]
                                                          .userVehicle!
                                                          .vehicle!
                                                          .name ==
                                                      null
                                              ? Container(
                                                  //  height: 19,
                                                  margin:
                                                      EdgeInsets.only(left: 31),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: "Medium"),
                                                  ),
                                                )
                                              : Container(
                                                  //  height: 19,
                                                  margin:
                                                      EdgeInsets.only(left: 31),
                                                  child: Text(
                                                    "${myGrossListItem![index].userVehicle!.registrationNo} | ${myGrossListItem![index].userVehicle!.vehicle!.name}",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: "Medium"),
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 31),
                                            child: Text(
                                              "$formatted",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: "Medium",
                                                  color: Color(0xffA6A6A6)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      myGrossListItem![index].amount == "" ||
                                              myGrossListItem![index].amount ==
                                                  null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  right: 11, top: 40),
                                              child: Text(
                                                '₹-}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Medium",
                                                    color: Color(0xff0072C6)),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(
                                                  right: 11, top: 40),
                                              child: Text(
                                                '₹${myGrossListItem![index].amount}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Medium",
                                                    color: Color(0xff0072C6)),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ],
                )),
      );
    });
  }
}
