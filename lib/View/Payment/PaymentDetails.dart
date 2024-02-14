import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Payment/GrossEarning.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Widgets/bottom_bar.dart';

class PaymentDetails extends StatefulWidget {
  String id;
  PaymentDetailsState createState() => PaymentDetailsState();
  PaymentDetails({required this.id});
}

class PaymentDetailsState extends State<PaymentDetails> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getPaymentDetailsApi(widget.id, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);

    // String paymentDate = provider
    //     .objPaymentDetailsResponse.data.transcation.paymentDate
    //     .toString();
    //
    // DateTime parsePaymentDate = DateTime.parse(paymentDate);
    // String formattedPaymentDate =
    //     DateFormat('dd/MM/yyyy').format(parsePaymentDate);
    //
    // print("paymentDate:$formattedPaymentDate");

    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: 166,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff0072C6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        //Navigator.pop(context);
                                        Navigator.of(context).push(
                                            PageRouteBuilder(
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 400),
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    GrossEarningScreen(),
                                                transitionsBuilder:
                                                    (BuildContext context,
                                                        Animation<double>
                                                            animation,
                                                        Animation<double>
                                                            secondaryAnimation,
                                                        Widget child) {
                                                  return new SlideTransition(
                                                    position: new Tween<Offset>(
                                                      //Left to right
                                                      begin: const Offset(
                                                          -1.0, 0.0),
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
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        "Payment Details",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "SemiBold",
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -120,
                          right: 20,
                          left: 20,
                          child: Card(
                            child: Container(
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff0000001A),
                                      offset: const Offset(0.0, 1.0),
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                              padding:
                                  EdgeInsets.only(left: 22, top: 15, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      provider
                                                      .objPaymentDetailsResponse
                                                      .data
                                                      .transcation
                                                      .userVehicle!
                                                      .registrationNo ==
                                                  null ||
                                              provider
                                                      .objPaymentDetailsResponse
                                                      .data
                                                      .transcation
                                                      .userVehicle!
                                                      .registrationNo ==
                                                  ""
                                          ? Text(
                                              "Vehicle No: ",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "SemiBold",
                                                  color: Color(0xff0072C6)),
                                            )
                                          : Text(
                                              "Vehicle No: ${provider.objPaymentDetailsResponse.data.transcation.userVehicle!.registrationNo}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "SemiBold",
                                                  color: Color(0xff0072C6)),
                                            ),
                                      Spacer(),
                                      provider
                                                      .objPaymentDetailsResponse
                                                      .data
                                                      .transcation
                                                      .userVehicle!
                                                      .brand!
                                                      .image ==
                                                  null ||
                                              provider
                                                      .objPaymentDetailsResponse
                                                      .data
                                                      .transcation
                                                      .userVehicle!
                                                      .brand!
                                                      .image ==
                                                  ""
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
                                              margin:
                                                  EdgeInsets.only(right: 11),
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
                                              margin:
                                                  EdgeInsets.only(right: 11),
                                              child: Image.network(provider
                                                  .objPaymentDetailsResponse
                                                  .data
                                                  .transcation
                                                  .userVehicle!
                                                  .brand!
                                                  .image
                                                  .toString()),
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    color: Color(0xffE4E4E4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Status:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium",
                                              color: Color(0xff0072C6)),
                                        ),
                                        Spacer(),
                                        provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .paymentStatus ==
                                                    null ||
                                                provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .paymentStatus ==
                                                    ""
                                            ? Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Color(0xff43AD25)),
                                              )
                                            : Text(
                                                "${provider.objPaymentDetailsResponse.data.transcation.paymentStatus}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Color(0xff43AD25)),
                                              )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Date:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium",
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .paymentDate ==
                                                    null ||
                                                provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .paymentDate ==
                                                    ""
                                            ? Text(
                                                "-",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              )
                                            : Text(
                                                //formattedPaymentDate,
                                                provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .paymentDate
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Amount:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium",
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        provider.objPaymentDetailsResponse.data
                                                        .transcation.amount ==
                                                    null ||
                                                provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .amount ==
                                                    ""
                                            ? Text(
                                                "₹-",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              )
                                            : Text(
                                                "₹${provider.objPaymentDetailsResponse.data.transcation.amount}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Owner Name:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Medium",
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        provider.objPaymentDetailsResponse.data
                                                        .transcation.user!.name ==
                                                    null ||
                                                provider
                                                        .objPaymentDetailsResponse
                                                        .data
                                                        .transcation
                                                        .user!
                                                        .name ==
                                                    ""
                                            ? Text(
                                                "-",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              )
                                            : Text(
                                                "${provider.objPaymentDetailsResponse.data.transcation.user!.name}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SemiBold",
                                                    color: Colors.black),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 150),
                    provider.objPaymentDetailsResponse.data.transcation.userAddress.type == null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.type ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.flatHouseNo ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.flatHouseNo ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.areaSector ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.areaSector ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.nearby ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.nearby ==
                                ""
                        ? Container(
                            margin: EdgeInsets.only(left: 21),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 14,
                                  color: Color(0xff007BFF)),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(left: 21),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 14,
                                  color: Color(0xff007BFF)),
                            ),
                          ),
                    provider.objPaymentDetailsResponse.data.transcation.userAddress.type == null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.type ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.flatHouseNo ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.flatHouseNo ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.areaSector ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.areaSector ==
                                "" ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.nearby ==
                                null ||
                            provider.objPaymentDetailsResponse.data.transcation
                                    .userAddress.nearby ==
                                ""
                        ? Container()
                        : Container(
                            constraints:
                                BoxConstraints(maxHeight: double.infinity),
                            width: 374,
                            margin:
                                EdgeInsets.only(right: 20, top: 10, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF6F6FE),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 9, top: 15),
                                  height: 20,
                                  width: 17.06,
                                  child: SvgPicture.asset(
                                    "assets/images/map-marker.svg",
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .type ==
                                                null ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .type ==
                                                ""
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                top: 15, left: 8),
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "SemiBold",
                                                  color: Color(0xff1A1A1A)),
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(
                                                top: 15, left: 8),
                                            child: Text(
                                              provider
                                                  .objPaymentDetailsResponse
                                                  .data
                                                  .transcation
                                                  .userAddress
                                                  .type
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: "SemiBold",
                                                  color: Color(0xff1A1A1A)),
                                            ),
                                          ),
                                    provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .flatHouseNo ==
                                                null ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .flatHouseNo ==
                                                "" ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .areaSector ==
                                                null ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .areaSector ==
                                                "" ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .nearby ==
                                                null ||
                                            provider
                                                    .objPaymentDetailsResponse
                                                    .data
                                                    .transcation
                                                    .userAddress
                                                    .nearby ==
                                                ""
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 8),
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "Medium",
                                                  color: Color(0xff464646)),
                                            ),
                                          )
                                        : Container(
                                            constraints: BoxConstraints(
                                              maxHeight: double.infinity,
                                              maxWidth: 270,
                                            ),
                                            margin: EdgeInsets.only(
                                                top: 5, left: 8, bottom: 10),
                                            child: Text(
                                              "${provider.objPaymentDetailsResponse.data.transcation.userAddress.flatHouseNo},\n${provider.objPaymentDetailsResponse.data.transcation.userAddress.areaSector}, ${provider.objPaymentDetailsResponse.data.transcation.userAddress.nearby}",
                                              softWrap: true,
                                              maxLines: 10,
                                              style: TextStyle(
                                                  fontSize: 11.5,
                                                  fontFamily: "Medium",
                                                  color: Color(0xff464646)),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 25, left: 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'For any queries regarding payment. Please contact admin by ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Regular",
                                    color: Color(0xff444444))),
                            TextSpan(
                                text: 'click here.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Regular",
                                    color: Color(0xff0072C6))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
        // bottomNavigationBar: bottomBar(context, provider),
      );
    });
  }
}
