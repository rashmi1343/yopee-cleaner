import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yopee_cleaner/View/Dashboard/Home.dart';
import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
import 'package:yopee_cleaner/View/Dashboard/dashboard.dart';
import 'package:yopee_cleaner/View/JobStatus.dart';
import 'package:yopee_cleaner/View/NotGoingScreen.dart';
import 'package:yopee_cleaner/View/Payment/Earning.dart';
import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
import 'package:yopee_cleaner/View/Profile/Profile.dart';
import 'package:yopee_cleaner/View/SpecialRequest.dart';

import 'Presenter/YopeeProvider.dart';
import 'Router/AppRoutes.dart';
import 'Router/Routes.dart';

import 'View/Dashboard/ContactUs.dart';
import 'View/Dashboard/custom_animated_bottom_bar.dart';
import 'View/Payment/GrossEarning.dart';
import 'View/Reports/ReportDetail.dart';
import 'View/Reports/ReportScreen.dart';
import 'View/Splash/SplashScreen.dart';

// @dart=2.9
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool checkLogin = _prefs.getBool("isLoggedIn") ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => YopeeProvider()),
  ], child: const MyApp()));

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // log("FCMToken $fcmToken");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yopee Cleaner',
      navigatorKey: navigatorKey,
      home: SplashScreen(),
      initialRoute: Routes.splash,
      routes: AppRoutes.routes,
      // routes: {
      //   '/home': (context) => MyHomePage(),
      //   '/dashboard': (context) => Dashboard(),
      //   '/reports': (context) => ReportScreen(),
      //   '/notification': (context) => NotificationScreen(),
      //   '/paymentDetails': (context) => PaymentDetails(),
      //   '/contact': (context) => ContactUs(),
      // },
    );
  }
}
