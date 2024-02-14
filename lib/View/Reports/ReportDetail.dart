import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/Entity/Responses/JobDetailResponse.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';

class ReportDetail extends StatefulWidget {
  String? id;

  ReportDetail({required this.id});

  ReportDetailState createState() => ReportDetailState();
}

class ReportDetailState extends State<ReportDetail> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getReportsDetailApi(widget.id.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    // DateTime? actionAtTime =
    //     provider.objReportsDetailResponse.data.bookingDetails.actionAt;
    // String formattedTime =
    //     DateFormat("dd-MMM-yy hh:ss a").format(actionAtTime!);
    // print("formattedTime:$formattedTime");

    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
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
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              title: const Text(
                "Job Report",
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
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 374,
                    margin: EdgeInsets.only(right: 20, top: 10, left: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.5),
                          blurRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffF6F6FE),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            provider
                                            .objReportsDetailResponse
                                            .data
                                            .bookingDetails!
                                            .userVehicle!
                                            .brand!
                                            .image ==
                                        "" ||
                                    provider
                                            .objReportsDetailResponse
                                            .data
                                            .bookingDetails!
                                            .userVehicle!
                                            .brand!
                                            .image ==
                                        null
                                ? Container(
                                    height: 48,
                                    width: 64,
                                    margin: EdgeInsets.only(
                                        left: 10, bottom: 11, top: 13),
                                    child: Image.asset(
                                      "assets/images/carBrand/Suzuki.png",
                                      // errorBuilder: (BuildContext context,
                                      //     Object exception, StackTrace? stackTrace) {
                                      //   Navigator.pushReplacementNamed(
                                      //       context, '/reports');
                                      //   return Container();
                                      // },
                                    ),
                                  )
                                : Container(
                                    height: 48,
                                    width: 64,
                                    margin: EdgeInsets.only(
                                        left: 10, bottom: 11, top: 13),
                                    child: Image.network(
                                      "${provider.objReportsDetailResponse.data.bookingDetails!.userVehicle!.brand!.image}",
                                      // errorBuilder: (BuildContext context,
                                      //     Object exception, StackTrace? stackTrace) {
                                      //   Navigator.pushReplacementNamed(
                                      //       context, '/reports');
                                      //   return Container();
                                      // },
                                    ),
                                  ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                provider.objReportsDetailResponse.data
                                                .bookingDetails!.user!.name ==
                                            "" ||
                                        provider.objReportsDetailResponse.data
                                                .bookingDetails!.user!.name ==
                                            null
                                    ? Container(
                                        height: 19,
                                        margin: EdgeInsets.only(
                                            left: 31, top: 13, bottom: 10),
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "SemiBold",
                                              color: Colors.black),
                                        ),
                                      )
                                    : Container(
                                        height: 19,
                                        margin: EdgeInsets.only(
                                            left: 31, top: 13, bottom: 10),
                                        child: Text(
                                          "${provider.objReportsDetailResponse.data.bookingDetails!.user!.name}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "SemiBold",
                                              color: Colors.black),
                                        ),
                                      ),
                                provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .brand!
                                                .name ==
                                            "" ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .brand!
                                                .name ==
                                            null ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .model!
                                                .name ==
                                            "" ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .model!
                                                .name ==
                                            null
                                    ? Container(
                                        height: 19,
                                        margin: EdgeInsets.only(
                                            left: 31, bottom: 10),
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium"),
                                        ),
                                      )
                                    : Container(
                                        height: 19,
                                        margin: EdgeInsets.only(
                                            left: 31, bottom: 10),
                                        child: Text(
                                          "${provider.objReportsDetailResponse.data.bookingDetails!.userVehicle!.brand!.name} ${provider.objReportsDetailResponse.data.bookingDetails!.userVehicle!.model!.name}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium"),
                                        ),
                                      ),
                                provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .registrationNo ==
                                            "" ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .registrationNo ==
                                            null ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .vehicle!
                                                .name ==
                                            "" ||
                                        provider
                                                .objReportsDetailResponse
                                                .data
                                                .bookingDetails!
                                                .userVehicle!
                                                .vehicle!
                                                .name ==
                                            null
                                    ? Container(
                                        height: 19,
                                        margin: EdgeInsets.only(left: 31),
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Medium"),
                                        ),
                                      )
                                    : Container(
                                        height: 19,
                                        margin: EdgeInsets.only(left: 31),
                                        child: Text(
                                          "${provider.objReportsDetailResponse.data.bookingDetails!.userVehicle!.registrationNo} | ${provider.objReportsDetailResponse.data.bookingDetails!.userVehicle!.vehicle!.name}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Medium"),
                                        ),
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .flatHouseNo ==
                                                "" ||
                                            provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .flatHouseNo ==
                                                null ||
                                            provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .areaSector ==
                                                "" ||
                                            provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .areaSector ==
                                                null ||
                                            provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .nearby ==
                                                "" ||
                                            provider
                                                    .objReportsDetailResponse
                                                    .data
                                                    .bookingDetails!
                                                    .userAddress!
                                                    .nearby ==
                                                null
                                        ? Container(
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "Medium",
                                                  color: Color(0xff464646)),
                                            ),
                                          )
                                        : Container(
                                            child: Text(
                                              "${provider.objReportsDetailResponse.data.bookingDetails!.userAddress!.flatHouseNo}, ${provider.objReportsDetailResponse.data.bookingDetails!.userAddress!.areaSector}, ${provider.objReportsDetailResponse.data.bookingDetails!.userAddress!.nearby}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "Medium",
                                                  color: Color(0xff464646)),
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
                        Divider(
                          height: 1,
                          color: Color(0xffDDDDF7),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15, right: 16),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Date : ',
                                  style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: 13,
                                      color: Color(0xff003F69)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "34:56",
                                      style: TextStyle(
                                          fontFamily: "SemiBold",
                                          fontSize: 12,
                                          color: Color(0xff003F69)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            provider.objReportsDetailResponse.data
                                            .bookingDetails!.status ==
                                        "" ||
                                    provider.objReportsDetailResponse.data
                                            .bookingDetails!.status ==
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
                                            fontFamily: "Medium",
                                            fontSize: 13,
                                            color: Color(0xff003F69)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "",
                                            style: TextStyle(
                                                fontFamily: "SemiBold",
                                                fontSize: 13,
                                                color: Color(0xff1EB113)),
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
                                            fontFamily: "Medium",
                                            fontSize: 13,
                                            color: Color(0xff003F69)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                "${provider.objReportsDetailResponse.data.bookingDetails!.status}",
                                            style: TextStyle(
                                                fontFamily: "SemiBold",
                                                fontSize: 12,
                                                color: Color(0xff1EB113)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //  height: 19,
                    margin: EdgeInsets.only(left: 31, top: 13, bottom: 10),
                    child: Text(
                      "Images Sent by You",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Medium",
                          color: Color(0xff464646)),
                    ),
                  ),
                  Container(
                    width: 334,
                    height: 90,
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.objReportsDetailResponse.data
                          .bookingDetails.media.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            viewUploadedPicDialog(
                                context,
                                provider.objReportsDetailResponse.data
                                    .bookingDetails.media);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 31, bottom: 10, top: 10),
                            height: 64.81,
                            width: 68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                provider.objReportsDetailResponse.data
                                    .bookingDetails.media[index].fileName
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21, right: 21),
                    height: 1,
                    color: Color(0xffDDDDF7),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 31, top: 13, bottom: 20),
                    child: Text(
                      "Client rating & feedback",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SemiBold",
                          color: Color(0xff001F3F)),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider
                            .objReportsDetailResponse.data.rateWashlists.length,
                        itemBuilder: (BuildContext context, int index) {
                          var ratewashListItem = provider
                              .objReportsDetailResponse.data.rateWashlists;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 31, bottom: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Medium",
                                            color: Color(0xff464646)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    RatingBar.builder(
                                      initialRating: ratewashListItem[index]
                                          .rating!
                                          .toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemSize: 15,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Color(0xffFFBC00),
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 31, top: 10, bottom: 20),
                                child: Text(
                                  "Improvement Scope",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Medium",
                                      color: Color(0xff464646)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 31, bottom: 20),
                                child: Text(
                                  "${ratewashListItem[index].feedback}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Medium",
                                      color: Color(0xff464646)),
                                ),
                              ),
                              Container(
                                height: 70,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: ratewashListItem[index]
                                        .washDocuments!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        height: 64.81,
                                        width: 68,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ClipRRect(
                                          child: Image.network(
                                            "${ratewashListItem[index].washDocuments![index].images}",
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              Navigator.pushReplacementNamed(
                                                  context, '/reports');
                                              return Container();
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              )),
        //  bottomNavigationBar: bottomBar(context, provider),
      );
    });
  }

  void viewUploadedPicDialog(
      BuildContext context, List<BookingDetailsMedia> media) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here
            child: Container(
              height: 500,
              width: 374,
              child: Column(
                children: [
                  Container(
                    height: 312,
                    // height: 500,
                    width: 374,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: media.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 336,
                            width: 271.56,
                            margin: EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                "${media[index].fileName}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: 131,
                  //     child: Container(
                  //       height: 48,
                  //       width: 49,
                  //       child: IconButton(
                  //           onPressed: () {},
                  //           icon: SvgPicture.asset(
                  //             "assets/images/arrow-left-solid.svg",
                  //             color: Colors.white,
                  //             height: 28,
                  //             width: 29,
                  //           )),
                  //     )),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48,
                      width: 49,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset(
                        "assets/images/Close.svg",
                        height: 35,
                        width: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
