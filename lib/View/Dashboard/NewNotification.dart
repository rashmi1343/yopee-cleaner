import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';

class NewNotificationScreen extends StatefulWidget {
  NewNotificationScreenState createState() => NewNotificationScreenState();
}

class NewNotificationScreenState extends State<NewNotificationScreen> {
  // final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getListNotificationApi("unread", context);
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
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              centerTitle: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                icon: SvgPicture.asset(
                  "assets/images/arrow-left-solid.svg",
                  height: 18,
                  width: 18,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SemiBold", color: Colors.white),
              ),
              // actions: [
              //   Container(
              //     height: 15,
              //     width: 28,
              //     child: Image.asset(
              //       "assets/images/toggle.png",
              //       color: Color(0xff00FF00),
              //     ),
              //   ),
              //   Container(
              //     height: 50,
              //     width: 50,
              //     child: IconButton(
              //       icon: Image.asset(
              //         "assets/images/menu/profile.png",
              //       ),
              //       onPressed: () {
              //         // provider.isProfileEdit = true;
              //         Navigator.of(context).pushNamed('/profile');
              //       },
              //     ),
              //   ),
              // ],
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
                  // Row(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         // provider.setUnreadNotificationVisibility(true);
                  //         // provider.getListNotificationApi("unread", context);
                  //       },
                  //       child: Container(
                  //         height: 19,
                  //         margin:
                  //         EdgeInsets.only(left: 31, top: 13, bottom: 10),
                  //         child: Text(
                  //           "New",
                  //           style: TextStyle(
                  //               fontSize: 15,
                  //               fontFamily: "Medium",
                  //               color: Color(0xff0BADBC)),
                  //         ),
                  //       ),
                  //     ),
                  //     Spacer(),
                  //     GestureDetector(
                  //       onTap: () {
                  //         provider.objListNotificationResponse.data.isEmpty
                  //             ? Fluttertoast.showToast(
                  //             msg: "No Notification to delete ",
                  //             toastLength: Toast.LENGTH_SHORT,
                  //             gravity: ToastGravity.CENTER,
                  //             timeInSecForIosWeb: 1,
                  //             backgroundColor: Colors.red,
                  //             textColor: Colors.white,
                  //             fontSize: 16.0)
                  //             : provider.getDeleteNotificationApi(
                  //             provider.objLoginResponse.data!.id.toString(),
                  //             context);
                  //       },
                  //       child: Container(
                  //         margin: EdgeInsets.only(right: 20),
                  //         height: 17,
                  //         width: 14,
                  //         child: SvgPicture.asset(
                  //           "assets/images/trash-can-regular.svg",
                  //           color: Color(0xff444444),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
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

                  provider.objListNotificationResponse.data.isEmpty
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 300),
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
                          itemCount:
                              provider.objListNotificationResponse.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var listNotificationItem =
                                provider.objListNotificationResponse.data;
                            return GestureDetector(
                              onTap: () {
                                provider.getReadNotificationApi(
                                    listNotificationItem[index]
                                        .message!
                                        .id
                                        .toString(),
                                    context);
                              },
                              child: Container(
                                  height: 88,
                                  width: 373,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 17, bottom: 23, top: 15),
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Color(0xffF6F6FE)),
                                            child: SvgPicture.asset(
                                                "assets/images/feedback.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Text(
                                              listNotificationItem[index]
                                                  .message!
                                                  .content
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: 15,
                                                  color: Color(0xff3B3B3B)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          }),

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
      );
    });
  }
}
