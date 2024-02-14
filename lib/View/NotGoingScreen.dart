import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'Profile/Profile.dart';

class NotGoingScreen extends StatefulWidget {
  String? id;
  String? brandImage;
  String? brandName;
  String? registrationName;
  String? modelName;
  String? vehicleName;
  String? address;
  String? name;

  NotGoingScreen({
    required this.id,
    required this.brandImage,
    required this.brandName,
    required this.registrationName,
    required this.modelName,
    required this.vehicleName,
    required this.address,
    required this.name,
  });

  NotGoingScreenState createState() => NotGoingScreenState();
}

class NotGoingScreenState extends State<NotGoingScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getDashboardApi(context);
      provider.getReasonApi(context);

      provider.notGoingMessageController.clear();
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
              automaticallyImplyLeading: false,
              elevation: 4,
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              centerTitle: false,
              title: const Text(
                "Not Going",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SemiBold", color: Colors.white),
              ),
              actions: [
                // Container(
                //   height: 15,
                //   width: 28,
                //   child: Image.asset(
                //     "assets/images/toggle.png",
                //     color: Color(0xff00FF00),
                //   ),
                // ),
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
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.only(right: 20, top: 10, left: 20),
                    child: Container(
                      // height: 150,
                      // width: 374,
                      constraints: BoxConstraints(
                          maxHeight: double.infinity, maxWidth: 374),

                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     offset: Offset(0, 0.5),
                        //     blurRadius: 0.0,
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(6),
                        color: ColorTheme.themeWhiteColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 48,
                            width: 64,
                            margin:
                                EdgeInsets.only(left: 10, bottom: 11, top: 13),
                            child: Image.network(widget.brandImage.toString()),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(
                                    left: 31, top: 13, bottom: 10),
                                child: Text(
                                  widget.name.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "SemiBold",
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(left: 31, bottom: 10),
                                child: Text(
                                  "${widget.brandName} ${widget.modelName}",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Medium"),
                                ),
                              ),
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(left: 31),
                                child: Text(
                                  "${widget.registrationName} | ${widget.vehicleName}",
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "Medium"),
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
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: double.infinity,
                                        maxWidth: 200),
                                    child: Text(
                                      "${widget.address}",
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
                    ),
                  ),
                  Container(
                    // height: 19,
                    margin: EdgeInsets.only(left: 21, bottom: 10, top: 30),
                    child: Text(
                      "Reason for not going",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: double.infinity, maxWidth: 374),
                    // width: 374,
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff707070), width: 1)),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                        key: formKey,
                        child: DropdownButtonFormField<String>(
                          isDense: true,
                          padding: EdgeInsets.only(left: 10),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Select Reason",
                            hintStyle: TextStyle(
                                fontFamily: "Medium",
                                fontSize: 15,
                                color: Color(0xff555555)),
                            enabledBorder: InputBorder.none,
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select some reason';
                            } else {
                              return null;
                            }
                          },
                          //  items: [],
                          items: provider.reasonItemlist.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff555555)),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              provider.dropdownvalue = value!;
                            });
                          },
                          value: provider.dropdownvalue,
                        )),
                  ),
                  Container(
                    height: 19,
                    margin: EdgeInsets.only(left: 21, bottom: 10, top: 30),
                    child: Text(
                      "Message",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: double.infinity, maxWidth: 374),
                    width: 374,
                    margin: EdgeInsets.only(left: 21, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff707070), width: 1),
                        color: Color(0xffFFFFFF)),
                    child: TextFormField(
                      controller: provider.notGoingMessageController,
                      keyboardType: TextInputType.multiline,
                      minLines: 10,
                      maxLines: 20,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Type your message",
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: "Medium",
                              color: Color(0xff555555))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 15, top: 17),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.themeGreenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize: Size(374, 56),
                      ),
                      onPressed: () {
                        if (provider.dropdownvalue!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please select a reason.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (provider
                            .notGoingMessageController.text.isEmpty) {
                        } else {
                          provider.getStatusApi(
                              widget.id.toString(),
                              "Not Going",
                              provider.dropdownvalue.toString(),
                              provider.notGoingMessageController.text,
                              context);
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: ColorTheme.themeBlackColor,
                            fontSize: 18,
                            fontFamily: "SemiBold"),
                      ),
                    ),
                  ),
                ],
              )),
        // bottomNavigationBar: bottomBar(context, provider),
      );
    });
  }
}
