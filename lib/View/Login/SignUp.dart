import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../PrivacyPolicy.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String _phone = "";

  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    Provider.of<YopeeProvider>(context, listen: false).signupdocumentImage =
        null;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login/login_backgnd.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 413,
                  margin: const EdgeInsets.only(
                    top: 41,
                  ),
                  child: Image.asset(
                    "assets/images/login/car-washing.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 49,
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 20,
                        color: ColorTheme.themeWhiteColor),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 21, right: 20, bottom: 10),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value!.length < 2) {
                                return 'Name  is not long enough';
                              }
                            },
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(30),
                            ],
                            controller: provider.signupNameController,
                            keyboardType: TextInputType.name,
                            style:
                                TextStyle(fontSize: 15, fontFamily: "Medium"),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff13367A)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                hintText: "Enter Your Full Name",
                                errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Medium",
                                    color: Colors.deepOrange),
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: ColorTheme.themeGrayColor))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 21, right: 20, bottom: 10),
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            controller: provider.signupEmailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter an email address';
                              } else if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value)) {
                                return 'Please Enter a valid email address';
                              }
                              return null; // Return null if the input is valid
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9@a-zA-Z.]")),
                            ],
                            style:
                                TextStyle(fontSize: 15, fontFamily: "Medium"),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff13367A)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                hintText: "Enter email address",
                                errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Medium",
                                    color: Colors.deepOrange),
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: ColorTheme.themeGrayColor))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 21, right: 20, bottom: 10),
                        child: Text(
                          "Phone No.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            controller: provider.signupPhoneNumberController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter a Phone Number";
                              } else if (!RegExp(
                                      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                  .hasMatch(value)) {
                                return "Please Enter a Valid Phone Number";
                              }
                            },
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style:
                                TextStyle(fontSize: 15, fontFamily: "Medium"),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff13367A)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                hintText: "Enter phone number",
                                errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Medium",
                                    color: Colors.deepOrange),
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: ColorTheme.themeGrayColor))),
                      ),
                      // Container(
                      //     height: 54,
                      //     width: 373,
                      //     margin: const EdgeInsets.only(
                      //       left: 21,
                      //       right: 20,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: ColorTheme.themeWhiteColor,
                      //       border: Border.all(
                      //           color: ColorTheme.themeBlackColor, width: 1),
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(6.0) //
                      //               ),
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //           height: 19,
                      //           width: 30,
                      //           margin: const EdgeInsets.only(
                      //               left: 19, top: 17, bottom: 17),
                      //           child: const Text(
                      //             "+91",
                      //             style: TextStyle(
                      //                 fontFamily: "Medium",
                      //                 fontSize: 15,
                      //                 color: ColorTheme.themeDarkGrayColor),
                      //           ),
                      //         ),
                      //         Container(
                      //           margin: const EdgeInsets.all(10),
                      //           height: 30,
                      //           color: ColorTheme.themeGrayColor,
                      //           width: 1,
                      //         ),
                      //         Container(
                      //           margin: const EdgeInsets.only(top: 12, left: 2),
                      //           height: 30,
                      //           width: 200,
                      //           child: TextFormField(
                      //             autovalidateMode:
                      //                 AutovalidateMode.onUserInteraction,
                      //
                      //             keyboardType: TextInputType.phone,
                      //             controller:
                      //                 provider.signupPhoneNumberController,
                      //
                      //             validator: (value) {
                      //               if (value!.isEmpty) {
                      //                 return "Please Enter a Phone Number";
                      //               } else if (!RegExp(
                      //                       r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                      //                   .hasMatch(value)) {
                      //                 return "Please Enter a Valid Phone Number";
                      //               }
                      //             },
                      //             inputFormatters: <TextInputFormatter>[
                      //               LengthLimitingTextInputFormatter(10),
                      //             ],
                      //             // Only numbers can be entered
                      //
                      //             decoration: const InputDecoration(
                      //                 border: InputBorder.none,
                      //                 hintText: "Enter Phone Number",
                      //                 hintStyle: TextStyle(
                      //                     fontSize: 15,
                      //                     fontFamily: "Medium",
                      //                     color: ColorTheme.themeGrayColor)),
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         Container(
                      //           height: 24,
                      //           width: 24,
                      //           margin: EdgeInsets.all(10),
                      //           child: Image.asset(
                      //             "assets/images/login/phone-icon.png",
                      //             height: 24,
                      //             width: 24,
                      //             color: Color(0xff003F69),
                      //           ),
                      //         )
                      //       ],
                      //     )),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 21, right: 20, bottom: 10, top: 5),
                        child: Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            controller: provider.signupAddressController,
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            // inputFormatters: <TextInputFormatter>[
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[0-9@a-zA-Z.]")),
                            // ],
                            style:
                                TextStyle(fontSize: 15, fontFamily: "Medium"),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff13367A),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff13367A)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0) //
                                        )),
                                hintText: "Enter your full Address",
                                errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Medium",
                                    color: Colors.deepOrange),
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: ColorTheme.themeGrayColor))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 21, right: 20, bottom: 10),
                        child: Text(
                          "Upload Aadhar Card",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // imageDialog(provider, context);
                          //provider.pickFile(context);
                          provider.signuppickDocumentImage();
                        },
                        child: Container(
                          height: 54,
                          width: 373,
                          margin: const EdgeInsets.only(
                            left: 21,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: ColorTheme.themeWhiteColor,
                            border: Border.all(
                                color: ColorTheme.themeBlackColor, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0) //
                                    ),
                          ),
                          // margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              provider.signupdocumentImage != null
                                  ? Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 220, maxHeight: 30),
                                      // height: 30,
                                      // width: 150,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffFFF6F6),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Color(0xffE32222),
                                              width: 1)),
                                      child: Center(
                                        child: Text(
                                          " ${provider.uploadedsignupName}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: "Medium",
                                              color: Color(0xffE32222)),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 220, maxHeight: 30),
                                      child: TextFormField(
                                        readOnly: true,
                                        //  controller: provider.profileAddressController,
                                        //   keyboardType: TextInputType.text,
                                        //    inputFormatters: <TextInputFormatter>[
                                        //      LengthLimitingTextInputFormatter(10),
                                        //    ],
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                            hintText: "Choose File",
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Medium",
                                                color:
                                                    ColorTheme.themeGrayColor)),
                                        textInputAction: TextInputAction.done,
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: "Medium"),
                                      ),
                                    ),
                              Spacer(),
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: double.infinity,
                                    maxWidth: double.infinity),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xffDADADA),
                                ),
                                child: Center(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Medium",
                                        color: Color(0xff343434)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 21,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: provider.signupClicked
                                ? ColorTheme.themeLightGrayColor
                                : ColorTheme.themeGreenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(374, 56),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (provider.signupNameController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your name!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (provider
                                  .signupEmailAddressController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter email address!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (provider
                                  .signupPhoneNumberController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter phone number!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (provider.signupdocumentImage == null) {
                                Fluttertoast.showToast(
                                    msg: "Please upload your aadhar card",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                if (!provider.signupClicked) {
                                  provider.signupClicked = true;

                                  provider.signUpApi(
                                      provider.signupNameController.text,
                                      provider
                                          .signupEmailAddressController.text,
                                      provider.signupPhoneNumberController.text,
                                      provider.signupAddressController.text,
                                      context);

                                  provider.signupdocumentImage;

                                  // Navigator.of(context).push(PageRouteBuilder(
                                  //     transitionDuration:
                                  //         const Duration(milliseconds: 400),
                                  //     pageBuilder: (context, animation,
                                  //             secondaryAnimation) =>
                                  //         Login(),
                                  //     transitionsBuilder: (BuildContext context,
                                  //         Animation<double> animation,
                                  //         Animation<double> secondaryAnimation,
                                  //         Widget child) {
                                  //       return new SlideTransition(
                                  //         position: new Tween<Offset>(
                                  //           //Left to right
                                  //           begin: const Offset(-1.0, 0.0),
                                  //           end: Offset.zero,
                                  //
                                  //           //Right to left
                                  //           // begin: const Offset(1.0, 0.0),
                                  //           // end: Offset.zero,
                                  //
                                  //           //top to bottom
                                  //           // begin: const Offset(0.0, -1.0),
                                  //           // end: Offset.zero,
                                  //
                                  //           //   bottom to top
                                  //           // begin: Offset(0.0, 1.0),
                                  //           // end: Offset.zero,
                                  //         ).animate(animation),
                                  //         child: child,
                                  //       );
                                  //     }
                                  //     // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                                  //     //   var begin = 0.0;
                                  //     //   var end = 1.0;
                                  //     //   var curve = Curves.ease;
                                  //     //
                                  //     //   var tween =
                                  //     //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  //     //   return ScaleTransition(
                                  //     //     scale: animation.drive(tween),
                                  //     //     child: page,
                                  //     //   );
                                  //     // },
                                  //     ));

                                  // provider.getLoginApi(
                                  //     provider.loginPhoneNumberController.text,
                                  //     context);
                                }
                              }
                            }
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                                color: ColorTheme.themeBlackColor,
                                fontSize: 18,
                                fontFamily: "SemiBold"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Login(
                              mobile: '',
                            ),
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
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account?',
                        children: [
                          TextSpan(
                            text: ' Signin',
                            style: TextStyle(
                                color: Color(0xffEE7B23),
                                fontFamily: "SemiBold",
                                fontSize: 13),
                          ),
                        ],
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Regular",
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ));
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

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}
