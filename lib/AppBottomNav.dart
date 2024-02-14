import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Dashboard/ContactUs.dart';
import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
import 'package:yopee_cleaner/View/Dashboard/dashboard.dart';
import 'package:yopee_cleaner/View/Payment/Earning.dart';
import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
import 'package:yopee_cleaner/View/Reports/ReportScreen.dart';

import 'Presenter/YopeeProvider.dart';
import 'Utility/ColorTheme.dart';
import 'Utility/Environment.dart';

class AppBottomNav extends StatefulWidget {
  @override
  _AppBottomNavState createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State {
  int currentIndex = 0;
  var employeepages = [
    Dashboard(),
    ReportScreen(),
    NotificationScreen(),
    ContactUs()
  ];
  var pages = [
    Dashboard(),
    ReportScreen(),
    NotificationScreen(),
    EarningScreen(),
    ContactUs()
  ];
  var _appPageController = PageController();

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.jumpToPage(index);

    // animateToPage(index,
    //     duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);

      provider.getProfileViewApi(context);
      provider.getListNotificationApi("unread", context);
      // provider.getDashboardApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: _appPageController,
            children:
                Environment.userCategory == "employee" ? employeepages : pages,
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
            height: 76,
            child: Card(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Environment.userCategory == "employee"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(0);
                              },
                              child: currentIndex == 0
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/home.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/home.svg",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(1);
                              },
                              child: currentIndex == 1
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/history.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/history.svg",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(2);
                              },
                              child: currentIndex == 2
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/bell.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: provider
                                              .objListNotificationResponse
                                              .data
                                              .isEmpty
                                          ? Container(
                                              height: 17,
                                              width: 16,
                                              margin: EdgeInsets.only(
                                                  left: 9.5,
                                                  right: 8.5,
                                                  top: 8,
                                                  bottom: 9),

                                              // margin: EdgeInsets.only(
                                              //     left: 36.97,
                                              //     top: 20,
                                              //     bottom: 10.26,
                                              //     right: 114.97),
                                              child: SvgPicture.asset(
                                                  "assets/images/menu/bell.svg"),
                                            )
                                          : Stack(
                                              children: [
                                                GestureDetector(
                                                  // onTap: () {
                                                  //   Environment.notificationStatus ==
                                                  //           "1"
                                                  //       ? Navigator.of(context)
                                                  //           .pushNamed(
                                                  //               '/notification')
                                                  //       : showAlertDialog(
                                                  //           provider,
                                                  //           context,
                                                  //           false);
                                                  // },
                                                  child: Container(
                                                    height: 17,
                                                    width: 16,
                                                    margin: EdgeInsets.only(
                                                        left: 1,
                                                        top: 9,
                                                        bottom: 8,
                                                        right: 7.5),
                                                    child: SvgPicture.asset(
                                                        "assets/images/menu/bell.svg"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 17,
                                                  width: 16,
                                                  margin: EdgeInsets.only(
                                                      left: 9.5,
                                                      right: 8.5,
                                                      top: 8,
                                                      bottom: 9),

                                                  // alignment: Alignment.topRight,
                                                  //margin: EdgeInsets.only(top: 5),
                                                  child: Container(
                                                    height: 17,
                                                    width: 16,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 1)),
                                                    child: Center(
                                                      child: Text(
                                                        provider
                                                            .objListNotificationResponse
                                                            .data
                                                            .length
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                "Medium",
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                      // Container(
                                      //   height: 17,
                                      //   width: 16,
                                      //   margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                                      //   child: SvgPicture.asset("assets/images/bell.svg",
                                      //       color: ColorTheme.themeDarkGrayColor),
                                      // ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(3);
                              },
                              child: currentIndex == 3
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.only(
                                            left: 5.5,
                                            right: 5.5,
                                            top: 5,
                                            bottom: 5),
                                        child: Image.asset(
                                            "assets/images/login/phone-icon.png",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: Image.asset(
                                            "assets/images/login/phone-icon.png",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(0);
                              },
                              child: currentIndex == 0
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/home.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/home.svg",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(1);
                              },
                              child: currentIndex == 1
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/history.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/dashboard/history.svg",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(2);
                              },
                              child: currentIndex == 2
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/bell.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: provider
                                              .objListNotificationResponse
                                              .data
                                              .isEmpty
                                          ? Container(
                                              height: 17,
                                              width: 16,
                                              margin: EdgeInsets.only(
                                                  left: 9.5,
                                                  right: 8.5,
                                                  top: 8,
                                                  bottom: 9),

                                              // margin: EdgeInsets.only(
                                              //     left: 36.97,
                                              //     top: 20,
                                              //     bottom: 10.26,
                                              //     right: 114.97),
                                              child: SvgPicture.asset(
                                                  "assets/images/menu/bell.svg"),
                                            )
                                          : Stack(
                                              children: [
                                                GestureDetector(
                                                  // onTap: () {
                                                  //   Environment.notificationStatus ==
                                                  //           "1"
                                                  //       ? Navigator.of(context)
                                                  //           .pushNamed(
                                                  //               '/notification')
                                                  //       : showAlertDialog(
                                                  //           provider,
                                                  //           context,
                                                  //           false);
                                                  // },
                                                  child: Container(
                                                    height: 17,
                                                    width: 16,
                                                    margin: EdgeInsets.only(
                                                        left: 1,
                                                        top: 9,
                                                        bottom: 8,
                                                        right: 7.5),
                                                    child: SvgPicture.asset(
                                                        "assets/images/menu/bell.svg"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 17,
                                                  width: 16,
                                                  margin: EdgeInsets.only(
                                                      left: 9.5,
                                                      right: 8.5,
                                                      top: 8,
                                                      bottom: 9),

                                                  // alignment: Alignment.topRight,
                                                  //margin: EdgeInsets.only(top: 5),
                                                  child: Container(
                                                    height: 17,
                                                    width: 16,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 1)),
                                                    child: Center(
                                                      child: Text(
                                                        provider
                                                            .objListNotificationResponse
                                                            .data
                                                            .length
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                "Medium",
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                      // Container(
                                      //   height: 17,
                                      //   width: 16,
                                      //   margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                                      //   child: SvgPicture.asset("assets/images/bell.svg",
                                      //       color: ColorTheme.themeDarkGrayColor),
                                      // ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.setEarningMenu(true);
                                setBottomBarIndex(3);
                              },
                              child: currentIndex == 3
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/indian-rupee.svg",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: SvgPicture.asset(
                                            "assets/images/indian-rupee.svg",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setBottomBarIndex(4);
                              },
                              child: currentIndex == 4
                                  ? Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff007BFF)),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.only(
                                            left: 5.5,
                                            right: 5.5,
                                            top: 5,
                                            bottom: 5),
                                        child: Image.asset(
                                            "assets/images/login/phone-icon.png",
                                            color: ColorTheme.themeWhiteColor),
                                      ),
                                    )
                                  : Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xffF5F5F5)),
                                      child: Container(
                                        height: 17,
                                        width: 16,
                                        margin: EdgeInsets.only(
                                            left: 9.5,
                                            right: 8.5,
                                            top: 8,
                                            bottom: 9),
                                        child: Image.asset(
                                            "assets/images/login/phone-icon.png",
                                            color:
                                                ColorTheme.themeDarkGrayColor),
                                      ),
                                    ),
                            ),
                          ],
                        )),
            ),
          ));
    });
  }

  void _onTappedBar(int value) {
    setState(() {
      currentIndex = value;
    });
    _appPageController.jumpToPage(value);
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppBottomNav(),
    );
  }
}
