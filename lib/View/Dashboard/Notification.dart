import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../Profile/Profile.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  // final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getDashboardApi(context);
      provider.getListNotificationApi("unread", context);
      provider.getListNotificationApi("", context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async => false,
        child: RefreshIndicator(
          onRefresh: () {
            return provider.getListNotificationApi("", context);
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
                    "Notifications",
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
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // provider.setUnreadNotificationVisibility(true);
                                // provider.getListNotificationApi("unread", context);
                                // Navigator.of(context).pushNamed('/newNotification');
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 21, bottom: 10, top: 25),
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Medium",
                                      color: Color(0xff0BADBC)),
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (provider
                                    .objListNotificationResponse.data.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "No Notification Found!!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  provider.getReadNotificationApi("", context);
                                  provider.setMarkAllNotification(true);
                                }

                                // provider.setUnreadNotificationVisibility(true);
                                // provider.getListNotificationApi("unread", context);
                                // Navigator.of(context).pushNamed('/newNotification');
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 21, bottom: 10, top: 25, right: 20),
                                child: Text(
                                  "Mark All Read",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Medium",
                                      color: Color(0xff0BADBC)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        provider.objListNotificationResponse.data.isEmpty
                            ? Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 100),
                                  child: Text(
                                    "No Notification to Display!!",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Medium",
                                        color: Colors.red),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: provider
                                    .objListNotificationResponse.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var listNotificationItem =
                                      provider.objListNotificationResponse.data;

                                  RegExp regExps = RegExp(r'(\b\w+\b)');
                                  List<Match> matches = regExps
                                      .allMatches(listNotificationItem[index]
                                          .message!
                                          .content
                                          .toString())
                                      .toList();

                                  if (matches.length >= 2 &&
                                      listNotificationItem[index]
                                          .message!
                                          .content
                                          .toString()
                                          .contains("Alert! New Task")) {
                                    Future.delayed(Duration.zero, () async {
                                      provider.getCarName(matches[3].group(0));
                                      provider
                                          .getRegNumber(matches[4].group(0));
                                      provider.getfullMessage(
                                          listNotificationItem[index]
                                              .message!
                                              .content!
                                              .substring(matches[4].end)
                                              .trim());
                                    });
                                  } else {
                                    Future.delayed(Duration.zero, () async {
                                      provider.getCarName(matches[0].group(0));
                                      provider
                                          .getRegNumber(matches[1].group(0));
                                      provider.getfullMessage(
                                          listNotificationItem[index]
                                              .message!
                                              .content!
                                              .substring(matches[1].end)
                                              .trim());
                                    });
                                  }

                                  return GestureDetector(
                                      onTap: () {
                                        listNotificationItem[index]
                                                    .message!
                                                    .status ==
                                                "unread"
                                            ? provider.getReadNotificationApi(
                                                listNotificationItem[index]
                                                    .message!
                                                    .id
                                                    .toString(),
                                                context)
                                            : Container();
                                      },
                                      child: listNotificationItem[index]
                                                  .message!
                                                  .status ==
                                              "read"
                                          ? Dismissible(
                                              key: Key(index.toString()),
                                              direction:
                                                  DismissDirection.endToStart,
                                              onDismissed: (direction) {
                                                provider.getDeleteNotificationApi(
                                                    provider
                                                        .objListNotificationResponse
                                                        .data[index]
                                                        .message!
                                                        .id
                                                        .toString(),
                                                    context);
                                              },
                                              background: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 5),
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerEnd,
                                                  color: Color(0xffF3CBCB),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: SvgPicture.asset(
                                                          "assets/images/notification/delete-icon.svg",
                                                          height: 24,
                                                          width: 24,
                                                          color:
                                                              Color(0xffdc6b6a),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              child: Container(
                                                  height: 88,
                                                  width: 375,
                                                  margin: EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 10,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xffE6E6E6),
                                                          width: 1),
                                                      color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 17,
                                                                    bottom: 20,
                                                                    top: 15),
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Color(
                                                                    0xffF6F6FE)),
                                                            child: SvgPicture.asset(
                                                                "assets/images/read.svg"),
                                                          ),
                                                          listNotificationItem[
                                                                      index]
                                                                  .message!
                                                                  .content!
                                                                  .contains(
                                                                      "Alert! New Task")
                                                              ? Container(
                                                                  width: 230,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 10,
                                                                  ),
                                                                  child:
                                                                      //     Text.rich(
                                                                      //   softWrap:
                                                                      //       true,
                                                                      //   maxLines: 5,
                                                                      //   TextSpan(
                                                                      //     children: [
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             "Alert! New Task",
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.carName,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.regNumber,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff0072C6)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.fullMessage,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //     ],
                                                                      //   ),
                                                                      // )
                                                                      Text(
                                                                    listNotificationItem[
                                                                            index]
                                                                        .message!
                                                                        .content
                                                                        .toString(),
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 5,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Medium",
                                                                        fontSize:
                                                                            13.5,
                                                                        color: Color(
                                                                            0xff3B3B3B)),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  width: 230,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 10,
                                                                  ),
                                                                  child:
                                                                      //     Text.rich(
                                                                      //   softWrap:
                                                                      //       true,
                                                                      //   maxLines: 5,
                                                                      //   TextSpan(
                                                                      //     children: [
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.carName,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.regNumber,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff0072C6)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             "has been assigned.",
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //     ],
                                                                      //   ),
                                                                      // )
                                                                      Text(
                                                                    listNotificationItem[
                                                                            index]
                                                                        .message!
                                                                        .content
                                                                        .toString(),
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 5,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Medium",
                                                                        fontSize:
                                                                            13.5,
                                                                        color: Color(
                                                                            0xff3B3B3B)),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          : Dismissible(
                                              key: Key(index.toString()),
                                              direction:
                                                  DismissDirection.endToStart,
                                              onDismissed: (direction) {
                                                provider.getDeleteNotificationApi(
                                                    provider
                                                        .objListNotificationResponse
                                                        .data[index]
                                                        .message!
                                                        .id
                                                        .toString(),
                                                    context);
                                              },
                                              background: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 5),
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerEnd,
                                                  color: Color(0xffF3CBCB),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: SvgPicture.asset(
                                                          "assets/images/notification/delete-icon.svg",
                                                          height: 24,
                                                          width: 24,
                                                          color:
                                                              Color(0xffdc6b6a),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              child: Container(
                                                  height: 88,
                                                  width: 375,
                                                  margin: EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 10,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xffF3CBCB),
                                                          width: 1),
                                                      color: Color(0xffF3CBCB)),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    bottom: 20,
                                                                    top: 15),
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Color(
                                                                    0xffF6F6FE)),
                                                            child: SvgPicture.asset(
                                                                "assets/images/unread.svg"),
                                                          ),
                                                          listNotificationItem[
                                                                      index]
                                                                  .message!
                                                                  .content!
                                                                  .contains(
                                                                      "Alert! New Task")
                                                              ? Container(
                                                                  width: 230,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 10,
                                                                  ),
                                                                  child:
                                                                      //     Text.rich(
                                                                      //   softWrap:
                                                                      //       true,
                                                                      //   maxLines: 5,
                                                                      //   TextSpan(
                                                                      //     children: [
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             "Alert! New Task",
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.carName,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.regNumber,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff0072C6)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.fullMessage,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //     ],
                                                                      //   ),
                                                                      // )
                                                                      Text(
                                                                    listNotificationItem[
                                                                            index]
                                                                        .message!
                                                                        .content
                                                                        .toString(),
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 5,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Medium",
                                                                        fontSize:
                                                                            13.5,
                                                                        color: Color(
                                                                            0xff3B3B3B)),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  width: 230,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 10,
                                                                  ),
                                                                  child:
                                                                      //     Text.rich(
                                                                      //   softWrap:
                                                                      //       true,
                                                                      //   maxLines: 5,
                                                                      //   TextSpan(
                                                                      //     children: [
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.carName,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             provider.regNumber,
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff0072C6)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             '\ ',
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "SemiBold",
                                                                      //             fontSize: 14,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //       TextSpan(
                                                                      //         text:
                                                                      //             "has been assigned.",
                                                                      //         style: TextStyle(
                                                                      //             fontFamily: "Medium",
                                                                      //             fontSize: 13.5,
                                                                      //             color: Color(0xff3B3B3B)),
                                                                      //       ),
                                                                      //     ],
                                                                      //   ),
                                                                      // )
                                                                      Text(
                                                                    listNotificationItem[
                                                                            index]
                                                                        .message!
                                                                        .content
                                                                        .toString(),
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 5,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Medium",
                                                                        fontSize:
                                                                            13.5,
                                                                        color: Color(
                                                                            0xff3B3B3B)),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ));
                                }),
                        // Visibility(
                        //   visible: provider.isUnreadNotificationVisible,
                        //   child: provider.objListNotificationResponse.data.isEmpty
                        //       ? Center(
                        //           child: Container(
                        //             child: Text(
                        //               "No Notification to Display!!",
                        //               style: TextStyle(
                        //                   fontSize: 15,
                        //                   fontFamily: "Medium",
                        //                   color: Colors.red),
                        //             ),
                        //           ),
                        //         )
                        //       : ListView.builder(
                        //           shrinkWrap: true,
                        //           itemCount: provider
                        //               .objListNotificationResponse.data.length,
                        //           itemBuilder: (BuildContext context, int index) {
                        //             var listNotificationItem =
                        //                 provider.objListNotificationResponse.data;
                        //             return Container(
                        //                 height: 88,
                        //                 width: 373,
                        //                 margin: EdgeInsets.only(
                        //                     left: 20, right: 20, top: 10),
                        //                 decoration: BoxDecoration(
                        //                     borderRadius: BorderRadius.circular(15),
                        //                     color: Colors.white),
                        //                 child: Column(
                        //                   children: [
                        //                     Row(
                        //                       // mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         Container(
                        //                           margin: EdgeInsets.only(
                        //                               left: 17, bottom: 23, top: 15),
                        //                           height: 50,
                        //                           width: 50,
                        //                           decoration: BoxDecoration(
                        //                               borderRadius:
                        //                                   BorderRadius.circular(30),
                        //                               color: Color(0xffF6F6FE)),
                        //                           child: SvgPicture.asset(
                        //                               "assets/images/feedback.svg"),
                        //                         ),
                        //                         Container(
                        //                           margin: EdgeInsets.only(
                        //                             left: 10,
                        //                           ),
                        //                           child: Text(
                        //                             listNotificationItem[index]
                        //                                 .message!
                        //                                 .content
                        //                                 .toString(),
                        //                             style: TextStyle(
                        //                                 fontFamily: "Medium",
                        //                                 fontSize: 15,
                        //                                 color: Color(0xff3B3B3B)),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ],
                        //                 ));
                        //           }),
                        // ),

                        // provider.objListNotificationResponse.data.isEmpty
                        //     ? Center(
                        //         child: Container(
                        //           margin: EdgeInsets.only(top: 300),
                        //           child: Text(
                        //             "No Notification to Display!!",
                        //             style: TextStyle(
                        //                 fontSize: 15,
                        //                 fontFamily: "Medium",
                        //                 color: Colors.red),
                        //           ),
                        //         ),
                        //       )
                        //     : ListView.builder(
                        //         physics: ScrollPhysics(),
                        //         shrinkWrap: true,
                        //         itemCount: provider
                        //             .objListNotificationResponse.data.length,
                        //         itemBuilder: (BuildContext context, int index) {
                        //           var listNotificationItem =
                        //               provider.objListNotificationResponse.data;
                        //           return GestureDetector(
                        //             onTap: () {
                        //               listNotificationItem[index].message!.status ==
                        //                       "unread"
                        //                   ? provider.getReadNotificationApi(
                        //                       listNotificationItem[index]
                        //                           .message!
                        //                           .id
                        //                           .toString(),
                        //                       context)
                        //                   : Container();
                        //             },
                        //             child: Container(
                        //                 height: 88,
                        //                 width: 373,
                        //                 margin: EdgeInsets.only(
                        //                     left: 20, right: 20, top: 10),
                        //                 decoration: BoxDecoration(
                        //                     borderRadius: BorderRadius.circular(15),
                        //                     color: Colors.white),
                        //                 child: Column(
                        //                   children: [
                        //                     Row(
                        //                       // mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         listNotificationItem[index]
                        //                                     .message!
                        //                                     .status ==
                        //                                 "read"
                        //                             ? Container(
                        //                                 margin: EdgeInsets.only(
                        //                                     left: 17,
                        //                                     bottom: 23,
                        //                                     top: 15),
                        //                                 height: 50,
                        //                                 width: 50,
                        //                                 decoration: BoxDecoration(
                        //                                     borderRadius:
                        //                                         BorderRadius
                        //                                             .circular(30),
                        //                                     color:
                        //                                         Color(0xffF6F6FE)),
                        //                                 child: SvgPicture.asset(
                        //                                     "assets/images/task.svg"),
                        //                               )
                        //                             : Container(
                        //                                 margin: EdgeInsets.only(
                        //                                     left: 17,
                        //                                     bottom: 23,
                        //                                     top: 15),
                        //                                 height: 50,
                        //                                 width: 50,
                        //                                 decoration: BoxDecoration(
                        //                                     borderRadius:
                        //                                         BorderRadius
                        //                                             .circular(30),
                        //                                     color:
                        //                                         Color(0xffF6F6FE)),
                        //                                 child: SvgPicture.asset(
                        //                                     "assets/images/feedback.svg"),
                        //                               ),
                        //                         Container(
                        //                           margin: EdgeInsets.only(
                        //                             left: 10,
                        //                           ),
                        //                           child: Text(
                        //                             listNotificationItem[index]
                        //                                 .message!
                        //                                 .content
                        //                                 .toString(),
                        //                             style: TextStyle(
                        //                                 fontFamily: "Medium",
                        //                                 fontSize: 15,
                        //                                 color: Color(0xff3B3B3B)),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ],
                        //                 )),
                        //           );
                        //         }),

                        // Container(
                        //     height: 88,
                        //     width: 373,
                        //     margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //         color: Colors.white),
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.only(
                        //                   left: 17, bottom: 23, top: 15),
                        //               height: 50,
                        //               width: 50,
                        //               decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(30),
                        //                   color: Color(0xffF6F6FE)),
                        //               child: SvgPicture.asset(
                        //                   "assets/images/feedback.svg"),
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.only(
                        //                 left: 35,
                        //               ),
                        //               child: Text(
                        //                 "Mr. Anil Kumar owner of Celerio\nDL 8T ER 2426 shared feedback.\n10 min",
                        //                 style: TextStyle(
                        //                     fontFamily: "Medium",
                        //                     fontSize: 15,
                        //                     color: Color(0xff3B3B3B)),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Container(
                        //     height: 88,
                        //     width: 373,
                        //     margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //         color: Colors.white),
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.only(
                        //                   left: 17, bottom: 23, top: 15),
                        //               height: 50,
                        //               width: 50,
                        //               decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(30),
                        //                   color: Color(0xffF6F6FE)),
                        //               child:
                        //                   SvgPicture.asset("assets/images/kyc.svg"),
                        //             ),
                        //             Spacer(),
                        //             Container(
                        //               child: Text(
                        //                 "Admin Alert! Complete your KYC today!\nyesterday",
                        //                 style: TextStyle(
                        //                     fontFamily: "Medium",
                        //                     fontSize: 15,
                        //                     color: Color(0xff3B3B3B)),
                        //               ),
                        //             ),
                        //           ],
                        //         )
                        //       ],
                        //     ))
                      ],
                    )),
            // bottomNavigationBar: bottomBar(context, provider),
          ),
        ),
      );
    });
  }
}
