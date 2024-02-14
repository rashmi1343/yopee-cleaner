import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/AppBottomNav.dart';
import 'package:yopee_cleaner/View/NotGoingScreen.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../Router/Routes.dart';
import '../Utility/Environment.dart';
import 'JobStatus.dart';

class SpecialRequest extends StatefulWidget {
  SpecialRequestState createState() => SpecialRequestState();
}

class SpecialRequestState extends State<SpecialRequest> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);

      provider.getDashboardApi(context);
      String month =
          DateFormat("yyyy-MM-dd").format(provider.selectedDateSpclReq);

      provider.getSpecialRequestListApi(month, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return RefreshIndicator(
        onRefresh: () {
          String month =
              DateFormat("yyyy-MM-dd").format(provider.selectedDateSpclReq);

          return provider.getSpecialRequestListApi(month, context);
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
                automaticallyImplyLeading: true,
                elevation: 4,
                shadowColor: Color(0xff00000029),
                toolbarHeight: 53,
                centerTitle: false,
                leading: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     '/home', (Route<dynamic> route) => false);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AppBottomNav(),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              //Left to right
                              begin: const Offset(-1.0, 0.0),
                              end: Offset.zero,

                              //Right to left
                              // begin: const Offset(1.0, 0.0),
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
                  },
                ),
                title: const Text(
                  "Special Request",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SemiBold",
                      color: Colors.white),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      provider.selectDateSpclReq(context);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
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
                          child: SvgPicture.asset(
                            "assets/images/toggle-active.svg",
                          ),
                        )
                      : Container(
                          height: 15,
                          width: 28,
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
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 19,
                    //   margin: EdgeInsets.only(left: 31, top: 20.5, bottom: 10),
                    //   child: Text(
                    //     "10 Sep 2023",
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: "Medium",
                    //         color: Colors.black),
                    //   ),
                    // ),
                    provider.objSpecialRequestListResponse.data!.length == 0
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 300),
                              child: Text(
                                "No Request Available!!",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "Medium",
                                    fontSize: 15),
                              ),
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider
                                .objSpecialRequestListResponse.data?.length,
                            itemBuilder: (context, index) {
                              var spclReqListItem =
                                  provider.objSpecialRequestListResponse.data;

                              return spclReqListItem[index].status == "Pending"
                                  ? Column(
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxHeight: double.infinity,
                                              maxWidth: 374),
                                          margin: EdgeInsets.only(
                                              right: 20, top: 10, left: 20),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 0.5),
                                                blurRadius: 0.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: ColorTheme.themeWhiteColor,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                  ),
                                                  height: 48,
                                                  width: 64,
                                                  child: spclReqListItem?[index]
                                                              .userVehicle!
                                                              .brand!
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          "assets/images/dashboard/car-solid.svg")
                                                      : Image.network(
                                                          "${spclReqListItem![index].userVehicle!.brand!.image.toString()}")),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                      "${spclReqListItem![index].user.name}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "SemiBold",
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 19,
                                                    margin: EdgeInsets.only(
                                                        left: 31, bottom: 10),
                                                    child: Text(
                                                      "${spclReqListItem?[index].userVehicle!.brand!.name.toString()} ${spclReqListItem?[index].userVehicle!.model!.name.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "SemiBold"),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 19,
                                                    margin: EdgeInsets.only(
                                                        left: 31),
                                                    child: Text(
                                                      "${spclReqListItem?[index].userVehicle!.registrationNo.toString()} | ${spclReqListItem?[index].userVehicle!.vehicle!.name.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "Medium"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          left: 31,
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
                                                      spclReqListItem?[index]
                                                                      .userAddress!
                                                                      .nearby ==
                                                                  "" ||
                                                              spclReqListItem?[
                                                                          index]
                                                                      .userAddress!
                                                                      .nearby ==
                                                                  null
                                                          ? Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                              child: Text(
                                                                "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "Medium",
                                                                    color: Color(
                                                                        0xff464646)),
                                                              ),
                                                            )
                                                          : Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                              child: Text(
                                                                "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}, ${spclReqListItem?[index].userAddress!.nearby}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "Medium",
                                                                    color: Color(
                                                                        0xff464646)),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  spclReqListItem[index]
                                                                  .service
                                                                  .price ==
                                                              "" ||
                                                          spclReqListItem[index]
                                                                  .service
                                                                  .price ==
                                                              null
                                                      ? Container(
                                                          height: 19,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 31,
                                                                  bottom: 20),
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        'Amount: ',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SemiBold",
                                                                        fontSize:
                                                                            16,
                                                                        color: Color(
                                                                            0xff2B2B2B))),
                                                                TextSpan(
                                                                  text: '₹',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          "SemiBold",
                                                                      color: Color(
                                                                          0xff0072C6)),
                                                                ),
                                                              ],
                                                            ),
                                                          ))
                                                      : Container(
                                                          height: 19,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 31,
                                                                  bottom: 20),
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        'Amount: ',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SemiBold",
                                                                        fontSize:
                                                                            16,
                                                                        color: Color(
                                                                            0xff2B2B2B))),
                                                                TextSpan(
                                                                  text:
                                                                      '₹${spclReqListItem[index].service.discountPrice}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          "SemiBold",
                                                                      color: Color(
                                                                          0xff0072C6)),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 21,
                                              ),
                                              constraints: BoxConstraints(
                                                  maxWidth: double.infinity,
                                                  maxHeight: double.infinity),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xffFFF6F6),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                    // minimumSize: Size(174, 44),
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xffE32222),
                                                        width: 1)),
                                                onPressed: () {
                                                  // showLogoutDialog(
                                                  //  context, provider);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                NotGoingScreen(
                                                                  id: spclReqListItem[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  brandImage: spclReqListItem?[
                                                                          index]
                                                                      .userVehicle!
                                                                      .brand!
                                                                      .image
                                                                      .toString(),
                                                                  brandName: spclReqListItem?[
                                                                          index]
                                                                      .userVehicle!
                                                                      .brand!
                                                                      .name
                                                                      .toString(),
                                                                  registrationName: spclReqListItem?[
                                                                          index]
                                                                      .userVehicle!
                                                                      .registrationNo
                                                                      .toString(),
                                                                  modelName: spclReqListItem?[
                                                                          index]
                                                                      .userVehicle!
                                                                      .model!
                                                                      .name
                                                                      .toString(),
                                                                  vehicleName: spclReqListItem?[
                                                                          index]
                                                                      .userVehicle!
                                                                      .vehicle!
                                                                      .name
                                                                      .toString(),
                                                                  address:
                                                                      "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}, ${spclReqListItem?[index].userAddress!.nearby}",
                                                                  name: "",
                                                                )),
                                                  );
                                                },
                                                child: const Text(
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
                                              margin: const EdgeInsets.only(
                                                right: 20,
                                              ),
                                              constraints: BoxConstraints(
                                                  maxWidth: double.infinity,
                                                  maxHeight: double.infinity),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: ColorTheme
                                                      .themeGreenColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  // minimumSize: Size(174, 44),
                                                ),
                                                onPressed: () {
                                                  // provider.getStatusApi(
                                                  //     spclReqListItem[index]
                                                  //         .id
                                                  //         .toString(),
                                                  //     "Done",
                                                  //     "",
                                                  //     "",
                                                  //     context);

                                                  Navigator.of(context).push(
                                                      PageRouteBuilder(
                                                          transitionDuration: const Duration(
                                                              milliseconds:
                                                                  400),
                                                          pageBuilder: (context, animation, secondaryAnimation) => JobStatus(
                                                              id: spclReqListItem[index]
                                                                  .id
                                                                  .toString(),
                                                              brandImage: spclReqListItem[index]
                                                                  .userVehicle!
                                                                  .brand!
                                                                  .image,
                                                              brandName: spclReqListItem[index]
                                                                  .userVehicle!
                                                                  .brand!
                                                                  .name,
                                                              registrationName: spclReqListItem[index]
                                                                  .userVehicle!
                                                                  .registrationNo,
                                                              modelName: spclReqListItem[index]
                                                                  .userVehicle!
                                                                  .model!
                                                                  .name,
                                                              vehicleName: spclReqListItem[index]
                                                                  .userVehicle!
                                                                  .vehicle!
                                                                  .name,
                                                              flatHouseNo:
                                                                  "${spclReqListItem[index].userAddress!.flatHouseNo}",
                                                              areaSector:
                                                                  "${spclReqListItem[index].userAddress!.areaSector}",
                                                              nearby:
                                                                  "${spclReqListItem[index].userAddress!.nearby}",
                                                              name: spclReqListItem[index]
                                                                  .user!
                                                                  .name),
                                                          transitionsBuilder: (BuildContext context,
                                                              Animation<double> animation,
                                                              Animation<double> secondaryAnimation,
                                                              Widget child) {
                                                            return new SlideTransition(
                                                              position:
                                                                  new Tween<
                                                                      Offset>(
                                                                //Left to right
                                                                // begin: const Offset(-1.0, 0.0),
                                                                // end: Offset.zero,

                                                                //Right to left
                                                                begin:
                                                                    const Offset(
                                                                        1.0,
                                                                        0.0),
                                                                end:
                                                                    Offset.zero,

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
                                                child: const Text(
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
                                    )
                                  : spclReqListItem[index].status == "Not Going"
                                      ? Column(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: double.infinity,
                                                  maxWidth: 374),
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10, left: 20),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 0.5),
                                                    blurRadius: 0.0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color:
                                                    ColorTheme.themeWhiteColor,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        top: 10,
                                                      ),
                                                      height: 48,
                                                      width: 64,
                                                      child: spclReqListItem?[
                                                                      index]
                                                                  .userVehicle!
                                                                  .brand!
                                                                  .image ==
                                                              null
                                                          ? Image.asset(
                                                              "assets/images/dashboard/car-solid.svg")
                                                          : Image.network(
                                                              "${spclReqListItem![index].userVehicle!.brand!.image.toString()}")),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31,
                                                            top: 13,
                                                            bottom: 10),
                                                        child: Text(
                                                          "${spclReqListItem![index].user.name}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "SemiBold",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31,
                                                            bottom: 10),
                                                        child: Text(
                                                          "${spclReqListItem?[index].userVehicle!.brand!.name.toString()} ${spclReqListItem?[index].userVehicle!.model!.name.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SemiBold"),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31),
                                                        child: Text(
                                                          "${spclReqListItem?[index].userVehicle!.registrationNo.toString()} | ${spclReqListItem?[index].userVehicle!.vehicle!.name.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Medium"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 31,
                                                            ),
                                                            height: 20,
                                                            width: 17.06,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/map-marker.svg",
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          spclReqListItem?[index]
                                                                          .userAddress!
                                                                          .nearby ==
                                                                      "" ||
                                                                  spclReqListItem?[
                                                                              index]
                                                                          .userAddress!
                                                                          .nearby ==
                                                                      null
                                                              ? Container(
                                                                  constraints: BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                                  child: Text(
                                                                    "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Medium",
                                                                        color: Color(
                                                                            0xff464646)),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  constraints: BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                                  child: Text(
                                                                    "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}, ${spclReqListItem?[index].userAddress!.nearby}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Medium",
                                                                        color: Color(
                                                                            0xff464646)),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      spclReqListItem[index]
                                                                      .service
                                                                      .price ==
                                                                  "" ||
                                                              spclReqListItem[
                                                                          index]
                                                                      .service
                                                                      .price ==
                                                                  null
                                                          ? Container(
                                                              height: 19,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 31,
                                                                      bottom:
                                                                          20),
                                                              child: Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            'Amount: ',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "SemiBold",
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xff2B2B2B))),
                                                                    TextSpan(
                                                                      text: '₹',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              "SemiBold",
                                                                          color:
                                                                              Color(0xff0072C6)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ))
                                                          : Container(
                                                              height: 19,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 31,
                                                                      bottom:
                                                                          20),
                                                              child: Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            'Amount: ',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "SemiBold",
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xff2B2B2B))),
                                                                    TextSpan(
                                                                      text:
                                                                          '₹${spclReqListItem[index].service.discountPrice}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              "SemiBold",
                                                                          color:
                                                                              Color(0xff0072C6)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                      Container(
                                                        height: 1,
                                                        color:
                                                            Color(0xffDDDDF7),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 20,
                                                                    left: 20),
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0),
                                                                      ),
                                                                      minimumSize:
                                                                          Size(
                                                                              124,
                                                                              44),
                                                                      side: BorderSide(
                                                                          color: Color(
                                                                              0xffE32222),
                                                                          width:
                                                                              1)),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                'Job Declined',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        "SemiBold"),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: double.infinity,
                                                  maxWidth: 374),
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10, left: 20),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 0.5),
                                                    blurRadius: 0.0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color:
                                                    ColorTheme.themeWhiteColor,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        top: 10,
                                                      ),
                                                      height: 48,
                                                      width: 64,
                                                      child: spclReqListItem?[
                                                                      index]
                                                                  .userVehicle!
                                                                  .brand!
                                                                  .image ==
                                                              null
                                                          ? Image.asset(
                                                              "assets/images/dashboard/car-solid.svg")
                                                          : Image.network(
                                                              "${spclReqListItem![index].userVehicle!.brand!.image.toString()}")),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31,
                                                            top: 13,
                                                            bottom: 10),
                                                        child: Text(
                                                          "${spclReqListItem![index].user.name}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "SemiBold",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31,
                                                            bottom: 10),
                                                        child: Text(
                                                          "${spclReqListItem?[index].userVehicle!.brand!.name.toString()} ${spclReqListItem?[index].userVehicle!.model!.name.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SemiBold"),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 19,
                                                        margin: EdgeInsets.only(
                                                            left: 31),
                                                        child: Text(
                                                          "${spclReqListItem?[index].userVehicle!.registrationNo.toString()} | ${spclReqListItem?[index].userVehicle!.vehicle!.name.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Medium"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 31,
                                                            ),
                                                            height: 20,
                                                            width: 17.06,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/map-marker.svg",
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          spclReqListItem?[index]
                                                                          .userAddress!
                                                                          .nearby ==
                                                                      "" ||
                                                                  spclReqListItem?[
                                                                              index]
                                                                          .userAddress!
                                                                          .nearby ==
                                                                      null
                                                              ? Container(
                                                                  constraints: BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                                  child: Text(
                                                                    "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Medium",
                                                                        color: Color(
                                                                            0xff464646)),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  constraints: BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                      maxWidth:
                                                                          200),
                                                                  child: Text(
                                                                    "${spclReqListItem?[index].userAddress!.flatHouseNo}, ${spclReqListItem?[index].userAddress!.areaSector}, ${spclReqListItem?[index].userAddress!.nearby}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Medium",
                                                                        color: Color(
                                                                            0xff464646)),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      spclReqListItem[index]
                                                                      .service
                                                                      .price ==
                                                                  "" ||
                                                              spclReqListItem[
                                                                          index]
                                                                      .service
                                                                      .price ==
                                                                  null
                                                          ? Container(
                                                              height: 19,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 31,
                                                                      bottom:
                                                                          20),
                                                              child: Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            'Amount: ',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "SemiBold",
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xff2B2B2B))),
                                                                    TextSpan(
                                                                      text: '₹',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              "SemiBold",
                                                                          color:
                                                                              Color(0xff0072C6)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ))
                                                          : Container(
                                                              height: 19,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 31,
                                                                      bottom:
                                                                          20),
                                                              child: Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            'Amount: ',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "SemiBold",
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xff2B2B2B))),
                                                                    TextSpan(
                                                                      text:
                                                                          '₹${spclReqListItem[index].service.discountPrice}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              "SemiBold",
                                                                          color:
                                                                              Color(0xff0072C6)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                      Container(
                                                        height: 1,
                                                        color:
                                                            Color(0xffDDDDF7),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 20,
                                                                    left: 20),
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                ),
                                                                minimumSize:
                                                                    Size(124,
                                                                        44),
                                                              ),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                'Job Completed',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        "SemiBold"),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        );
                            }),
                  ],
                )),
          //  bottomNavigationBar: bottomBar(context, provider),
        ),
      );
    });
  }
}
