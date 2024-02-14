import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Reports/ReportDetail.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../Profile/Profile.dart';

class ReportScreen extends StatefulWidget {
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {
  // final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      String month = DateFormat("yyyy-MM-dd").format(provider.selectedDate);
      provider.getListNotificationApi("unread", context);
      provider.getReportsListApi(month, context);
      provider.getDashboardApi(context);
    });
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit App',
              style: TextStyle(
                  fontSize: 16, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Text(
              'Do you want to exit an App?',
              style: TextStyle(
                  fontSize: 14, fontFamily: "Medium", color: Colors.black),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text(
                  'No',
                  style: TextStyle(
                      fontSize: 12, fontFamily: "Regular", color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                //return true when click on "Yes"
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 12, fontFamily: "Regular", color: Colors.green),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async => false,
        child: RefreshIndicator(
          onRefresh: () {
            String month =
                DateFormat("yyyy-MM-dd").format(provider.selectedDate);
            return provider.getReportsListApi(month, context);
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
                  centerTitle: false,
                  title: const Text(
                    "Job Report",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "SemiBold",
                        color: Colors.white),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        provider.selectDate(context);
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          "assets/images/calendar.png",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Environment.notificationStatus == "1"
                        ? Container(
                            height: 15,
                            width: 28,
                            margin: EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              "assets/images/toggle-active.svg",
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 28,
                            margin: EdgeInsets.only(right: 5),
                            child: Image.asset(
                              "assets/images/toggle.png",
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
                            margin: EdgeInsets.only(right: 5),
                            child: IconButton(
                              icon: Image.asset(
                                "assets/images/menu/profile.png",
                              ),
                              onPressed: () {
                                provider.isProfileEdit = true;
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        Profile(),
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
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              provider.isProfileEdit = true;
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 400),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Profile(),
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
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(left: 5, right: 15),
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
                    // physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      provider.date == ""
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 30, bottom: 15),
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Medium",
                                    color: Color(0xffA6A6A6)),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 30, bottom: 15),
                              child: Text(
                                "${provider.date}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Medium",
                                    color: Color(0xffA6A6A6)),
                              ),
                            ),
                      provider.objReportsListResponse.data.isEmpty
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 300),
                                child: Text(
                                  "No Reports Available!!",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Medium",
                                      fontSize: 15),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  provider.objReportsListResponse.data.length ??
                                      0,
                              itemBuilder: (context, index) {
                                var reportListItem =
                                    provider.objReportsListResponse.data;

                                var assignedAtTime = provider
                                    .objReportsListResponse
                                    .data[index]
                                    .assignedAt;
                                String formattedTime =
                                    DateFormat.jm().format(assignedAtTime!);
                                print("formattedTime:$formattedTime");

                                return Card(
                                  elevation: 1,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: Container(
                                    height: 180,
                                    width: 374,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffF6F6FE)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            reportListItem[index]
                                                            .userVehicle!
                                                            .brand!
                                                            .image ==
                                                        "" ||
                                                    reportListItem[index]
                                                            .userVehicle!
                                                            .brand!
                                                            .image ==
                                                        null
                                                ? Container(
                                                    height: 45.5,
                                                    width: 56,
                                                    padding: EdgeInsets.only(
                                                        left: 7,
                                                        top: 6,
                                                        right: 6.3,
                                                        bottom: 6.5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    margin: EdgeInsets.only(
                                                        top: 17, bottom: 11),
                                                    child: Container(
                                                        height: 33,
                                                        width: 43,
                                                        child: Image.asset(
                                                            "assets/images/carBrand/Suzuki.png")),
                                                  )
                                                : Container(
                                                    height: 45.5,
                                                    width: 56,
                                                    padding: EdgeInsets.only(
                                                        left: 7,
                                                        top: 6,
                                                        right: 6.3,
                                                        bottom: 6.5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    margin: EdgeInsets.only(
                                                        top: 17, bottom: 11),
                                                    child: Container(
                                                        height: 33,
                                                        width: 43,
                                                        child: Image.network(
                                                            reportListItem[
                                                                    index]
                                                                .userVehicle!
                                                                .brand!
                                                                .image
                                                                .toString())),
                                                  ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                reportListItem[index]
                                                                .userVehicle!
                                                                .brand!
                                                                .name ==
                                                            "" ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .brand!
                                                                .name ==
                                                            null ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .model!
                                                                .name ==
                                                            "" ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .model!
                                                                .name ==
                                                            null
                                                    ? Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 18,
                                                            top: 13,
                                                            bottom: 10),
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                              fontSize: 12.5,
                                                              fontFamily:
                                                                  "SemiBold"),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 18,
                                                            top: 13,
                                                            bottom: 10),
                                                        child: Text(
                                                          "${reportListItem[index].userVehicle!.brand!.name} ${reportListItem[index].userVehicle!.model!.name}",
                                                          style: TextStyle(
                                                              fontSize: 12.5,
                                                              fontFamily:
                                                                  "SemiBold"),
                                                        ),
                                                      ),
                                                reportListItem[index]
                                                                .userVehicle!
                                                                .registrationNo ==
                                                            "" ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .registrationNo ==
                                                            null ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .vehicle!
                                                                .name ==
                                                            "" ||
                                                        reportListItem[index]
                                                                .userVehicle!
                                                                .vehicle!
                                                                .name ==
                                                            null
                                                    ? Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 21),
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                              fontSize: 10.5,
                                                              fontFamily:
                                                                  "Medium",
                                                              color: Color(
                                                                  0xff7B7B7B)),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 21),
                                                        child: Text(
                                                          "${reportListItem[index].userVehicle!.registrationNo} | ${reportListItem[index].userVehicle!.vehicle!.name}",
                                                          style: TextStyle(
                                                              fontSize: 10.5,
                                                              fontFamily:
                                                                  "Medium",
                                                              color: Color(
                                                                  0xff7B7B7B)),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 30,
                                              width: 69,
                                              margin:
                                                  EdgeInsets.only(right: 16),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.transparent),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: 22.47,
                                                    width: 13.47,
                                                    child: reportListItem[index]
                                                                .rating ==
                                                            0
                                                        ? Icon(
                                                            Icons.star_border,
                                                            color: Color(
                                                                0xffFFBC00))
                                                        : Icon(Icons.star,
                                                            color: Color(
                                                                0xffFFBC00)),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "${reportListItem[index].rating}",
                                                      style: TextStyle(
                                                          fontFamily: "Medium",
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xffFFBC00)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Color(0xffDDDDF7),
                                        ),
                                        Row(
                                          children: [
                                            reportListItem[index].requestTime ==
                                                    ""
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        top: 15,
                                                        bottom: 15,
                                                        right: 16),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'Time : ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff003F69)),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: "",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xff003F69)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        top: 15,
                                                        bottom: 15,
                                                        right: 16),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'Time : ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff003F69)),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: formattedTime,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xff003F69)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                            Spacer(),
                                            reportListItem[index].status ==
                                                        "" ||
                                                    reportListItem[index]
                                                            .status ==
                                                        null
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        top: 15,
                                                        bottom: 15,
                                                        right: 16),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'Job Status : ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff003F69)),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: "",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xff1EB113)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        top: 15,
                                                        bottom: 15,
                                                        right: 16),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'Job Status : ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff003F69)),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: reportListItem[
                                                                            index]
                                                                        .status ==
                                                                    "Not Going"
                                                                ? "Declined"
                                                                : "${reportListItem[index].status}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 13,
                                                                color: reportListItem[index]
                                                                            .status ==
                                                                        "Pending"
                                                                    ? Color(
                                                                        0xffFF8800)
                                                                    : Colors
                                                                        .red),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff007BFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                              ),
                                              minimumSize: Size(110, 36),
                                            ),
                                            onPressed: () {
                                              // showLogoutDialog(
                                              //  context, provider);
                                              // Navigator.of(context)
                                              //     .pushNamed('/addAddress');

                                              reportListItem[index].status ==
                                                      "Not Going"
                                                  ? reportsRejectedStatusDialog(
                                                      context, provider)
                                                  : reportListItem[index]
                                                              .rating ==
                                                          0
                                                      ? reportsStatusDialog(
                                                          context, provider)
                                                      : Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              transitionDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          400),
                                                              pageBuilder:
                                                                  (context,
                                                                          animation,
                                                                          secondaryAnimation) =>
                                                                      ReportDetail(
                                                                        id: reportListItem[index]
                                                                            .id
                                                                            .toString(),
                                                                      ),
                                                              transitionsBuilder: (BuildContext context,
                                                                  Animation<double>
                                                                      animation,
                                                                  Animation<double> secondaryAnimation,
                                                                  Widget child) {
                                                                return new SlideTransition(
                                                                  position: new Tween<
                                                                      Offset>(
                                                                    //Left to right
                                                                    // begin: const Offset(-1.0, 0.0),
                                                                    // end: Offset.zero,

                                                                    //Right to left
                                                                    begin:
                                                                        const Offset(
                                                                            1.0,
                                                                            0.0),
                                                                    end: Offset
                                                                        .zero,

                                                                    //top to bottom
                                                                    // begin: const Offset(0.0, -1.0),
                                                                    // end: Offset.zero,

                                                                    //   bottom to top
                                                                    // begin: Offset(0.0, 1.0),
                                                                    // end: Offset.zero,
                                                                  ).animate(
                                                                      animation),
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

                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           ReportDetail(
                                              //             id: reportListItem[
                                              //                     index]
                                              //                 .id
                                              //                 .toString(),
                                              //           )),
                                              // );
                                            },
                                            child: const Text(
                                              'View Details',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: "SemiBold"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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

  reportsStatusDialog(BuildContext context, YopeeProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                width: 300,
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // width: double.infinity,
                          // decoration: BoxDecoration(
                          //   color: ColorTheme.themeWhiteColor,
                          //   borderRadius: BorderRadius.circular(
                          //     5.00,
                          //   ),
                          // ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: SvgPicture.asset(
                                    "assets/images/alarm-clock.svg"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                // padding: EdgeInsets.only(
                                //     left: 18, top: 14, right: 18, bottom: 10),
                                child: Text(
                                  " Customer feedback is pending!!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xffFF5E00),
                                    fontSize: 14.5,
                                    fontFamily: 'SemiBold',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                //  width: 152.00,
                                // margin: EdgeInsets.only(
                                //   left: 18,
                                //   top: 3,
                                //   right: 18,
                                // ),
                                child: Text(
                                  "Please remind the customer to rate the service for better insights.",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff606060),
                                    fontSize: 13.5,
                                    fontFamily: 'Regular',
                                    height: 1.43,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  reportsRejectedStatusDialog(BuildContext context, YopeeProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              backgroundColor: Color(0xffF3CBCB),
              content: Container(
                width: 200,
                height: 50,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // width: double.infinity,
                          // decoration: BoxDecoration(
                          //   color: ColorTheme.themeWhiteColor,
                          //   borderRadius: BorderRadius.circular(
                          //     5.00,
                          //   ),
                          // ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 18, top: 14, right: 18, bottom: 10),
                                child: Text(
                                  " Job declined by you!!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
