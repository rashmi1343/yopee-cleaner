import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../Login/Login.dart';

class OtpVerification extends StatefulWidget {
  OtpVerificationState createState() => OtpVerificationState();
}

class OtpVerificationState extends State<OtpVerification> {
  final _otpformKey = GlobalKey<FormState>();

  String? _otp;

  Color verifyBtnColor = ColorTheme.themeLightBlueColor;

  // void updateVerifyButton() {
  //   if (contrller1!.text.isNotEmpty &&
  //       contrller2!.text.isNotEmpty &&
  //       contrller3!.text.isNotEmpty &&
  //       contrller4!.text.isNotEmpty) {
  //     setState(() {
  //       verifyBtnColor = ColorTheme.themeGreenColor;
  //     });
  //   } else {
  //     setState(() {
  //       verifyBtnColor = ColorTheme.themeLightBlueColor;
  //     });
  //   }
  // }
  FocusNode myfocus = FocusNode();
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // Future.delayed(Duration(seconds: 0), () {
    //   myfocus.requestFocus(); //auto focus on second text field.
    // });

    Provider.of<YopeeProvider>(context, listen: false).otp1Controller.clear();
    Provider.of<YopeeProvider>(context, listen: false).otp2Controller.clear();
    Provider.of<YopeeProvider>(context, listen: false).otp3Controller.clear();
    Provider.of<YopeeProvider>(context, listen: false).otp4Controller.clear();
    startTimer();
    super.initState();
  }

  late Timer _timer;
  int _start = 30;
  bool isLoading = false;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<bool> willPopCallback() async {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => Login(
              mobile: '',
            ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              //Left to right
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,

              //Right to left
              // begin: const Offset(1.0, 0.0),
              // end: Offset.zero,

              //top to bottom
              // begin: const Offset(0.0, -1.0),
              // end: Offset.zero,

              //bottom to top
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
        //       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
            resizeToAvoidBottomInset: false,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
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
                                  begin: const Offset(-1.0, 0.0),
                                  end: Offset.zero,

                                  //Right to left
                                  // begin: const Offset(1.0, 0.0),
                                  // end: Offset.zero,

                                  //top to bottom
                                  // begin: const Offset(0.0, -1.0),
                                  // end: Offset.zero,

                                  //bottom to top
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
                            //       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            //   return ScaleTransition(
                            //     scale: animation.drive(tween),
                            //     child: page,
                            //   );
                            // },
                            ));
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        margin: EdgeInsets.only(
                          left: 18,
                          top: 33,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/arrow-left-solid.svg",
                          color: ColorTheme.themeWhiteColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 70),
                      child: const Text(
                        "OTP\nVerification",
                        style: TextStyle(
                            fontFamily: "Bold",
                            fontSize: 28,
                            color: ColorTheme.themeWhiteColor),
                      ),
                    ),
                    // provider.otpRequestAgain == true
                    //     ? Container(
                    //         alignment: Alignment.center,
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 50.0, vertical: 8),
                    //         child: Center(
                    //             child: Text.rich(TextSpan(
                    //                 text:
                    //                     "we,ve sent a 4 digit confirmation code to ",
                    //                 style: TextStyle(
                    //                     fontFamily: "Regular",
                    //                     fontSize: 16,
                    //                     color: ColorTheme.themeWhiteColor),
                    //                 children: <TextSpan>[
                    //               TextSpan(
                    //                   text: Environment.loginMobileNumber,
                    //                   style: TextStyle(
                    //                     fontFamily: 'SemiBold',
                    //
                    //                     fontSize: 16,
                    //                     color: Colors.white,
                    //                     // decoration: TextDecoration.underline,
                    //                   ),
                    //                   recognizer: TapGestureRecognizer()
                    //                     ..onTap = () {
                    //                       // code to open / launch terms of service link here
                    //                     }),
                    //               TextSpan(
                    //                   text: '.',
                    //                   style: TextStyle(
                    //                     fontFamily: 'SemiBold',
                    //                     fontSize: 16,
                    //                     color: Colors.white,
                    //                   ),
                    //                   children: <TextSpan>[
                    //                     TextSpan(
                    //                         text:
                    //                             'Make sure you enter correct code.',
                    //                         style: TextStyle(
                    //                           fontFamily: 'Regular',
                    //
                    //                           fontSize: 16,
                    //                           color: Colors.white,
                    //                           //decoration: TextDecoration.underline
                    //                         ),
                    //                         recognizer: TapGestureRecognizer()
                    //                           ..onTap = () {
                    //                             // code to open / launch privacy policy link here
                    //                           })
                    //                   ])
                    //             ]))),
                    //       )
                    //     :
                    Container(
                      margin: const EdgeInsets.only(left: 21, top: 21),
                      width: 328,
                      child: const Text(
                        "Please enter the 4-digit code below",
                        style: TextStyle(
                            fontFamily: "Regular",
                            fontSize: 16,
                            color: ColorTheme.themeWhiteColor),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Form(
                      key: _otpformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 68,
                                width: 68,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  right: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: provider.otpClicked
                                          ? ColorTheme.themeGreenColor
                                          : ColorTheme.themeBlackColor,
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0) //
                                      ),
                                ),
                                child: _textFieldOTP(
                                    first: true,
                                    last: false,
                                    controller: provider.otp1Controller),
                              ),
                              Container(
                                height: 68,
                                width: 68,
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: provider.otpClicked
                                          ? ColorTheme.themeGreenColor
                                          : ColorTheme.themeBlackColor,
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0) //
                                      ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _textFieldOTP(
                                      first: false,
                                      last: false,
                                      controller: provider.otp2Controller),
                                ),
                              ),
                              Container(
                                height: 68,
                                width: 68,
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: provider.otpClicked
                                          ? ColorTheme.themeGreenColor
                                          : ColorTheme.themeBlackColor,
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0) //
                                      ),
                                ),
                                child: _textFieldOTP(
                                    first: false,
                                    last: false,
                                    controller: provider.otp3Controller),
                              ),
                              Container(
                                height: 68,
                                width: 68,
                                margin: const EdgeInsets.only(
                                  right: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: provider.otpClicked
                                          ? ColorTheme.themeGreenColor
                                          : ColorTheme.themeBlackColor,
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0) //
                                      ),
                                ),
                                child: _textFieldOTP(
                                    first: false,
                                    last: true,
                                    controller: provider.otp4Controller),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 19,
                            width: 374,
                            child: _start != 0
                                ? RichText(
                                    text: TextSpan(
                                      text: 'Resend Code in ',
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          fontSize: 16,
                                          color: ColorTheme.themeWhiteColor),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\: ',
                                          style: TextStyle(
                                              fontFamily: "Regular",
                                              fontSize: 16,
                                              color:
                                                  ColorTheme.themeWhiteColor),
                                        ),
                                        TextSpan(
                                            text: _start.toString(),
                                            style: TextStyle(
                                                fontFamily: "SemiBold",
                                                fontSize: 16,
                                                color:
                                                    ColorTheme.themeWhiteColor),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                setState(() {
                                                  _start = 30;
                                                  isLoading = true;
                                                  startTimer();
                                                  provider.otp1Controller
                                                      .clear();
                                                  provider.otp2Controller
                                                      .clear();
                                                  provider.otp3Controller
                                                      .clear();
                                                  provider.otp4Controller
                                                      .clear();
                                                  // provider.getLoginApi(
                                                  //     Environment
                                                  //         .loginMobileNumber,
                                                  //     context);
                                                });
                                              }),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: 'Didn',
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          fontSize: 16,
                                          color: ColorTheme.themeWhiteColor),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\'',
                                          style: TextStyle(
                                              fontFamily: "Regular",
                                              fontSize: 16,
                                              color:
                                                  ColorTheme.themeWhiteColor),
                                        ),
                                        TextSpan(
                                          text: 't recieve code? ',
                                          style: TextStyle(
                                              fontFamily: "Regular",
                                              fontSize: 16,
                                              color:
                                                  ColorTheme.themeWhiteColor),
                                        ),
                                        TextSpan(
                                            text: 'Request again',
                                            style: TextStyle(
                                                fontFamily: "SemiBold",
                                                fontSize: 16,
                                                color:
                                                    ColorTheme.themeWhiteColor),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                setState(() {
                                                  _start = 30;
                                                  isLoading = true;
                                                  startTimer();
                                                  provider.getResendOtpApi(
                                                      Environment
                                                          .loginMobileNumber,
                                                      context);
                                                });
                                              }),
                                      ],
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 21,
                              right: 20,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: provider.otpClicked
                                    ? ColorTheme.themeGreenColor
                                    : ColorTheme.themeLightGrayColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                minimumSize: Size(374, 56),
                              ),
                              onPressed: () async {
                                if (_otpformKey.currentState!.validate()) {
                                  if (provider.otp1Controller.text.isNotEmpty &&
                                      provider.otp2Controller.text.isNotEmpty &&
                                      provider.otp3Controller.text.isNotEmpty &&
                                      provider.otp4Controller.text.isNotEmpty) {
                                    // if (!provider.otpClicked) {
                                    // provider.disableOtpButton();

                                    String otpNumber =
                                        provider.otp1Controller.text +
                                            provider.otp2Controller.text +
                                            provider.otp3Controller.text +
                                            provider.otp4Controller.text;
                                    print(" otpNumber:$otpNumber");
                                    if (!provider.otpClicked) {
                                      provider.otpClicked = true;
                                      await provider.getOtpApi(
                                          provider.objLoginResponse
                                              .data[provider.index].id
                                              .toString(),
                                          otpNumber,
                                          context);
                                    }

                                    //   }
                                  } else if (provider
                                          .otp1Controller.text.isEmpty &&
                                      provider.otp2Controller.text.isEmpty &&
                                      provider.otp3Controller.text.isEmpty &&
                                      provider.otp4Controller.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "The otp number field is required.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                }
                              },
                              child: const Text(
                                'Verify Now',
                                style: TextStyle(
                                    color: ColorTheme.themeBlackColor,
                                    fontSize: 18,
                                    fontFamily: "SemiBold"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }

  Widget _textFieldOTP(
      {required bool first, required bool last, required controller}) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      // focusNode: myfocus,
      onChanged: (value) {
        if (value.length == 1 && last == false) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && first == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      showCursor: true,
      cursorHeight: 60,
      textInputAction: TextInputAction.next,
      readOnly: false,
      cursorColor: ColorTheme.themeDarkBlueColor,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 40,
          fontFamily: "SemiBold",
          color: ColorTheme.themeBlackColor),
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        fillColor: ColorTheme.themeWhiteColor,
        counter: Offstage(),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        // constraints: const BoxConstraints(
        //   maxHeight: 78,
        //   maxWidth: 78,
        // ),

        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(width: 2, color: ColorTheme.themeGreenColor),
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
    );
  }
}
