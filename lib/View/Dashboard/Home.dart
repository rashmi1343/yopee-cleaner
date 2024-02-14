// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:yopee_cleaner/View/Dashboard/ContactUs.dart';
// import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
// import 'package:yopee_cleaner/View/Dashboard/dashboard.dart';
// import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
// import 'package:yopee_cleaner/View/Reports/ReportScreen.dart';
//
// import '../../Presenter/YopeeProvider.dart';
// import '../../Router/Routes.dart';
// import '../../Utility/ColorTheme.dart';
// import '../../Utility/Environment.dart';
// import '../../Widgets/bottom_bar.dart';
// import 'custom_animated_bottom_bar.dart';
//
// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Widget> widgetOptions = <Widget>[];
//   int _currentIndex = 0;
//
//   final _page1 = GlobalKey<NavigatorState>();
//   final _page2 = GlobalKey<NavigatorState>();
//   final _page3 = GlobalKey<NavigatorState>();
//   final _page4 = GlobalKey<NavigatorState>();
//   final _page5 = GlobalKey<NavigatorState>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var provider = Provider.of<YopeeProvider>(context, listen: false);
//
//       provider.getProfileViewApi(context);
//
//       provider.getDashboardApi(context);
//
//       // provider.getProfileViewApi(context);
//       //
//       // Environment.accountDetails =
//       //     provider.objProfileViewResponse.data.accountDetails;
//       //
//       // //provider.isProfileEdit = true;
//       // //  print("account details:${provider.objProfileViewResponse.data.name}");
//       // if (Environment.profileName.isEmpty || Environment.profileEmail.isEmpty) {
//       //   provider.isProfileEdit = true;
//       //   showProfileDialog(context, provider);
//       // }
//
//       widgetOptions.add(Dashboard());
//       widgetOptions.add(ReportScreen());
//       widgetOptions.add(NotificationScreen());
//       widgetOptions.add(PaymentDetails());
//       widgetOptions.add(ContactUs());
//
//       // provider.getNotificationStatusApi("0", context);
//     });
//   }
//
//   Future<bool> showExitPopup() async {
//     return await showDialog(
//           //show confirm dialogue
//           //the return value will be from "Yes" or "No" options
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               'Exit App',
//               style: TextStyle(
//                   fontSize: 16, fontFamily: "SemiBold", color: Colors.black),
//             ),
//             content: Text(
//               'Do you want to exit an App?',
//               style: TextStyle(
//                   fontSize: 14, fontFamily: "Medium", color: Colors.black),
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 //return false when click on "NO"
//                 child: Text(
//                   'No',
//                   style: TextStyle(
//                       fontSize: 12, fontFamily: "Regular", color: Colors.red),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => SystemNavigator.pop(),
//                 //return true when click on "Yes"
//                 child: Text(
//                   'Yes',
//                   style: TextStyle(
//                       fontSize: 12, fontFamily: "Regular", color: Colors.green),
//                 ),
//               ),
//             ],
//           ),
//         ) ??
//         false; //if showDialouge had returned null, then return false
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<YopeeProvider>(context, listen: false);
//     return Consumer<YopeeProvider>(builder: (context, provider, child) {
//       return WillPopScope(
//         onWillPop: showExitPopup,
//         child: RefreshIndicator(
//           onRefresh: () => provider.getDashboardApi(context),
//           child: Scaffold(
//               // body: IndexedStack(
//               //     index: provider.currentBottomBarIndex,
//               //     children: widgetOptions),
//               body: IndexedStack(
//                 index: provider.currentBottomBarIndex,
//                 children: <Widget>[
//                   Navigator(
//                     key: _page1,
//                     onGenerateRoute: (route) => MaterialPageRoute(
//                       settings: route,
//                       builder: (context) => Dashboard(),
//                     ),
//                   ),
//                   Navigator(
//                     key: _page2,
//                     onGenerateRoute: (route) => MaterialPageRoute(
//                       settings: route,
//                       builder: (context) => ReportScreen(),
//                     ),
//                   ),
//                   Navigator(
//                     key: _page3,
//                     onGenerateRoute: (route) => MaterialPageRoute(
//                       settings: route,
//                       builder: (context) => NotificationScreen(),
//                     ),
//                   ),
//                   Navigator(
//                     key: _page4,
//                     onGenerateRoute: (route) => MaterialPageRoute(
//                       settings: route,
//                       builder: (context) => PaymentDetails(),
//                     ),
//                   ),
//                   Navigator(
//                     key: _page5,
//                     onGenerateRoute: (route) => MaterialPageRoute(
//                       settings: route,
//                       builder: (context) => ContactUs(),
//                     ),
//                   ),
//                 ],
//               ),
//               bottomNavigationBar: commonbottomBar(context, provider)
//               // body: getBody(provider),
//               // bottomNavigationBar: buildBottomBar(context, provider));
//               ),
//         ),
//       );
//     });
//   }
//
//   Widget getBody(YopeeProvider provider) {
//     List<Widget> pages = [
//       Dashboard(),
//       ReportScreen(),
//       NotificationScreen(),
//       PaymentDetails(),
//       ContactUs()
//     ];
//     return IndexedStack(
//       index: provider.currentBottomBarIndex,
//       children: pages,
//     );
//   }
//
//   Future<void> showProfileDialog(BuildContext context, YopeeProvider provider) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//             content: Container(
//               width: 150,
//               height: 100,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(15)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Please fill Your Profile Details",
//                     style: TextStyle(
//                         fontFamily: "SemiBold",
//                         fontSize: 14,
//                         color: ColorTheme.themeDarkBlueColor),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(false);
//                           // Fluttertoast.showToast(
//                           //     msg: "Please fill your profile details first!!",
//                           //     toastLength: Toast.LENGTH_SHORT,
//                           //     gravity: ToastGravity.CENTER,
//                           //     timeInSecForIosWeb: 1,
//                           //     backgroundColor: Colors.red,
//                           //     textColor: Colors.white,
//                           //     fontSize: 16.0);
//                         },
//                         //return false when click on "NO"
//                         child: Text(
//                           'No',
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: "Regular",
//                               color: Colors.red),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () =>
//                             Navigator.of(context).pushNamed('/profile'),
//                         //return true when click on "Yes"
//                         child: Text(
//                           'Yes',
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: "Regular",
//                               color: Colors.green),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
