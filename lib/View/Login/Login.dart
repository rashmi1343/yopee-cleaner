import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/View/Login/SignUp.dart';
import 'package:yopee_cleaner/View/TermsConditionScreen.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../PrivacyPolicy.dart';

class Login extends StatefulWidget {
  String mobile;
  LoginState createState() => LoginState();
  Login({required this.mobile});
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String _phone = "";

  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.loginPhoneNumberController.text = widget.mobile;
    });
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
                  height: 233,
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
                    "YOPEE",
                    style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 35,
                        color: ColorTheme.themeWhiteColor),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  // height: 43,
                  child: const Text(
                    "Start Your Day with a Clean Slate -\n Where Every Morning Begins with a Happy Car!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: "Medium",
                        fontSize: 16,
                        color: ColorTheme.themeWhiteColor),
                  ),
                ),
                SizedBox(
                  height: 47,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  height: 19,
                  child: RichText(
                    text: const TextSpan(
                      text: 'We',
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
                              color: ColorTheme.themeWhiteColor),
                        ),
                        TextSpan(
                          text: 'll send you a ',
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 16,
                              color: ColorTheme.themeWhiteColor),
                        ),
                        TextSpan(
                          text: '4 digit OTP',
                          style: TextStyle(
                              fontFamily: "SemiBold",
                              fontSize: 16,
                              color: ColorTheme.themeWhiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                          child: Row(
                            children: [
                              Container(
                                height: 19,
                                width: 30,
                                margin: const EdgeInsets.only(
                                    left: 19, top: 17, bottom: 17),
                                child: const Text(
                                  "+91",
                                  style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: 15,
                                      color: ColorTheme.themeDarkGrayColor),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 30,
                                color: ColorTheme.themeGrayColor,
                                width: 1,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 12, left: 2),
                                height: 30,
                                width: 200,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,

                                  keyboardType: TextInputType.phone,
                                  controller:
                                      provider.loginPhoneNumberController,

                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter a Phone Number";
                                  //   } else if (!RegExp(
                                  //           r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                  //       .hasMatch(value)) {
                                  //     return "Please Enter a Valid Phone Number";
                                  //   }
                                  // },
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  // Only numbers can be entered

                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter Phone Number",
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Medium",
                                          color: ColorTheme.themeGrayColor)),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 24,
                                width: 24,
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/login/phone-icon.png",
                                  height: 24,
                                  width: 24,
                                  color: Color(0xff003F69),
                                ),
                              )
                            ],
                          )),
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
                            backgroundColor: provider.loginClicked
                                ? ColorTheme.themeLightGrayColor
                                : ColorTheme.themeGreenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(374, 56),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (provider
                                  .loginPhoneNumberController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter phone number!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                if (!provider.loginClicked) {
                                  provider.loginClicked = true;
                                  provider.getLoginApi(
                                      provider.loginPhoneNumberController.text,
                                      context);
                                }
                              }
                            }
                          },
                          child: const Text(
                            'Login',
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
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SignUp(),
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
                              // begin: const Offset(
                              //     1.0, 0.0),
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
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text: 'Don\'t have an account?',
                          children: [
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                  color: Color(0xffEE7B23),
                                  fontFamily: "SemiBold",
                                  fontSize: 13),
                            ),
                          ],
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Regular",
                              fontSize: 12)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  height: 38,
                  width: 374,
                  child: RichText(
                    text: TextSpan(
                      text: '     By proceeding you agree to the\n',
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 13,
                          color: ColorTheme.themeWhiteColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms & Conditions ',
                            style: TextStyle(
                                fontFamily: "Regular",
                                fontSize: 13,
                                color: ColorTheme.themeWhiteColor,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy Policy"');
                                // provider.getAboutUsApi("about_us", context);
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        TermsConditionScreen(),
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
                              }),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 13,
                              color: ColorTheme.themeWhiteColor),
                        ),
                        TextSpan(
                            text: ' Privacy Policy',
                            style: TextStyle(
                                fontFamily: "Regular",
                                fontSize: 13,
                                color: ColorTheme.themeWhiteColor,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy Policy"');
                                // provider.getAboutUsApi("about_us", context);
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        PrivacyPolicy(),
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
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
