import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'Login/Login.dart';

class TermsConditionScreen extends StatefulWidget {
  TermsConditionScreenState createState() => TermsConditionScreenState();
}

class TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getAboutUsApi("term_conditions", context);
    });
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
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0xff00000029),
                  offset: Offset(0, 0.0),
                  blurRadius: 6.0,
                )
              ]),
              child: AppBar(
                elevation: 4,
                shadowColor: Color(0xff00000029),
                toolbarHeight: 53,
                leading: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
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
                centerTitle: true,
                title: Text(
                  "Terms and Conditions",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SemiBold",
                      color: Color(0xff313131)),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 137,
                      height: 140,
                      margin: EdgeInsets.only(top: 31),
                      child: Image.asset("assets/images/splash/yopee_logo.png"),
                    ),
                    Container(
                      // margin: EdgeInsets.only(
                      //   left: 169,
                      // ),
                      child: Text(
                        "YOPEE",
                        style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 21,
                            color: Color(0xff2B2B2B)),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.only(left: 20, top: 15, bottom: 21, right: 20),
                    //   child: RichText(
                    //     text: const TextSpan(
                    //       text: '\"',
                    //       style: TextStyle(
                    //           fontFamily: "Bold",
                    //           fontSize: 24,
                    //           color: Color(0xff3B3B3B)),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: "Start Your Day with a Clean Slate-",
                    //           style: TextStyle(
                    //             fontFamily: "Bold",
                    //             fontSize: 24,
                    //             color: Color(0xff0072C6),
                    //           ),
                    //         ),
                    //         TextSpan(
                    //           text: 'Where Every Morning\nBegins with a Happy Car!',
                    //           style: TextStyle(
                    //               fontFamily: "Bold",
                    //               fontSize: 24,
                    //               color: Color(0xff00FF00)),
                    //         ),
                    //         TextSpan(
                    //           text: '\"',
                    //           style: TextStyle(
                    //             fontFamily: "Bold",
                    //             fontSize: 24,
                    //             color: Color(0xff3B3B3B),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 20, right: 20),
                    //   child: Html(data: parsedString, style: {
                    //     "p": Style(
                    //         fontFamily: "Regular",
                    //         fontSize: FontSize(14),
                    //         color: Color(0xff555555))
                    //   }),
                    // ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: Text(
                          provider.aboutUsDesc.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 14,
                              color: Color(0xff555555)),
                        )),
                  ],
                )),
        ),
      );
    });
  }
}
