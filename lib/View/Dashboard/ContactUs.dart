import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../AppBottomNav.dart';
import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../Profile/Profile.dart';

class ContactUs extends StatefulWidget {
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getProfileViewApi(context);
      provider.getListNotificationApi("unread", context);
      // provider.setEnableButton();
      provider.helpNameController.text =
          provider.objProfileViewResponse.data!.name == null ||
                  provider.objProfileViewResponse.data!.name == ""
              ? ""
              : provider.objProfileViewResponse.data!.name.toString();
      provider.helpPhoneNumberController.text =
          provider.objProfileViewResponse.data!.mobile == null ||
                  provider.objProfileViewResponse.data!.mobile == 0
              ? ""
              : Environment.loginMobileNumber;
      provider.helpEmailAddressController.text =
          provider.objProfileViewResponse.data!.email == null ||
                  provider.objProfileViewResponse.data!.email == ""
              ? ""
              : provider.objProfileViewResponse.data!.email.toString();
      provider.helpMessageController.clear();

      // provider.getProfileViewApi(context);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<bool> willPopCallback() async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Dashboard(),
    //   ),
    // );
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => AppBottomNav(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              //Left to right
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,

              //Right to left
              // begin:
              // const Offset(1.0, 0.0),
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
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: willPopCallback,
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
                  "Help",
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
                  provider.objProfileViewResponse.data?.profileImageUrl == "" ||
                          provider.objProfileViewResponse.data
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
                              //Navigator.of(context).pushNamed('/profile');
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
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
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: _makingPhoneCall,
                      child: Container(
                        height: 100,
                        width: 373,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff0000001A),
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            //BoxShadow
                          ],
                        ),
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 25,
                                          top: 15,
                                        ),
                                        child: Text(
                                          "Toll Free",
                                          style: TextStyle(
                                              fontFamily: "Medium",
                                              fontSize: 15,
                                              color: Color(0xff444444)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 25, top: 9, bottom: 16),
                                        child: Text(
                                          "+91 1800 102 3500",
                                          style: TextStyle(
                                              fontFamily: "SemiBold",
                                              fontSize: 20,
                                              color: Color(0xff0072C6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15,
                                        top: 25,
                                        bottom: 24,
                                        right: 23),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/phone-calling.svg",
                                          height: 34,
                                          width: 34,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Medium"),
                                ),
                              ),
                              TextFormField(
                                controller: provider.helpNameController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.length < 2) {
                                    return 'Name is not long enough';
                                  }
                                },
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: ColorTheme.themeGreenColor,
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                    hintText: "Enter Your Name",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Medium",
                                        color: ColorTheme.themeGrayColor)),
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Medium"),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Phone No.",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Medium"),
                                ),
                              ),
                              TextFormField(
                                controller: provider.helpPhoneNumberController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter a Phone Number";
                                  } else if (!RegExp(
                                          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                      .hasMatch(value)) {
                                    return "Please Enter a Valid Phone Number";
                                  }
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: ColorTheme.themeGreenColor,
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                    hintText: "Enter Phone Number",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Medium",
                                        color: ColorTheme.themeGrayColor)),
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Medium"),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Email Address",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Medium"),
                                ),
                              ),
                              TextFormField(
                                controller: provider.helpEmailAddressController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9@a-zA-Z.]")),
                                ],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateEmail,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: ColorTheme.themeGreenColor,
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff707070), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                    hintText: "Enter Email Address",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Medium",
                                        color: ColorTheme.themeGrayColor)),
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Medium"),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(
                                  //left: 21,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Query",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Medium",
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 374, maxHeight: double.infinity),

                                //  margin: EdgeInsets.only(left: 21, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Color(0xff707070), width: 1),
                                    color: Color(0xffFFFFFF)),
                                child: TextFormField(
                                  controller: provider.helpMessageController,
                                  keyboardType: TextInputType.multiline,
                                  minLines: 5,
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
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15, top: 17),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.helpUpdateClicked
                                  ? ColorTheme.themeGreenColor
                                  : ColorTheme.themeDarkGrayColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              minimumSize: Size(374, 56),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Navigator.of(context).pushNamed('/addVehicle');
                                {
                                  if (provider
                                      .helpNameController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter your name!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else if (provider.helpEmailAddressController
                                      .text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter email address!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else if (provider
                                      .helpPhoneNumberController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter phone number!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else if (provider
                                      .helpMessageController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please write your query!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    // provider.getProfileUpdateApi(
                                    //     provider.profileNameController.text,
                                    //     provider.profileEmailAddressController.text,
                                    //     provider.profilePhoneNumberController.text,
                                    //     provider.profileAddressController.text,
                                    //
                                    //     context);
                                    // provider.setHelpDisableButton();
                                    provider.getHelpApi(
                                        provider.helpNameController.text,
                                        provider
                                            .helpEmailAddressController.text,
                                        provider.helpPhoneNumberController.text,
                                        provider.helpMessageController.text,
                                        context);

                                    //
                                  }
                                }
                              }
                            },
                            // : null,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  color: ColorTheme.themeBlackColor,
                                  fontSize: 16,
                                  fontFamily: "SemiBold"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          //  bottomNavigationBar: bottomBar(context, provider),
        ),
      );
    });
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:+91 1800 102 3500");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
