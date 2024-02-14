import 'package:yopee_cleaner/AppBottomNav.dart';
import 'package:yopee_cleaner/View/Dashboard/ContactUs.dart';
import 'package:yopee_cleaner/View/Dashboard/Home.dart';
import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
import 'package:yopee_cleaner/View/Dashboard/custom_animated_bottom_bar.dart';
import 'package:yopee_cleaner/View/Dashboard/dashboard.dart';
import 'package:yopee_cleaner/View/JobStatus.dart';
import 'package:yopee_cleaner/View/NotGoingScreen.dart';
import 'package:yopee_cleaner/View/OTP/OtpVerification.dart';
import 'package:yopee_cleaner/View/Payment/Earning.dart';
import 'package:yopee_cleaner/View/Payment/PaymentDetails.dart';
import 'package:yopee_cleaner/View/SpecialRequest.dart';

import '../View/Dashboard/NewNotification.dart';
import '../View/Login/Login.dart';

import '../View/Payment/GrossEarning.dart';
import '../View/Profile/Profile.dart';
import '../View/Reports/ReportDetail.dart';
import '../View/Reports/ReportScreen.dart';
import '../View/Splash/SplashScreen.dart';
import 'Routes.dart';

class AppRoutes {
  static var routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.login: (context) => Login(
          mobile: '',
        ),
    Routes.otp: (context) => OtpVerification(),
    Routes.dashboard: (context) => Dashboard(),
    Routes.profile: (context) => Profile(),
    Routes.jobStatus: (context) => JobStatus(
          id: '',
          brandImage: '',
          brandName: '',
          registrationName: '',
          modelName: '',
          vehicleName: '',
          name: '',
          flatHouseNo: '',
          areaSector: '',
          nearby: '',
        ),
    Routes.specialRequest: (context) => SpecialRequest(),
    Routes.notGoingScreen: (context) => NotGoingScreen(
          id: '',
          brandImage: '',
          brandName: '',
          registrationName: '',
          modelName: '',
          vehicleName: '',
          address: '',
          name: '',
        ),
    Routes.reports: (context) => ReportScreen(),
    Routes.reportDetail: (context) => ReportDetail(
          id: '',
        ),
    Routes.notification: (context) => NotificationScreen(),
    Routes.newNotification: (context) => NewNotificationScreen(),
    Routes.contact: (context) => ContactUs(),
    Routes.earning: (context) => EarningScreen(),
    Routes.grossEarning: (context) => GrossEarningScreen(),
    Routes.paymentDetails: (context) => PaymentDetails(
          id: '',
        ),
    Routes.home: (context) => AppBottomNav(),
    Routes.customBottomBar: (context) => CustomAnimatedBottomBar(
          items: [],
          onItemSelected: (int value) {},
        ),
  };
}
