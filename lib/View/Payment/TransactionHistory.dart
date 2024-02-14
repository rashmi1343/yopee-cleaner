import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/AppBottomNav.dart';
import 'package:yopee_cleaner/Utility/Environment.dart';
import 'package:yopee_cleaner/View/Payment/Earning.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../Dashboard/Home.dart';
import 'GrossEarning.dart';

class TransactionHistoryScreen extends StatefulWidget {
  String selectedmonth;

  TransactionHistoryScreen({required this.selectedmonth});
  TransactionHistoryScreenState createState() =>
      TransactionHistoryScreenState();
}

class TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      // provider.getDashboardApi(context);
      provider.getEarningsApi(widget.selectedmonth, context);
    });
  }

  bool _customTileExpanded = false;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return RefreshIndicator(
        onRefresh: () {
          return provider.getEarningsApi(widget.selectedmonth, context);
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
                leading: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     '/home', (Route<dynamic> route) => false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EarningScreen()));
                  },
                ),
                centerTitle: false,
                title: const Text(
                  "Transaction History",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SemiBold",
                      color: Colors.white),
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
                      Row(
                        children: [
                          Container(
                            height: 19,
                            margin:
                                EdgeInsets.only(left: 21, top: 13, bottom: 10),
                            child: Text(
                              "${widget.selectedmonth}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Medium",
                                  color: Color(0xff2C2C2C)),
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
                              itemCount: provider.objEarningsResponse.data!
                                      .transcations!.length ??
                                  0,
                              itemBuilder: (context, index) {
                                var myTransactionListItem = provider
                                    .objEarningsResponse.data!.transcations;

                                return Container(
                                  // height: 100,
                                  width: 374,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF6F6FE),
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 20, top: 10, left: 20),
                                  child: ExpansionTile(
                                    leading: Container(
                                      height: 48,
                                      width: 64,
                                      // padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Color(0xffCCCCCC))),
                                      // margin: EdgeInsets.only(
                                      //     left: 10, bottom: 11, top: 23),
                                      child: Image.network(
                                        myTransactionListItem[index]
                                            .userVehicle
                                            .brand!
                                            .image
                                            .toString(),
                                      ),
                                    ),
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 19,
                                          child: Text(
                                            "${myTransactionListItem![index].userVehicle!.brand!.name} ${myTransactionListItem![index].userVehicle!.model!.name}",
                                            style: TextStyle(
                                                fontSize: 11.5,
                                                fontFamily: "SemiBold",
                                                color: Colors.black),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(
                                            '₹${myTransactionListItem![index].amount.toString()}',
                                            style: TextStyle(
                                                fontSize: 10.5,
                                                fontFamily: "Medium",
                                                color: Color(0xff0072C6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Container(
                                      height: 19,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "${myTransactionListItem![index].userVehicle!.registrationNo} | ${myTransactionListItem![index].userVehicle!.vehicle!.name}",
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            fontFamily: "Medium"),
                                      ),
                                    ),
                                    trailing: Icon(
                                      _customTileExpanded
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                    ),
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 19,
                                                margin: EdgeInsets.only(
                                                  left: 11,
                                                  top: 13,
                                                ),
                                                child: Text(
                                                  "Owners'Name:",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Container(
                                                height: 19,
                                                margin: EdgeInsets.only(
                                                  left: 11,
                                                  top: 13,
                                                ),
                                                child: Text(
                                                  "${myTransactionListItem[index].user!.name}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Medium",
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            children: [
                                              Container(
                                                // height: 19,
                                                margin: EdgeInsets.only(
                                                  left: 11,
                                                ),
                                                child: Text(
                                                  "Address:",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SemiBold",
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              myTransactionListItem[index]
                                                              .userAddress!
                                                              .nearby ==
                                                          "" ||
                                                      myTransactionListItem[
                                                                  index]
                                                              .userAddress!
                                                              .nearby ==
                                                          null
                                                  ? Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: double
                                                                  .infinity,
                                                              maxWidth: 200),
                                                      child: Text(
                                                        "${myTransactionListItem[index].userAddress!.flatHouseNo}, ${myTransactionListItem[index].userAddress!.areaSector}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "Medium",
                                                            color: Color(
                                                                0xff464646)),
                                                      ),
                                                    )
                                                  : Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: double
                                                                  .infinity,
                                                              maxWidth: 200),
                                                      child: Text(
                                                        "${myTransactionListItem[index].userAddress!.flatHouseNo}, ${myTransactionListItem[index].userAddress!.areaSector}, ${myTransactionListItem[index].userAddress!.nearby}",
                                                        style: TextStyle(
                                                            fontSize: 12,
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
                                        ],
                                      ),
                                    ],
                                    onExpansionChanged: (bool expanded) {
                                      setState(
                                          () => _customTileExpanded = expanded);
                                    },
                                  ),
                                );
                              }),
                    ],
                  )),
        ),
      );
    });
  }
}
