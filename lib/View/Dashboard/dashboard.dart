import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Dashboard/ContactUs.dart';
import 'package:yopee_cleaner/View/JobStatus.dart';
import 'package:yopee_cleaner/View/NotGoingScreen.dart';
import 'package:yopee_cleaner/View/Payment/Earning.dart';
import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
import 'package:yopee_cleaner/View/Profile/Profile.dart';
import 'package:yopee_cleaner/View/Reports/ReportScreen.dart';
import 'package:yopee_cleaner/View/SpecialRequest.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Router/Routes.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../../Widgets/bottom_bar.dart';
import '../Reports/ReportDetail.dart';
import 'Notification.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getDashboardApi(context);
      Environment.notificationStatus = "0";
      provider.getListNotificationApi("unread", context);
      // provider.getNotificationStatusApi("0", context);

      // if (provider.objDashboardResponse.data.userProfile.accountDetails == 0) {
      //   provider.isProfileEdit = true;
      //   showProfileDialog(context, provider);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: showExitPopup,
        child: RefreshIndicator(
          onRefresh: () => provider.getDashboardApi(context),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 0.1,
              backgroundColor: Color(0xff0072C6),
              automaticallyImplyLeading: false,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Environment.userCategory == "employee"
                            ? Column(
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xff0072C6),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Dashboard",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Spacer(),
                                              Environment.notificationStatus ==
                                                      "0"
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        // showAlertDialog(
                                                        //     provider, context);
                                                        // provider.getNotificationStatusApi(
                                                        //     "1", context);
                                                      },
                                                      child: Container(
                                                        height: 15,
                                                        width: 28,
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        child: Image.asset(
                                                            "assets/images/toggle.png"),
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        // showAlertDialog(
                                                        //     provider, context);
                                                        // provider.getNotificationStatusApi(
                                                        //     "1", context);
                                                      },
                                                      child: Container(
                                                        height: 15,
                                                        width: 28,
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        child: SvgPicture.asset(
                                                            "assets/images/toggle-active.svg"),
                                                      ),
                                                    ),
                                              provider
                                                              .objDashboardResponse
                                                              .data
                                                              .userProfile
                                                              ?.profileImageUrl ==
                                                          "" ||
                                                      provider
                                                              .objDashboardResponse
                                                              .data
                                                              .userProfile
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
                                                          provider.isProfileEdit =
                                                              true;
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  '/profile');
                                                        },
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        provider.isProfileEdit =
                                                            true;
                                                        // Navigator.of(context)
                                                        //     .pushNamed('/profile');
                                                        Navigator.of(context).push(
                                                            PageRouteBuilder(
                                                                transitionDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            400),
                                                                pageBuilder: (context,
                                                                        animation,
                                                                        secondaryAnimation) =>
                                                                    Profile(),
                                                                transitionsBuilder: (BuildContext context,
                                                                    Animation<
                                                                            double>
                                                                        animation,
                                                                    Animation<
                                                                            double>
                                                                        secondaryAnimation,
                                                                    Widget
                                                                        child) {
                                                                  return new SlideTransition(
                                                                    position: new Tween<
                                                                        Offset>(
                                                                      //Left to right
                                                                      // begin: const Offset(-1.0, 0.0),
                                                                      // end: Offset.zero,

                                                                      //Right to left
                                                                      begin: const Offset(
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
                                                                    child:
                                                                        child,
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
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 15),
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
                                                          backgroundImage:
                                                              NetworkImage(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  provider.objDashboardResponse.data.jobRequest
                                          .isEmpty
                                      ? Center(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 300),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "No jobs available at the moment!.",
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: 14,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : provider
                                                  .objDashboardResponse
                                                  .data
                                                  .userProfile
                                                  .userDocVerification ==
                                              "nonverified"
                                          ? Container()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                  left: 22, top: 20),
                                              child: Text(
                                                "Today",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Medium",
                                                    color: Color(0xff6B6A6A)),
                                              ),
                                            ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),

                                  provider.objDashboardResponse.data.jobRequest
                                          .isEmpty
                                      ? Container()
                                      : provider
                                                  .objDashboardResponse
                                                  .data
                                                  .userProfile
                                                  .userDocVerification ==
                                              "nonverified"
                                          ? Center(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 300),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "You are not verified user.\nPlease contact your administrator",
                                                  style: TextStyle(
                                                      fontFamily: "Medium",
                                                      fontSize: 14,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: provider
                                                      .objDashboardResponse
                                                      .data
                                                      .jobRequest
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    var transactionItem =
                                                        provider
                                                            .objDashboardResponse
                                                            .data
                                                            .jobRequest;
                                                    return transactionItem[
                                                                    index]
                                                                .status ==
                                                            "Pending"
                                                        ? Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxHeight:
                                                                        double
                                                                            .infinity),
                                                            width: 374,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20,
                                                                    left: 20,
                                                                    top: 10,
                                                                    bottom: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(0,
                                                                          0.5),
                                                                  blurRadius:
                                                                      0.0,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color(
                                                                  0xffF6F6FE),
                                                            ),
                                                            child: Wrap(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          48,
                                                                      width: 64,
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              13),
                                                                      child: Image
                                                                          .network(
                                                                        transactionItem[index]
                                                                            .userVehicle!
                                                                            .brand!
                                                                            .image
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin: EdgeInsets.only(
                                                                              left: 11,
                                                                              top: 13,
                                                                              bottom: 10),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].user!.name}",
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontFamily: "SemiBold",
                                                                                color: Colors.black),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin: EdgeInsets.only(
                                                                              left: 11,
                                                                              bottom: 10),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin:
                                                                              EdgeInsets.only(left: 11),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(
                                                                                left: 11,
                                                                              ),
                                                                              height: 20,
                                                                              width: 17.06,
                                                                              child: SvgPicture.asset(
                                                                                "assets/images/map-marker.svg",
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                ? Container(
                                                                                    constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                    child: Text(
                                                                                      "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                      style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                    ),
                                                                                  )
                                                                                : Container(
                                                                                    constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                    child: Text(
                                                                                      "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                      style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                    ),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 1,
                                                                  color: Color(
                                                                      0xffDDDDF7),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              21,
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Color(0xffFFF6F6),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            minimumSize: Size(124, 44),
                                                                            side: BorderSide(color: Color(0xffE32222), width: 1)),
                                                                        onPressed:
                                                                            () {
                                                                          // showLogoutDialog(
                                                                          //  context, provider);

                                                                          transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                              ? Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => NotGoingScreen(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, address: "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector} " " ", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                                  ))
                                                                              : Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => NotGoingScreen(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, address: "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                        child:
                                                                            const Text(
                                                                          'Not Going',
                                                                          style: TextStyle(
                                                                              color: Color(0xffE32222),
                                                                              fontSize: 16,
                                                                              fontFamily: "SemiBold"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              20,
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              ColorTheme.themeGreenColor,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          minimumSize: Size(
                                                                              124,
                                                                              44),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          // showLogoutDialog(
                                                                          //  context, provider);
                                                                          // Navigator.of(context)
                                                                          //     .pushNamed('/addAddress');
                                                                          transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                              ? Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => JobStatus(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, flatHouseNo: "${transactionItem[index].userAddress!.flatHouseNo}", areaSector: "${transactionItem[index].userAddress!.areaSector}", nearby: "", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                                  ))
                                                                              : Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => JobStatus(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, flatHouseNo: "${transactionItem[index].userAddress!.flatHouseNo}", areaSector: "${transactionItem[index].userAddress!.areaSector}", nearby: "${transactionItem[index].userAddress!.nearby}", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                        child:
                                                                            const Text(
                                                                          'Cleaning Done',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16,
                                                                              fontFamily: "SemiBold"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : transactionItem[index]
                                                                    .status ==
                                                                "Not Going"
                                                            ? Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxHeight:
                                                                            double.infinity),
                                                                width: 374,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20,
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0.5),
                                                                      blurRadius:
                                                                          0.0,
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  color: Color(
                                                                      0xffF6F6FE),
                                                                ),
                                                                child: Wrap(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              48,
                                                                          width:
                                                                              64,
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 11,
                                                                              top: 13),
                                                                          child:
                                                                              Image.network(
                                                                            transactionItem[index].userVehicle!.brand!.image.toString(),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, top: 13, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].user!.name}",
                                                                                style: TextStyle(fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                                style: TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.only(
                                                                                    left: 11,
                                                                                  ),
                                                                                  height: 20,
                                                                                  width: 17.06,
                                                                                  child: SvgPicture.asset(
                                                                                    "assets/images/map-marker.svg",
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                    ? Container(
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      )
                                                                                    : Container(
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      height: 1,
                                                                      color: Color(
                                                                          0xffDDDDF7),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 20),
                                                                          child:
                                                                              ElevatedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.red,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                ),
                                                                                minimumSize: Size(124, 44),
                                                                                side: BorderSide(color: Color(0xffE32222), width: 1)),
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text(
                                                                              'Job Declined',
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "SemiBold"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxHeight:
                                                                            double.infinity),
                                                                width: 374,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20,
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0.5),
                                                                      blurRadius:
                                                                          0.0,
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  color: Color(
                                                                      0xffF6F6FE),
                                                                ),
                                                                child: Wrap(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              48,
                                                                          width:
                                                                              64,
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 11,
                                                                              top: 13),
                                                                          child:
                                                                              Image.network(
                                                                            transactionItem[index].userVehicle!.brand!.image.toString(),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, top: 13, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].user!.name}",
                                                                                style: TextStyle(fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                                style: TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.only(
                                                                                    left: 11,
                                                                                  ),
                                                                                  height: 20,
                                                                                  width: 17.06,
                                                                                  child: SvgPicture.asset(
                                                                                    "assets/images/map-marker.svg",
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                    ? Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                          style: TextStyle(fontSize: 13, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      )
                                                                                    : Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                          style: TextStyle(fontSize: 13, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      height: 1,
                                                                      color: Color(
                                                                          0xffDDDDF7),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 20),
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.green,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(6.0),
                                                                              ),
                                                                              minimumSize: Size(124, 44),
                                                                            ),
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text(
                                                                              'Job Completed',
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "SemiBold"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                  }),
                                            )
                                ],
                              )
                            : Stack(
                                alignment: AlignmentDirectional.topCenter,
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xff0072C6),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "Dashboard",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Spacer(),
                                            Environment.notificationStatus ==
                                                    "0"
                                                ? GestureDetector(
                                                    onTap: () {
                                                      // showAlertDialog(
                                                      //     provider, context);
                                                      // provider
                                                      //     .getNotificationStatusApi(
                                                      //         "1", context);
                                                    },
                                                    child: Container(
                                                      height: 15,
                                                      width: 28,
                                                      child: Image.asset(
                                                          "assets/images/toggle.png"),
                                                    ),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      // showAlertDialog(
                                                      //     provider, context);
                                                      // provider
                                                      //     .getNotificationStatusApi(
                                                      //         "1", context);
                                                    },
                                                    child: Container(
                                                      height: 15,
                                                      width: 28,
                                                      child: SvgPicture.asset(
                                                          "assets/images/toggle-active.svg"),
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            provider
                                                            .objDashboardResponse
                                                            .data
                                                            .userProfile
                                                            ?.profileImageUrl ==
                                                        "" ||
                                                    provider
                                                            .objDashboardResponse
                                                            .data
                                                            .userProfile
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
                                                        provider.isProfileEdit =
                                                            true;
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                '/profile');
                                                      },
                                                    ),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      provider.isProfileEdit =
                                                          true;
                                                      // Navigator.of(context)
                                                      //     .pushNamed('/profile');
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              transitionDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          400),
                                                              pageBuilder: (context,
                                                                      animation,
                                                                      secondaryAnimation) =>
                                                                  Profile(),
                                                              transitionsBuilder: (BuildContext
                                                                      context,
                                                                  Animation<
                                                                          double>
                                                                      animation,
                                                                  Animation<
                                                                          double>
                                                                      secondaryAnimation,
                                                                  Widget
                                                                      child) {
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
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      margin: EdgeInsets.only(
                                                          left: 5, right: 5),
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
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "${provider.objProfileViewResponse.data?.profileImageUrl}"),
                                                      ),
                                                      // child: Image.network(
                                                      //     // "https://binarymetrix-staging.com/yopee/storage/app/public/257/download.jpg"),
                                                      //     provider.objProfileViewResponse
                                                      //         .profileViewData.profileImageUrl),
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Card(
                                    elevation: 1,
                                    margin: EdgeInsets.only(
                                        right: 20.0, left: 20.0, top: 60),
                                    child: Container(
                                      height: 185,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff00000014),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 2.0,
                                            ),
                                          ]),
                                      padding: EdgeInsets.only(
                                          left: 15, top: 15, right: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          provider.objProfileViewResponse.data!
                                                  .name!.isEmpty
                                              ? Text(
                                                  "",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "Medium",
                                                      color: Color(0xff929292)),
                                                )
                                              : Row(
                                                  children: [
                                                    Text(
                                                      "Hi, ${provider.objProfileViewResponse.data!.name.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "Medium",
                                                          color: Color(
                                                              0xff929292)),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: double
                                                                  .infinity,
                                                              maxWidth: double
                                                                  .infinity),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: provider
                                                                      .objDashboardResponse
                                                                      .data
                                                                      .userProfile
                                                                      .userDocVerification ==
                                                                  "nonverified"
                                                              ? Color(
                                                                  0xffFF0000)
                                                              : Color(
                                                                  0xff1EB113)),
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: provider
                                                                  .objDashboardResponse
                                                                  .data
                                                                  .userProfile
                                                                  .userDocVerification ==
                                                              "nonverified"
                                                          ? Text(
                                                              "Non-Verified",
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  fontFamily:
                                                                      "Medium",
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          : Text(
                                                              "Verified",
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  fontFamily:
                                                                      "Medium",
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                    )
                                                  ],
                                                ),
                                          Row(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            'Total Earnings: ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "SemiBold",
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xff2B2B2B))),
                                                    provider.objDashboardResponse.data!
                                                                    .totalEarning ==
                                                                null ||
                                                            provider
                                                                    .objDashboardResponse
                                                                    .data!
                                                                    .totalEarning ==
                                                                ""
                                                        ? TextSpan(
                                                            text: "₹0",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 20,
                                                                color: Color(
                                                                    0xff0072C6)))
                                                        : TextSpan(
                                                            text:
                                                                "₹${provider.objDashboardResponse.data!.totalEarning.toString()}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                fontSize: 20,
                                                                color: Color(
                                                                    0xff0072C6)))
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                height: 58,
                                                width: 42,
                                                child: Image.asset(
                                                    "assets/images/money-bag.png"),
                                              )
                                            ],
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Last Month: ',
                                                    style: TextStyle(
                                                        fontFamily: "Medium",
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff828282))),
                                                provider.objDashboardResponse.data!
                                                                .lastMonth ==
                                                            null ||
                                                        provider
                                                                .objDashboardResponse
                                                                .data!
                                                                .lastMonth ==
                                                            ""
                                                    ? TextSpan(
                                                        text: "₹0",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff515151)))
                                                    : TextSpan(
                                                        text:
                                                            "₹${provider.objDashboardResponse.data!.lastMonth}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Medium",
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff515151))),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 1,
                                            color:
                                                ColorTheme.themeLightGrayColor,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              provider.setEarningMenu(false);
                                              // Navigator.of(context)
                                              //     .pushNamed('/earning');
                                              Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  400),
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          EarningScreen(),
                                                      transitionsBuilder:
                                                          (BuildContext context,
                                                              Animation<double>
                                                                  animation,
                                                              Animation<double>
                                                                  secondaryAnimation,
                                                              Widget child) {
                                                        return new SlideTransition(
                                                          position:
                                                              new Tween<Offset>(
                                                            //Left to right
                                                            // begin: const Offset(-1.0, 0.0),
                                                            // end: Offset.zero,

                                                            //Right to left
                                                            begin: const Offset(
                                                                1.0, 0.0),
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
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(left: 60),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "See Earnings History",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "SemiBold",
                                                        color:
                                                            Color(0xff2B2B2B)),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 10,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 280, left: 22, right: 20),
                                    constraints: BoxConstraints(
                                        maxHeight: double.infinity),
                                    width: 374,
                                    padding: EdgeInsets.only(
                                        left: 22,
                                        right: 22,
                                        top: 14,
                                        bottom: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff0072C6),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Work Report",
                                              style: TextStyle(
                                                  fontFamily: "SemiBold",
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 21,
                                              width: 27,
                                              child: SvgPicture.asset(
                                                "assets/images/dashboard/car-solid.svg",
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 21,
                                              width: 27,
                                              child: Image.asset(
                                                "assets/images/today.png",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Today",
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            provider.objDashboardResponse.data!
                                                            .today ==
                                                        null ||
                                                    provider.objDashboardResponse
                                                            .data!.today ==
                                                        ""
                                                ? Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    "${provider.objDashboardResponse.data!.today}",
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 21,
                                              width: 27,
                                              child: Image.asset(
                                                "assets/images/monthly.png",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Monthly",
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            provider.objDashboardResponse.data!
                                                            .monthly ==
                                                        null ||
                                                    provider.objDashboardResponse
                                                            .data!.monthly ==
                                                        0
                                                ? Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    provider
                                                        .objDashboardResponse
                                                        .data!
                                                        .monthly
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 21,
                                              width: 27,
                                              child: Image.asset(
                                                "assets/images/rating.png",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Overall Rating",
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            provider.objDashboardResponse.data!
                                                            .overall ==
                                                        null ||
                                                    provider.objDashboardResponse
                                                            .data!.overall ==
                                                        0
                                                ? Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    provider
                                                        .objDashboardResponse
                                                        .data!
                                                        .overall
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "SemiBold",
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            provider.objDashboardResponse.data
                                                        .specialRequest! <
                                                    1
                                                ? Container()
                                                : Navigator
                                                        .of(context)
                                                    .push(PageRouteBuilder(
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    400),
                                                        pageBuilder: (context,
                                                                animation,
                                                                secondaryAnimation) =>
                                                            SpecialRequest(),
                                                        transitionsBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Animation<
                                                                        double>
                                                                    animation,
                                                                Animation<
                                                                        double>
                                                                    secondaryAnimation,
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
                                                                      1.0, 0.0),
                                                              end: Offset.zero,

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
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 21,
                                                width: 27,
                                                child: Image.asset(
                                                  "assets/images/request.png",
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Special Request",
                                                style: TextStyle(
                                                    fontFamily: "Medium",
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                              Spacer(),
                                              provider.objDashboardResponse.data!
                                                              .specialRequest ==
                                                          null ||
                                                      provider
                                                              .objDashboardResponse
                                                              .data!
                                                              .specialRequest ==
                                                          0
                                                  ? Text(
                                                      "0",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SemiBold",
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    )
                                                  : Text(
                                                      provider
                                                          .objDashboardResponse
                                                          .data!
                                                          .specialRequest
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SemiBold",
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  provider.objDashboardResponse.data.jobRequest
                                          .isEmpty
                                      ? Container()
                                      : provider
                                                  .objDashboardResponse
                                                  .data
                                                  .userProfile
                                                  .userDocVerification ==
                                              "nonverified"
                                          ? Container()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                  left: 22, top: 510),
                                              child: Text(
                                                "Today",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Medium",
                                                    color: Color(0xff6B6A6A)),
                                              ),
                                            ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  provider.objDashboardResponse.data.jobRequest
                                          .isEmpty
                                      ? Container()
                                      : provider
                                                  .objDashboardResponse
                                                  .data
                                                  .userProfile
                                                  .userDocVerification ==
                                              "nonverified"
                                          ? Center(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 600),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "You are not verified user.\nPlease contact your administrator",
                                                  style: TextStyle(
                                                      fontFamily: "Medium",
                                                      fontSize: 14,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(top: 550),
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: provider
                                                      .objDashboardResponse
                                                      .data
                                                      .jobRequest
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    var transactionItem =
                                                        provider
                                                            .objDashboardResponse
                                                            .data
                                                            .jobRequest;
                                                    return transactionItem[
                                                                    index]
                                                                .status ==
                                                            "Pending"
                                                        ? Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxHeight:
                                                                        double
                                                                            .infinity),
                                                            width: 374,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20,
                                                                    left: 20,
                                                                    top: 10,
                                                                    bottom: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(0,
                                                                          0.5),
                                                                  blurRadius:
                                                                      0.0,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color(
                                                                  0xffF6F6FE),
                                                            ),
                                                            child: Wrap(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          48,
                                                                      width: 64,
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              13),
                                                                      child: Image
                                                                          .network(
                                                                        transactionItem[index]
                                                                            .userVehicle!
                                                                            .brand!
                                                                            .image
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin: EdgeInsets.only(
                                                                              left: 11,
                                                                              top: 13,
                                                                              bottom: 10),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].user!.name}",
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontFamily: "SemiBold",
                                                                                color: Colors.black),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin: EdgeInsets.only(
                                                                              left: 11,
                                                                              bottom: 10),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              19,
                                                                          margin:
                                                                              EdgeInsets.only(left: 11),
                                                                          child:
                                                                              Text(
                                                                            "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Wrap(
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(
                                                                                left: 11,
                                                                              ),
                                                                              height: 20,
                                                                              width: 17.06,
                                                                              child: SvgPicture.asset(
                                                                                "assets/images/map-marker.svg",
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                ? Container(
                                                                                    constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                    child: Text(
                                                                                      "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                      style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                    ),
                                                                                  )
                                                                                : Container(
                                                                                    constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                    child: Text(
                                                                                      "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                      style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                    ),
                                                                                  )
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 1,
                                                                  color: Color(
                                                                      0xffDDDDF7),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              21,
                                                                          bottom:
                                                                              20),
                                                                      constraints: BoxConstraints(
                                                                          maxHeight: double
                                                                              .infinity,
                                                                          maxWidth:
                                                                              double.infinity),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Color(0xffFFF6F6),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            // minimumSize: Size(124, 44),
                                                                            side: BorderSide(color: Color(0xffE32222), width: 1)),
                                                                        onPressed:
                                                                            () {
                                                                          // showLogoutDialog(
                                                                          //  context, provider);
                                                                          transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                              ? Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => NotGoingScreen(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, address: "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector} " " ", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                                  ))
                                                                              : Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => NotGoingScreen(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, address: "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                        child:
                                                                            const Text(
                                                                          'Not Going',
                                                                          style: TextStyle(
                                                                              color: Color(0xffE32222),
                                                                              fontSize: 16,
                                                                              fontFamily: "SemiBold"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              20,
                                                                          bottom:
                                                                              20),
                                                                      constraints: BoxConstraints(
                                                                          maxHeight: double
                                                                              .infinity,
                                                                          maxWidth:
                                                                              double.infinity),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              ColorTheme.themeGreenColor,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          // minimumSize: Size(
                                                                          //     124,
                                                                          //     44),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          // showLogoutDialog(
                                                                          //  context, provider);
                                                                          // Navigator.of(context)
                                                                          //     .pushNamed('/addAddress');

                                                                          transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                              ? Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => JobStatus(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, flatHouseNo: "${transactionItem[index].userAddress!.flatHouseNo}", areaSector: "${transactionItem[index].userAddress!.areaSector}", nearby: "", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                                  ))
                                                                              : Navigator.of(context).push(PageRouteBuilder(
                                                                                  transitionDuration: const Duration(milliseconds: 400),
                                                                                  pageBuilder: (context, animation, secondaryAnimation) => JobStatus(id: transactionItem[index].id.toString(), brandImage: transactionItem[index].userVehicle!.brand!.image, brandName: transactionItem[index].userVehicle!.brand!.name, registrationName: transactionItem[index].userVehicle!.registrationNo, modelName: transactionItem[index].userVehicle!.model!.name, vehicleName: transactionItem[index].userVehicle!.vehicle!.name, flatHouseNo: "${transactionItem[index].userAddress!.flatHouseNo}", areaSector: "${transactionItem[index].userAddress!.areaSector}", nearby: "${transactionItem[index].userAddress!.nearby}", name: transactionItem[index].user!.name),
                                                                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                                                                        child:
                                                                            const Text(
                                                                          'Cleaning Done',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16,
                                                                              fontFamily: "SemiBold"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : transactionItem[index]
                                                                    .status ==
                                                                "Not Going"
                                                            ? Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxHeight:
                                                                            double.infinity),
                                                                width: 374,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20,
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0.5),
                                                                      blurRadius:
                                                                          0.0,
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  color: Color(
                                                                      0xffF6F6FE),
                                                                ),
                                                                child: Wrap(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              48,
                                                                          width:
                                                                              64,
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 11,
                                                                              top: 13),
                                                                          child:
                                                                              Image.network(
                                                                            transactionItem[index].userVehicle!.brand!.image.toString(),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, top: 13, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].user!.name}",
                                                                                style: TextStyle(fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                                style: TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.only(
                                                                                    left: 11,
                                                                                  ),
                                                                                  height: 20,
                                                                                  width: 17.06,
                                                                                  child: SvgPicture.asset(
                                                                                    "assets/images/map-marker.svg",
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                    ? Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      )
                                                                                    : Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      )
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      height: 1,
                                                                      color: Color(
                                                                          0xffDDDDF7),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 20),
                                                                          constraints: BoxConstraints(
                                                                              maxHeight: double.infinity,
                                                                              maxWidth: double.infinity),
                                                                          child:
                                                                              ElevatedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.red,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                ),
                                                                                // minimumSize: Size(124, 44),
                                                                                side: BorderSide(color: Color(0xffE32222), width: 1)),
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text(
                                                                              'Job Declined',
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "SemiBold"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxHeight:
                                                                            double.infinity),
                                                                width: 374,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20,
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0.5),
                                                                      blurRadius:
                                                                          0.0,
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  color: Color(
                                                                      0xffF6F6FE),
                                                                ),
                                                                child: Wrap(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              48,
                                                                          width:
                                                                              64,
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 11,
                                                                              top: 13),
                                                                          child:
                                                                              Image.network(
                                                                            transactionItem[index].userVehicle!.brand!.image.toString(),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, top: 13, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].user!.name}",
                                                                                style: TextStyle(fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11, bottom: 10),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.brand!.name} ${transactionItem[index].userVehicle!.model!.name}",
                                                                                style: TextStyle(fontSize: 14, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 19,
                                                                              margin: EdgeInsets.only(left: 11),
                                                                              child: Text(
                                                                                "${transactionItem[index].userVehicle!.registrationNo} | ${transactionItem[index].userVehicle!.vehicle!.name}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "Medium"),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.only(
                                                                                    left: 11,
                                                                                  ),
                                                                                  height: 20,
                                                                                  width: 17.06,
                                                                                  child: SvgPicture.asset(
                                                                                    "assets/images/map-marker.svg",
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                transactionItem[index].userAddress!.nearby == "" || transactionItem[index].userAddress!.nearby == null
                                                                                    ? Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      )
                                                                                    : Container(
                                                                                        constraints: BoxConstraints(maxHeight: double.infinity, maxWidth: 200),
                                                                                        child: Text(
                                                                                          "${transactionItem[index].userAddress!.flatHouseNo}, ${transactionItem[index].userAddress!.areaSector}, ${transactionItem[index].userAddress!.nearby}",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "Medium", color: Color(0xff464646)),
                                                                                        ),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      height: 1,
                                                                      color: Color(
                                                                          0xffDDDDF7),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 20),
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.green,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(6.0),
                                                                              ),
                                                                              minimumSize: Size(124, 44),
                                                                            ),
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text(
                                                                              'Job Completed',
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "SemiBold"),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                  }),
                                            ),
                                ],
                              )
                      ],
                    ),
                  ),
            // bottomNavigationBar: bottomBar(context, provider),
          ),
        ),
      );
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

  Future<void> showAlertDialog(
      YopeeProvider provider, BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                        fontFamily: "Medium",
                        fontSize: 16,
                        color: ColorTheme.themeDarkBlueColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Do you want to receive notification?',
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 14,
                          color: ColorTheme.themeCircularColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          provider.getNotificationStatusApi("0", context);
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don',
                                style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: '\'',
                                style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: 't Allow',
                                style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Allow',
                          style: TextStyle(
                              fontFamily: "SemiBold",
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          provider.getNotificationStatusApi("1", context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF6F6FE),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> showProfileDialog(BuildContext context, YopeeProvider provider) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            content: Container(
              width: 150,
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Please fill Your Profile Details",
                    style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 14,
                        color: ColorTheme.themeDarkBlueColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          // Fluttertoast.showToast(
                          //     msg: "Please fill your profile details first!!",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);
                        },
                        //return false when click on "NO"
                        child: Text(
                          'No',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Regular",
                              color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.isProfileEdit = true;
                          Navigator.of(context).pushNamed('/profile');
                        },

                        //return true when click on "Yes"
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Regular",
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
