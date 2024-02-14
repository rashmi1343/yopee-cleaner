import 'package:flutter/cupertino.dart';
import 'package:yopee_cleaner/Entity/Responses/GrossEarningsResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/PaymentDetailsResponse.dart';

import '../Entity/Responses/AboutUsResponse.dart';
import '../Entity/Responses/DashboardResponse.dart';
import '../Entity/Responses/HelpResponse.dart';
import '../Entity/Responses/JobDetailResponse.dart';
import '../Entity/Responses/Notification/DeleteNotificationResponse.dart';
import '../Entity/Responses/EarningsResponse.dart';
import '../Entity/Responses/Login/loginResponse.dart';
import '../Entity/Responses/LogoutResponse.dart';
import '../Entity/Responses/Notification/NotificationStatusResponse.dart';
import '../Entity/Responses/Otp/otpResponse.dart';
import '../Entity/Responses/Profile/ProfileUpdateResponse.dart';
import '../Entity/Responses/Profile/ProfileViewResponse.dart';
import '../Entity/Responses/Notification/ReadNotificationResponse.dart';
import '../Entity/Responses/Notification/UnreadNotificationResponse.dart';
import '../Entity/Responses/ReasonResponse.dart';
import '../Entity/Responses/ReportsListResponse.dart';
import '../Entity/Responses/SpecialRequestListResponse.dart';
import '../Entity/Responses/StatusResponse.dart';
import 'ApiClient.dart';

class YopeeRepository {
  final YopeeApiClient yopeeApiClient = YopeeApiClient();
  //login
  Future<LoginResponse> loginRepo(String mobile) async {
    try {
      final loginResponse = await yopeeApiClient.loginApi(mobile);
      return loginResponse;
    } catch (e) {
      print("login error:$e");
      rethrow;
    }
  }

  //logout
  Future<LogoutResponse> logoutRepo(String mobile) async {
    try {
      final logoutResponse = await yopeeApiClient.logoutApi(mobile);
      return logoutResponse;
    } catch (e) {
      print("logout error:$e");
      rethrow;
    }
  }

  //Otp Verify
  Future<OtpResponse> otpRepo(String userID, String otpNumber) async {
    try {
      final otpResponse = await yopeeApiClient.otpVerifyApi(userID, otpNumber);
      return otpResponse;
    } catch (e) {
      print("otp error:$e");
      rethrow;
    }
  }

  //Profile View
  Future<ProfileViewResponse> profileViewRepo(BuildContext context) async {
    try {
      final profileViewResponse = await yopeeApiClient.profileViewApi(context);
      return profileViewResponse;
    } catch (e) {
      print("profileView error:$e");
      rethrow;
    }
  }

  // //Profile Update
  // Future<ProfileUpdateResponse> profileUpdateRepo(
  //     String name, String email, String mobile, String address) async {
  //   try {
  //     final profileUpdateResponse =
  //         await yopeeApiClient.profileUpdateApi(name, email, mobile, address);
  //     return profileUpdateResponse;
  //   } catch (e) {
  //     print("profile update error:$e");
  //     rethrow;
  //   }
  // }

  //Dashboard
  Future<DashboardResponse> dashboardRepo(BuildContext context) async {
    try {
      final dashboardResponse = await yopeeApiClient.dashboardApi(context);
      return dashboardResponse;
    } catch (e) {
      print("dashboard error:$e");
      rethrow;
    }
  }

  //Earnings
  Future<EarningsResponse> earningsRepo(String month) async {
    try {
      final earningsResponse = await yopeeApiClient.earningsApi(month);
      return earningsResponse;
    } catch (e) {
      print("earnings error:$e");
      rethrow;
    }
  }

  //Gross Earnings
  Future<GrossEarningsResponse> grossEarningsRepo(String month) async {
    try {
      final grossearningsResponse =
          await yopeeApiClient.grossEarningsApi(month);
      return grossearningsResponse;
    } catch (e) {
      print("gross earnings error:$e");
      rethrow;
    }
  }

  //Payment Details
  Future<PaymentDetailsResponse> paymentDetailsRepo(String id) async {
    try {
      final paymentDetailsResponse = await yopeeApiClient.paymentDetailsApi(id);
      return paymentDetailsResponse;
    } catch (e) {
      print("paymentDetails error:$e");
      rethrow;
    }
  }

  //Read Notification
  Future<ReadNotificationResponse> readNotificationRepo(
      String id, BuildContext context) async {
    try {
      final readNotificationResponse =
          await yopeeApiClient.readNotificationApi(id, context);
      return readNotificationResponse;
    } catch (e) {
      print("read Notification error:$e");
      rethrow;
    }
  }

  //Delete Notification
  Future<DeleteNotificationResponse> deleteNotificationRepo(
      String receiverId, BuildContext context) async {
    try {
      final deleteNotificationResponse =
          await yopeeApiClient.deleteNotificationApi(receiverId, context);
      return deleteNotificationResponse;
    } catch (e) {
      print("Delete Notification error:$e");
      rethrow;
    }
  }

  //List Notification
  Future<UnreadNotificationResponse> listNotificationRepo(
      String status, BuildContext context) async {
    try {
      final listNotificationResponse =
          await yopeeApiClient.listNotificationApi(status, context);
      return listNotificationResponse;
    } catch (e) {
      print("List Notification error:$e");
      rethrow;
    }
  }

  // Notification Status
  Future<NotificationStatusResponse> notificationStatusRepo(
      String pushNotification, BuildContext context) async {
    try {
      final notificationStatusResponse =
          await yopeeApiClient.notificationStatusApi(pushNotification, context);
      return notificationStatusResponse;
    } catch (e) {
      print("Notification Status error:$e");
      rethrow;
    }
  }

  // Help
  Future<HelpResponse> helpRepo(String name, String email, String mobile,
      String message, BuildContext context) async {
    try {
      final notificationStatusResponse =
          await yopeeApiClient.helpApi(name, email, mobile, message, context);
      return notificationStatusResponse;
    } catch (e) {
      print("Help error:$e");
      rethrow;
    }
  }

  //Reports List
  Future<ReportsListResponse> reportsListRepo(
      String month, BuildContext context) async {
    try {
      final reportsListResponse =
          await yopeeApiClient.reportsListApi(month, context);
      return reportsListResponse;
    } catch (e) {
      print("Reports  list error:$e");
      rethrow;
    }
  }

  //Reports Detail
  Future<JobDetailResponse> reportsDetailRepo(
      String bookingId, BuildContext context) async {
    try {
      final reportsDetailResponse =
          await yopeeApiClient.reportDetailApi(bookingId, context);
      return reportsDetailResponse;
    } catch (e) {
      print("Reports  Detail error:$e");
      rethrow;
    }
  }

  //Status
  Future<StatusResponse> statusRepo(String jobId, String status,
      String actionReason, String actionMessage, BuildContext context) async {
    try {
      final statusResponse = await yopeeApiClient.jobStatusApi(
          jobId, status, actionReason, actionMessage, context);
      return statusResponse;
    } catch (e) {
      print("Status error:$e");
      rethrow;
    }
  }

  //Reason
  Future<ReasonResponse> reasonRepo(BuildContext context) async {
    try {
      final reasonResponse = await yopeeApiClient.reasonApi(context);
      return reasonResponse;
    } catch (e) {
      print("Reason error:$e");
      rethrow;
    }
  }

  //Special Request List
  Future<SpecialRequestListResponse> specialReqListRepo(
      String month, BuildContext context) async {
    try {
      final specialReqListResponse =
          await yopeeApiClient.specialRequestListApi(month, context);
      return specialReqListResponse;
    } catch (e) {
      print("Special request  list error:$e");
      rethrow;
    }
  }

  //About Us
  Future<AboutUsResponse> aboutUsRepo(String slug, BuildContext context) async {
    try {
      final aboutUsResponse = await yopeeApiClient.aboutUsApi(slug, context);
      return aboutUsResponse;
    } catch (e) {
      print("about Us error:$e");
      rethrow;
    }
  }
}
