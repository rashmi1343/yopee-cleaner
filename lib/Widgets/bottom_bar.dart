import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Presenter/YopeeProvider.dart';
import '../Utility/ColorTheme.dart';
import '../View/Dashboard/ContactUs.dart';
import '../View/Dashboard/Notification.dart';
import '../View/Dashboard/custom_animated_bottom_bar.dart';
import '../View/Dashboard/dashboard.dart';
import '../View/Payment/PaymentDetails.dart';
import '../View/Reports/ReportScreen.dart';

final _inactiveColor = Colors.black;
final _activeColor = Color(0xff007BFF);

int _selectedIndex = 0;

List<BottomNavigationBarItem> buildBottomNavBarItems(YopeeProvider provider) {
  return [
    BottomNavigationBarItem(
      icon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffF5F5F5)),
        child: Container(
          height: 17,
          width: 16,
          margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
          child: SvgPicture.asset("assets/images/dashboard/home.svg",
              color: ColorTheme.themeDarkGrayColor),
        ),
      ),
      label: 'Home',
      activeIcon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff007BFF)),
        child: Container(
          height: 17,
          width: 16,
          margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
          child: SvgPicture.asset("assets/images/dashboard/home.svg",
              color: ColorTheme.themeWhiteColor),
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffF5F5F5)),
        child: Container(
          height: 17,
          width: 16,
          margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
          child: SvgPicture.asset("assets/images/dashboard/history.svg",
              color: ColorTheme.themeDarkGrayColor),
        ),
      ),
      activeIcon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff007BFF)),
        child: Container(
          height: 17,
          width: 16,
          margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
          child: SvgPicture.asset("assets/images/dashboard/history.svg",
              color: ColorTheme.themeWhiteColor),
        ),
      ),
      label: 'Report',
    ),
    BottomNavigationBarItem(
      icon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffF5F5F5)),
        child: provider.objListNotificationResponse.data.isEmpty
            ? Container(
                height: 17,
                width: 16,
                margin:
                    EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),

                // margin: EdgeInsets.only(
                //     left: 36.97,
                //     top: 20,
                //     bottom: 10.26,
                //     right: 114.97),
                child: SvgPicture.asset("assets/images/menu/bell.svg"),
              )
            : Stack(
                children: [
                  GestureDetector(
                    // onTap: () {
                    //   Environment.notificationStatus ==
                    //           "1"
                    //       ? Navigator.of(context)
                    //           .pushNamed(
                    //               '/notification')
                    //       : showAlertDialog(
                    //           provider,
                    //           context,
                    //           false);
                    // },
                    child: Container(
                      height: 17,
                      width: 16,
                      margin: EdgeInsets.only(
                          left: 1, top: 9, bottom: 8, right: 7.5),
                      child: SvgPicture.asset("assets/images/menu/bell.svg"),
                    ),
                  ),
                  Container(
                    height: 17,
                    width: 16,
                    margin: EdgeInsets.only(
                        left: 9.5, right: 8.5, top: 8, bottom: 9),

                    // alignment: Alignment.topRight,
                    //margin: EdgeInsets.only(top: 5),
                    child: Container(
                      height: 17,
                      width: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(
                        child: Text(
                          provider.objListNotificationResponse.data.length
                              .toString(),
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Medium",
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

        // Container(
        //   height: 17,
        //   width: 16,
        //   margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
        //   child: SvgPicture.asset("assets/images/bell.svg",
        //       color: ColorTheme.themeDarkGrayColor),
        // ),
      ),
      activeIcon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff007BFF)),
        child: Container(
          height: 17,
          width: 16,
          margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
          child: SvgPicture.asset("assets/images/bell.svg",
              color: ColorTheme.themeWhiteColor),
        ),
      ),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
        icon: Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF5F5F5)),
          child: Container(
            height: 17,
            width: 16,
            margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
            child: SvgPicture.asset("assets/images/indian-rupee.svg",
                color: ColorTheme.themeDarkGrayColor),
          ),
        ),
        activeIcon: Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff007BFF)),
          child: Container(
            height: 17,
            width: 16,
            margin: EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
            child: SvgPicture.asset("assets/images/indian-rupee.svg",
                color: ColorTheme.themeWhiteColor),
          ),
        ),
        label: 'Payment'),
    BottomNavigationBarItem(
      icon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffF5F5F5)),
        child: Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(left: 5.5, right: 5.5, top: 5, bottom: 5),
          child: Image.asset("assets/images/login/phone-icon.png",
              color: ColorTheme.themeDarkGrayColor),
        ),
      ),
      activeIcon: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff007BFF)),
        child: Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(left: 5.5, right: 5.5, top: 5, bottom: 5),
          child: Image.asset("assets/images/login/phone-icon.png",
              color: ColorTheme.themeWhiteColor),
        ),
      ),
      label: 'Contact',
    )
  ];
}

Widget commonbottomBar(BuildContext context, YopeeProvider provider) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
    height: 76,
    child: Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Medium"),
          selectedLabelStyle: const TextStyle(
              color: Color(0xff007BFF), fontSize: 14, fontFamily: "Medium"),
          iconSize: 16,
          selectedItemColor: Color(0xff007BFF),
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: provider.currentBottomBarIndex,
          onTap: (index) {
            provider.isBottomNavViaHome = true;
            provider.currentBottomBarIndex = index;

            // if (index == 0) {
            //   Navigator.of(context).pushNamed('/dashboard');
            //   provider.setUpdatedValue(true);
            // } else if (index == 1) {
            //   Navigator.of(context).pushNamed('/reports');
            //   provider.setUpdatedValue(true);
            // } else if (index == 2) {
            //   Navigator.of(context).pushNamed('/notification');
            //   provider.setUpdatedValue(true);
            // } else if (index == 3) {
            //   //provider.reportNavFromMenu=true;
            //
            //   Navigator.of(context).pushNamed('/paymentDetails');
            //   provider.setUpdatedValue(true);
            // } else if (index == 4) {
            //   //provider.reportNavFromMenu=true;
            //
            //   Navigator.of(context).pushNamed('/contact');
            //   // provider.setUpdatedValue(true);
            // }
            provider.setUpdatedValue(true);
          },
          // onTap: (index) {
          //   provider.bottomTapped(index);
          // },
          // onTap: (index) {
          // if (index == 0) {
          //   Navigator.of(context).pushNamed('/dashboard');
          // } else if (index == 1) {
          //   Navigator.of(context).pushNamed('/reports');
          // } else if (index == 2) {
          //   Navigator.of(context).pushNamed('/notification');
          // } else if (index == 3) {
          //   //provider.reportNavFromMenu=true;
          //
          //   Navigator.of(context).pushNamed('/paymentDetails');
          // } else if (index == 4) {
          //   //provider.reportNavFromMenu=true;
          //
          //   Navigator.of(context).pushNamed('/contact');
          // }
          //  },
          //type: BottomNavigationBarType.fixed,
          items: buildBottomNavBarItems(provider),
        ),
      ),
    ),
  );
}

Widget bottomBar(BuildContext context, YopeeProvider provider) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
    height: 76,
    child: Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Medium"),
          selectedLabelStyle: const TextStyle(
              color: Color(0xff007BFF), fontSize: 14, fontFamily: "Medium"),
          iconSize: 16,
          selectedItemColor: Color(0xff007BFF),
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: provider.currentBottomBarIndex,
          onTap: (index) {
            // provider.currentBottomBarIndex = index;

            if (index == 0) {
              Navigator.of(context).pushNamed('/home');
              provider.setUpdatedValue(true);
            } else if (index == 1) {
              Navigator.of(context).pushNamed('/reports');
              provider.setUpdatedValue(true);
            } else if (index == 2) {
              Navigator.of(context).pushNamed('/notification');
              provider.setUpdatedValue(true);
            } else if (index == 3) {
              //provider.reportNavFromMenu=true;

              Navigator.of(context).pushNamed('/paymentDetails');
              provider.setUpdatedValue(true);
            } else if (index == 4) {
              //provider.reportNavFromMenu=true;

              Navigator.of(context).pushNamed('/contact');
              // provider.setUpdatedValue(true);
            }
            // provider.setUpdatedValue(true);
          },
          // onTap: (index) {
          //   provider.bottomTapped(index);
          // },
          // onTap: (index) {
          // if (index == 0) {
          //   Navigator.of(context).pushNamed('/dashboard');
          // } else if (index == 1) {
          //   Navigator.of(context).pushNamed('/reports');
          // } else if (index == 2) {
          //   Navigator.of(context).pushNamed('/notification');
          // } else if (index == 3) {
          //   //provider.reportNavFromMenu=true;
          //
          //   Navigator.of(context).pushNamed('/paymentDetails');
          // } else if (index == 4) {
          //   //provider.reportNavFromMenu=true;
          //
          //   Navigator.of(context).pushNamed('/contact');
          // }
          //  },
          //type: BottomNavigationBarType.fixed,
          items: buildBottomNavBarItems(provider),
        ),
      ),
    ),
  );
}

Widget buildBottomBar(BuildContext context, YopeeProvider provider) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
    height: 73,
    child: Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CustomAnimatedBottomBar(
          containerHeight: 73,
          backgroundColor: Colors.white,
          selectedIndex: provider.currentBottomBarIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            provider.currentBottomBarIndex = index;
            provider.setUpdatedValue(true);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF5F5F5)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/dashboard/home.svg",
                      color: ColorTheme.themeDarkGrayColor),
                ),
              ),
              activeIcon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff007BFF)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/dashboard/home.svg",
                      color: ColorTheme.themeWhiteColor),
                ),
              ),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
            ),
            BottomNavyBarItem(
              icon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF5F5F5)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/dashboard/history.svg",
                      color: ColorTheme.themeDarkGrayColor),
                ),
              ),
              activeIcon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff007BFF)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/dashboard/history.svg",
                      color: ColorTheme.themeWhiteColor),
                ),
              ),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
            ),
            BottomNavyBarItem(
              icon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF5F5F5)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/bell.svg",
                      color: ColorTheme.themeDarkGrayColor),
                ),
              ),
              activeIcon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff007BFF)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/bell.svg",
                      color: ColorTheme.themeWhiteColor),
                ),
              ),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
            ),
            BottomNavyBarItem(
              icon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF5F5F5)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/indian-rupee.svg",
                      color: ColorTheme.themeDarkGrayColor),
                ),
              ),
              activeIcon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff007BFF)),
                child: Container(
                  height: 17,
                  width: 16,
                  margin:
                      EdgeInsets.only(left: 9.5, right: 8.5, top: 8, bottom: 9),
                  child: SvgPicture.asset("assets/images/indian-rupee.svg",
                      color: ColorTheme.themeWhiteColor),
                ),
              ),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
            ),
            BottomNavyBarItem(
              icon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF5F5F5)),
                child: Container(
                  height: 20,
                  width: 20,
                  margin:
                      EdgeInsets.only(left: 5.5, right: 5.5, top: 5, bottom: 5),
                  child: Image.asset("assets/images/login/phone-icon.png",
                      color: ColorTheme.themeDarkGrayColor),
                ),
              ),
              activeIcon: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff007BFF)),
                child: Container(
                  height: 20,
                  width: 20,
                  margin:
                      EdgeInsets.only(left: 5.5, right: 5.5, top: 5, bottom: 5),
                  child: Image.asset("assets/images/login/phone-icon.png",
                      color: ColorTheme.themeWhiteColor),
                ),
              ),
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
            ),
          ],
        ),
      ),
    ),
  );
}
