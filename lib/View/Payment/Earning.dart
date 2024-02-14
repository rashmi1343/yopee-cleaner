import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/AppBottomNav.dart';
import 'package:yopee_cleaner/Utility/Environment.dart';
import 'package:yopee_cleaner/View/Payment/TransactionHistory.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../Dashboard/Home.dart';
import 'GrossEarning.dart';

class EarningScreen extends StatefulWidget {
  EarningScreenState createState() => EarningScreenState();
}

class EarningScreenState extends State<EarningScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getListNotificationApi("unread", context);
      provider.getDashboardApi(context);
      provider.getEarningsApi(
          provider.monthEarningdropdownvalue.toString(), context);
    });
  }

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

  Future<bool> willPopCallback() async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Dashboard(),
    //   ),
    // );
    Provider.of<YopeeProvider>(context, listen: false).isEarningMenu == false
        ? Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) =>
                AppBottomNav(),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  //Left to right
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,

                  //Right to left
                  // begin:
                  // const Offset(1.0, 0.0),
                  // end: Offset.zero,

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
            ))
        : Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) =>
                AppBottomNav(),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  //Left to right
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,

                  //Right to left
                  // begin:
                  // const Offset(1.0, 0.0),
                  // end: Offset.zero,

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
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: willPopCallback,
        child: RefreshIndicator(
          onRefresh: () {
            return provider.getEarningsApi(
                provider.monthEarningdropdownvalue.toString(), context);
          },
          child: Scaffold(
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
                  automaticallyImplyLeading: false,
                  elevation: 4,
                  shadowColor: Color(0xff00000029),
                  toolbarHeight: 53,
                  // leading: IconButton(
                  //   iconSize: 25,
                  //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                  //   onPressed: () {
                  //     // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     //     '/home', (Route<dynamic> route) => false);
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => AppBottomNav()));
                  //     Navigator.of(context).push(PageRouteBuilder(
                  //         transitionDuration: const Duration(milliseconds: 400),
                  //         pageBuilder: (context, animation, secondaryAnimation) =>
                  //             AppBottomNav(),
                  //         transitionsBuilder: (BuildContext context,
                  //             Animation<double> animation,
                  //             Animation<double> secondaryAnimation,
                  //             Widget child) {
                  //           return SlideTransition(
                  //             position: Tween<Offset>(
                  //               //Left to right
                  //               begin: const Offset(-1.0, 0.0),
                  //               end: Offset.zero,
                  //
                  //               //Right to left
                  //               // begin: const Offset(1.0, 0.0),
                  //               // end: Offset.zero,
                  //
                  //               //top to bottom
                  //               // begin: const Offset(0.0, -1.0),
                  //               // end: Offset.zero,
                  //
                  //               //   bottom to top
                  //               // begin: Offset(0.0, 1.0),
                  //               // end: Offset.zero,
                  //             ).animate(animation),
                  //             child: child,
                  //           );
                  //         }
                  //         // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                  //         //   var begin = 0.0;
                  //         //   var end = 1.0;
                  //         //   var curve = Curves.ease;
                  //         //
                  //         //   var tween =
                  //         //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  //         //   return ScaleTransition(
                  //         //     scale: animation.drive(tween),
                  //         //     child: page,
                  //         //   );
                  //         // },
                  //         ));
                  //   },
                  // ),
                  centerTitle: false,
                  title: const Text(
                    "Earnings",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "SemiBold",
                        color: Colors.white),
                  ),
                  actions: [
                    Environment.notificationStatus == "1"
                        ? Container(
                            height: 15,
                            width: 28,
                            child: SvgPicture.asset(
                              "assets/images/toggle-active.svg",
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 28,
                            child: Image.asset(
                              "assets/images/toggle.png",
                              color: Color(0xff00FF00),
                            ),
                          ),
                    provider.objDashboardResponse.data.userProfile
                                    ?.profileImageUrl ==
                                "" ||
                            provider.objDashboardResponse.data.userProfile
                                    ?.profileImageUrl ==
                                null
                        ? Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              icon: Image.asset(
                                "assets/images/menu/profile.png",
                              ),
                              onPressed: () {
                                provider.isProfileEdit = true;
                                Navigator.of(context).pushNamed('/profile');
                              },
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              provider.isProfileEdit = true;
                              Navigator.of(context).pushNamed('/profile');
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              // decoration: BoxDecoration(
                              //   borderRadius:
                              //       BorderRadius.circular(50),
                              //   image: DecorationImage(
                              //     image: NetworkImage(
                              //         "${provider.objProfileViewResponse.data?.profileImageUrl}"),
                              //     //whatever image you can put here
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    "${provider.objProfileViewResponse.data?.profileImageUrl}"),
                              ),
                              // child: Image.network(
                              //     // "https://binarymetrix-staging.com/yopee/storage/app/public/257/download.jpg"),
                              //     provider.objProfileViewResponse
                              //         .profileViewData.profileImageUrl),
                            ),
                          ),
                  ],
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
                        Row(
                          children: [
                            Container(
                              height: 19,
                              margin: EdgeInsets.only(
                                  left: 21, top: 13, bottom: 10),
                              child: Text(
                                "This month",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: Color(0xff2C2C2C)),
                              ),
                            ),
                            Spacer(),
                            // Container(
                            //     margin: EdgeInsets.only(right: 20),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(5),
                            //         border: Border.all(
                            //             color: Color(0xff707070), width: 1)),
                            //     height: 27,
                            //     width: 72,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Container(
                            //           child: Text(
                            //             "Month",
                            //             style: TextStyle(
                            //                 fontSize: 12,
                            //                 fontFamily: "Medium",
                            //                 color: Color(0xff555555)),
                            //           ),
                            //         ),
                            //         Container(
                            //             child: Icon(Icons.keyboard_arrow_down))
                            //       ],
                            //     ))
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
                                  value: provider.monthEarningdropdownvalue,
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
                                    provider.setMonthEarningDropDown(newValue);
                                    provider.getEarningsApi(
                                        provider.monthEarningdropdownvalue
                                            .toString(),
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
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pushNamed('/grossEarning');
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        GrossEarningScreen(),
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
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.only(left: 20, right: 18),
                                child: Container(
                                  width: 150,
                                  constraints: BoxConstraints(
                                      maxHeight: double.infinity),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Color(0xffF6F6F6),
                                        ],
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 19, top: 16, bottom: 10),
                                        height: 39,
                                        width: 58,
                                        child: Image.asset(
                                            "assets/images/earning/earning-icon.png"),
                                      ),
                                      provider.objEarningsResponse.data!
                                                      .grossEarning ==
                                                  null ||
                                              provider.objEarningsResponse.data!
                                                      .grossEarning ==
                                                  ""
                                          ? Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: double.infinity,
                                                  maxWidth: 100),
                                              margin: EdgeInsets.only(
                                                  left: 19, bottom: 10),
                                              child: Text(
                                                "₹0",
                                                style: TextStyle(
                                                    fontFamily: "SemiBold",
                                                    fontSize: 17,
                                                    color: Color(0xff000000)),
                                              ),
                                            )
                                          : Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: double.infinity,
                                                  maxWidth: 100),
                                              margin: EdgeInsets.only(
                                                  left: 19, bottom: 10),
                                              child: Text(
                                                "₹${provider.objEarningsResponse.data!.grossEarning.toString()}",
                                                style: TextStyle(
                                                    fontFamily: "SemiBold",
                                                    fontSize: 17,
                                                    color: Color(0xff000000)),
                                              ),
                                            ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 19, bottom: 10),
                                        child: Text(
                                          "Gross Earning",
                                          style: TextStyle(
                                              fontFamily: "Medium",
                                              fontSize: 14,
                                              color: Color(0xff7B7B7B)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(right: 21),
                              child: Container(
                                width: 150,
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color(0xffF6F6F6),
                                      ],
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 19, top: 16, bottom: 10),
                                      height: 39,
                                      width: 29,
                                      child: Image.asset(
                                          "assets/images/money-bag.png"),
                                    ),
                                    provider.objEarningsResponse.data!
                                                    .totalEarning ==
                                                null ||
                                            provider.objEarningsResponse.data!
                                                    .totalEarning ==
                                                ""
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹0",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          )
                                        : Container(
                                            constraints: BoxConstraints(
                                                maxHeight: double.infinity,
                                                maxWidth: 100),
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹${provider.objEarningsResponse.data!.totalEarning.toString()}",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 19, bottom: 10),
                                      child: Text(
                                        "Total Earning",
                                        style: TextStyle(
                                            fontFamily: "Medium",
                                            fontSize: 14,
                                            color: Color(0xff7B7B7B)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: [
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(left: 20, right: 18),
                              child: Container(
                                width: 150,
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color(0xffF6F6F6),
                                      ],
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 19, top: 8, bottom: 10),
                                      height: 56,
                                      width: 56,
                                      child: Image.asset(
                                          "assets/images/earning/exchange.png"),
                                    ),
                                    provider.objEarningsResponse.data!
                                                    .totalRemaining ==
                                                null ||
                                            provider.objEarningsResponse.data!
                                                    .totalRemaining ==
                                                0
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹0",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          )
                                        : Container(
                                            constraints: BoxConstraints(
                                                maxHeight: double.infinity,
                                                maxWidth: 100),
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹${provider.objEarningsResponse.data!.totalRemaining.toString()}",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 19, bottom: 10),
                                      child: Text(
                                        "Total Remaining",
                                        style: TextStyle(
                                            fontFamily: "Medium",
                                            fontSize: 14,
                                            color: Color(0xff7B7B7B)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(right: 21),
                              child: Container(
                                width: 150,
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color(0xffF6F6F6),
                                      ],
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 19, top: 21.5, bottom: 20),
                                      height: 34,
                                      width: 49.7,
                                      child: Image.asset(
                                          "assets/images/earning/earning-icon-6.png"),
                                    ),
                                    provider.objEarningsResponse.data!
                                                    .rejectedPayment ==
                                                null ||
                                            provider.objEarningsResponse.data!
                                                    .rejectedPayment ==
                                                0
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹0",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          )
                                        : Container(
                                            constraints: BoxConstraints(
                                                maxHeight: double.infinity,
                                                maxWidth: 100),
                                            margin: EdgeInsets.only(
                                                left: 19, bottom: 10),
                                            child: Text(
                                              "₹${provider.objEarningsResponse.data!.rejectedPayment.toString()}",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 17,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 19, bottom: 10),
                                      child: Text(
                                        "Rejected Payments",
                                        style: TextStyle(
                                            fontFamily: "Medium",
                                            fontSize: 14,
                                            color: Color(0xff7B7B7B)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: [
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(left: 20, right: 18),
                              child: Container(
                                width: 150,
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color(0xffF6F6F6),
                                      ],
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 19, top: 8, bottom: 10),
                                          height: 55,
                                          width: 55,
                                          child: Image.asset(
                                              "assets/images/earning/car-service.png"),
                                        ),
                                        Spacer(),
                                        provider.objEarningsResponse.data!
                                                        .totalMonthlySubscribtion ==
                                                    null ||
                                                provider
                                                        .objEarningsResponse
                                                        .data!
                                                        .totalMonthlySubscribtion ==
                                                    0
                                            ? Container(
                                                margin:
                                                    EdgeInsets.only(right: 11),
                                                child: Text(
                                                  "0",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              )
                                            : Container(
                                                constraints: BoxConstraints(
                                                    maxHeight: double.infinity,
                                                    maxWidth: 100),
                                                margin:
                                                    EdgeInsets.only(right: 11),
                                                child: Text(
                                                  "${provider.objEarningsResponse.data!.totalMonthlySubscribtion.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              )
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 19, bottom: 10),
                                      child: Text(
                                        "Total Monthly\nCar Subscription",
                                        style: TextStyle(
                                            fontFamily: "Medium",
                                            fontSize: 14,
                                            color: Color(0xff7B7B7B)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(right: 18),
                              child: Container(
                                width: 150,
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Color(0xffF6F6F6),
                                      ],
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 19, top: 8, bottom: 10),
                                          height: 55,
                                          width: 55,
                                          child: Image.asset(
                                              "assets/images/earning/car.png"),
                                        ),
                                        Spacer(),
                                        provider.objEarningsResponse.data!
                                                        .totalOneTimeService ==
                                                    null ||
                                                provider
                                                        .objEarningsResponse
                                                        .data!
                                                        .totalOneTimeService ==
                                                    0
                                            ? Container(
                                                margin:
                                                    EdgeInsets.only(right: 11),
                                                child: Text(
                                                  "0",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              )
                                            : Container(
                                                constraints: BoxConstraints(
                                                    maxHeight: double.infinity,
                                                    maxWidth: 100),
                                                margin:
                                                    EdgeInsets.only(right: 11),
                                                child: Text(
                                                  "${provider.objEarningsResponse.data!.totalOneTimeService.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              )
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 19, bottom: 10),
                                      child: Text(
                                        "Total One\nTime Services",
                                        style: TextStyle(
                                            fontFamily: "Medium",
                                            fontSize: 14,
                                            color: Color(0xff7B7B7B)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        provider.objEarningsResponse.data!.transcations.isEmpty
                            ? Center(
                                child: Container(),
                              )
                            : Row(
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 400),
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  TransactionHistoryScreen(
                                                      selectedmonth: provider
                                                          .monthEarningdropdownvalue
                                                          .toString()),
                                              transitionsBuilder: (BuildContext
                                                      context,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation,
                                                  Widget child) {
                                                return SlideTransition(
                                                  position: Tween<Offset>(
                                                    //Left to right
                                                    // begin: const Offset(-1.0, 0.0),
                                                    // end: Offset.zero,

                                                    //Right to left
                                                    begin:
                                                        const Offset(1.0, 0.0),
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
                                      margin: const EdgeInsets.only(
                                          top: 2.96, right: 20),
                                      height: 18,
                                      child: const Text(
                                        "View All",
                                        style: TextStyle(
                                            fontFamily: "SemiBold",
                                            fontSize: 14,
                                            color: Color(0xff001F3F)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        provider.objEarningsResponse.data!.transcations!.isEmpty
                            ? Center(
                                child: Container(),
                              )
                            : ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1
                                    // provider.objEarningsResponse.data!
                                    //         .transcations!.length
                                    ??
                                    0,
                                itemBuilder: (context, index) {
                                  var myTransactionListItem = provider
                                      .objEarningsResponse.data!.transcations;

                                  return Container(
                                    height: 100,
                                    width: 374,
                                    margin: EdgeInsets.only(
                                        right: 20, top: 5, left: 20, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffF6F6FE),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 48,
                                          width: 64,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: Color(0xffCCCCCC))),
                                          margin: EdgeInsets.only(
                                              left: 10, bottom: 11, top: 23),
                                          child: Image.network(
                                              myTransactionListItem[index]
                                                  .userVehicle
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
                                            Container(
                                              height: 19,
                                              margin: EdgeInsets.only(
                                                  left: 31,
                                                  top: 13,
                                                  bottom: 10),
                                              child: Text(
                                                "${myTransactionListItem![index].userVehicle!.brand!.name} ${myTransactionListItem![index].userVehicle!.model!.name}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Container(
                                              height: 19,
                                              margin: EdgeInsets.only(left: 31),
                                              child: Text(
                                                "${myTransactionListItem![index].userVehicle!.registrationNo} | ${myTransactionListItem![index].userVehicle!.vehicle!.name}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Medium"),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 11, top: 40),
                                          child: Text(
                                            '₹${myTransactionListItem![index].amount.toString()}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Medium",
                                                color: Color(0xff0072C6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                      ],
                    )),
            // bottomNavigationBar: bottomBar(context, provider),
          ),
        ),
      );
    });
  }
}
