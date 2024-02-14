import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yopee_cleaner/Entity/Responses/EarningsResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/GrossEarningsResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/JobDetailResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/JobStatusDoneResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/PaymentDetailsResponse.dart';
import 'package:yopee_cleaner/Entity/Responses/Notification/ReadNotificationResponse.dart';

import '../Entity/Responses/AboutUsResponse.dart';
import '../Entity/Responses/DashboardResponse.dart';
import '../Entity/Responses/HelpResponse.dart';
import '../Entity/Responses/Login/SignupResponse.dart';
import '../Entity/Responses/Notification/DeleteNotificationResponse.dart';
import '../Entity/Responses/Login/loginResponse.dart';
import '../Entity/Responses/LogoutResponse.dart';
import '../Entity/Responses/Notification/NotificationStatusResponse.dart';
import '../Entity/Responses/Otp/otpResponse.dart';
import '../Entity/Responses/Profile/ProfileUpdateResponse.dart';
import '../Entity/Responses/Profile/ProfileViewResponse.dart';
import '../Entity/Responses/Notification/UnreadNotificationResponse.dart';
import '../Entity/Responses/ReasonResponse.dart';
import '../Entity/Responses/ReportsListResponse.dart';
import '../Entity/Responses/SpecialRequestListResponse.dart';
import '../Entity/Responses/StatusResponse.dart';
import '../Utility/Environment.dart';
import '../View/Login/Login.dart';

class YopeeApiClient {
  //login/Signin
  Future<LoginResponse> loginApi(String mobile) async {
    LoginResponse objLoginResponse = LoginResponse(data: []);
    String loginUrl = Environment.baseUrl + Environment.loginUrl;
    print("login url:${loginUrl}");

    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> loginParams = {
        "mobile": mobile,
        "country_code": "+91",
        "user_type": "customer"
      };
      // final encoding = Encoding.getByName('utf-8');

      print("login params:$loginParams");

      final response = await http.post(
        Uri.parse(loginUrl),
        body: loginParams,
        //encoding: encoding,
      );

      print("login body:${response.body}");

      int statusCode = response.statusCode;
      print("Login statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objLoginResponse = loginResponseFromJson(response.body);

        if (objLoginResponse.data.isEmpty) {
          Fluttertoast.showToast(
              msg: "${objLoginResponse.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xffF3CBCB),
              textColor: Colors.red,
              fontSize: 16.0);
        } else {
          Environment.loginMobileNumber =
              objLoginResponse.data[0].mobile.toString();
          print("Login Mobile Number:${Environment.loginMobileNumber}");
        }
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again.!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xffF3CBCB),
            textColor: Colors.red,
            fontSize: 16.0);
      } else if (statusCode == 422) {
        Fluttertoast.showToast(
            msg: "${objLoginResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      throw Exception(e);
    }
    return objLoginResponse;
  }

  //Logout Response
  Future<LogoutResponse> logoutApi(String mobile) async {
    LogoutResponse objLogoutResponse = LogoutResponse(data: []);
    String logoutUrl = Environment.baseUrl + Environment.logoutUrl;
    print("logout url:${logoutUrl}");

    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> logoutParams = {
        "mobile": mobile,
        "country_code": "+91",
        "user_type": "cleaner"
      };
      // final encoding = Encoding.getByName('utf-8');

      print("logout params:$logoutParams");

      final response = await http.post(
        Uri.parse(logoutUrl),
        body: logoutParams,
        //encoding: encoding,
      );

      print("logout body:${response.body}");

      int statusCode = response.statusCode;
      print("Logout statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objLogoutResponse = logoutResponseFromJson(response.body);
      } else if (statusCode == 422) {}
    } catch (e) {
      throw Exception(e);
    }
    return objLogoutResponse;
  }

  //Otp Verify
  Future<OtpResponse> otpVerifyApi(String userId, String otpNumber) async {
    OtpResponse objOtpResponse = OtpResponse();
    String otpVerifyUrl = Environment.baseUrl + Environment.otpVerifyUrl;
    print("Otp url:${otpVerifyUrl}");

    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> otpParams = {
        "user_id": userId,
        "otp_number": otpNumber
      };
      // final encoding = Encoding.getByName('utf-8');

      print("otpparams:$otpParams");

      final response = await http.post(
        Uri.parse(otpVerifyUrl),
        body: otpParams,
        //encoding: encoding,
      );

      print("otp body:${response.body}");

      int statusCode = response.statusCode;
      print("Otp statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objOtpResponse = otpResponseFromJson(response.body);
        Environment.accessToken = objOtpResponse.data!.accessToken.toString();
        print("Access Token:${Environment.accessToken}");
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "OTP is invalid.\nPlease try again with correct OTP",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      throw Exception(e);
    }
    return objOtpResponse;
  }

  //Dashboard
  Future<DashboardResponse> dashboardApi(BuildContext context) async {
    DashboardResponse objDashboardResponse = DashboardResponse(
        data: DashboardData(jobRequest: [], userProfile: UserProfile()));
    String dashboardUrl = Environment.baseUrl + Environment.dashboardUrl;
    print("Dashboard url:${dashboardUrl}");

    try {
      Map<String, String> headers = {
        // "Content-type": "application/json",
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      final response =
          await http.post(Uri.parse(dashboardUrl), headers: headers);

      print("dashboard body:${response.body}");

      int statusCode = response.statusCode;
      print("Dashboard statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objDashboardResponse =
            DashboardResponse.fromJson(jsonDecode(response.body));
        return objDashboardResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/login');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objDashboardResponse;
  }

  //Earnings
  Future<EarningsResponse> earningsApi(String month) async {
    EarningsResponse objEarningsResponse =
        EarningsResponse(data: EarningsData(transcations: []));
    String earningsUrl = Environment.baseUrl + Environment.earningUrl;
    print("Earnings url:${earningsUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> earningParams = {"month": month};

      var body = earningParams;
      // final encoding = Encoding.getByName('utf-8');

      print("earningParams :$body ");

      final response = await http.post(
        Uri.parse(earningsUrl),
        body: body,
        headers: headers,
      );

      print("earning body:${response.body}");

      int statusCode = response.statusCode;
      print("earning statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        objEarningsResponse = earningsResponseFromJson(data);
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      throw Exception(e);
    }
    return objEarningsResponse;
  }

  // Gross Earnings

  Future<GrossEarningsResponse> grossEarningsApi(String month) async {
    GrossEarningsResponse objGrossEarningsResponse = GrossEarningsResponse(
        data: GrossEarningsData(transcations: [], totalGrassEarning: 0));
    String grossEarningUrl = Environment.baseUrl + Environment.grossEarningUrl;
    print("Gross Earning url:${grossEarningUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> grossEarningParams = {"month": month};

      var body = grossEarningParams;
      // final encoding = Encoding.getByName('utf-8');

      print("grossEarningParams :$body ");

      final response = await http.post(Uri.parse(grossEarningUrl),
          body: body, headers: headers);

      print("gross earning body:${response.body}");

      int statusCode = response.statusCode;
      print("gross earning  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objGrossEarningsResponse =
            GrossEarningsResponse.fromJson(jsonDecode(response.body));

        print("objGrossEarningsResponse:${objGrossEarningsResponse.data}");
        return objGrossEarningsResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objGrossEarningsResponse;
  }

  //Payment details

  Future<PaymentDetailsResponse> paymentDetailsApi(
    String id,
  ) async {
    PaymentDetailsResponse objPaymentDetailsResponse = PaymentDetailsResponse(
        data: PaymentDetailsData(
            transcation: TranscationData(
                userAddress: PaymentUserAddress(),
                userVehicle: PaymentUserVehicle(
                    brand: PaymentBrand(),
                    model: PaymentBrand(),
                    vehicle: PaymentBrand()),
                user: PaymentUser())));
    String paymentDetailsUrl =
        Environment.baseUrl + Environment.paymentDetailsUrl;
    print("Payment Details url:${paymentDetailsUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> paymentDetailsParams = {"id": id};

      var body = paymentDetailsParams;
      // final encoding = Encoding.getByName('utf-8');

      print("paymentDetailsParams :$body ");

      final response = await http.post(Uri.parse(paymentDetailsUrl),
          body: body, headers: headers);

      print("payment details body:${response.body}");

      int statusCode = response.statusCode;
      print("payment Details  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objPaymentDetailsResponse =
            PaymentDetailsResponse.fromJson(jsonDecode(response.body));

        print("objPaymentDetailsResponse:${objPaymentDetailsResponse.data}");
        return objPaymentDetailsResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objPaymentDetailsResponse;
  }

  // Profile View
  Future<ProfileViewResponse> profileViewApi(BuildContext context) async {
    ProfileViewResponse objProfileViewResponse = ProfileViewResponse(
        data: ProfileViewData(
            id: 0,
            userType: '',
            status: '',
            email: '',
            countryCode: '',
            mobile: 0,
            latitude: '',
            longitude: '',
            address: ' 0',
            accessToken: '',
            pushNotification: 0,
            notifyMonthlyPayment: 0,
            profileImageUrl: '',
            name: ''),
        message: '',
        status: 0);

    String profileViewUrl = Environment.baseUrl + Environment.profileViewUrl;
    print("Profile View url:${profileViewUrl}");

    try {
      final headers = {
        // 'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      print("Accesstoken:${Environment.accessToken}");
      final response = await http.get(
        Uri.parse(profileViewUrl),
        headers: headers,
      );

      print("Profile View body:${response.body}");

      int statusCode = response.statusCode;
      print("Profile View statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await jsonDecode(response.body);
        print("profileview_data:$data");
        objProfileViewResponse = ProfileViewResponse.fromJson(data);

        print("profileview_json:${objProfileViewResponse.data}");
        return objProfileViewResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objProfileViewResponse;
  }

  //Read Notification
  Future<ReadNotificationResponse> readNotificationApi(
      String id, BuildContext context) async {
    ReadNotificationResponse objReadNotificationResponse =
        ReadNotificationResponse();
    String readNotificationUrl =
        Environment.baseUrl + Environment.readNotificationUrl;
    print("Read Notification url:${readNotificationUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> readNotificationParams = {"id": id};

      var body = readNotificationParams;
      // final encoding = Encoding.getByName('utf-8');

      print("readNotificationParams :$body ");

      final response = await http.post(Uri.parse(readNotificationUrl),
          body: body, headers: headers);

      print("read Notification body:${response.body}");

      int statusCode = response.statusCode;
      print("Read Notification statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objReadNotificationResponse =
            ReadNotificationResponse.fromJson(jsonDecode(response.body));

        print(
            "objReadNotificationResponse:${objReadNotificationResponse.data}");
        return objReadNotificationResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objReadNotificationResponse;
  }

  //Delete Notification
  Future<DeleteNotificationResponse> deleteNotificationApi(
      String receiverId, BuildContext context) async {
    DeleteNotificationResponse objDeleteNotificationResponse =
        DeleteNotificationResponse();
    String deleteNotificationUrl =
        Environment.baseUrl + Environment.deleteNotificationUrl;
    print("Delete Notification url:${deleteNotificationUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> deleteNotificationParams = {"id": receiverId};

      var body = deleteNotificationParams;
      // final encoding = Encoding.getByName('utf-8');

      print("DeleteNotificationParams :$body ");

      final response = await http.post(Uri.parse(deleteNotificationUrl),
          body: body, headers: headers);

      print("Delete Notification body:${response.body}");

      int statusCode = response.statusCode;
      print("Delete Notification statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objDeleteNotificationResponse =
            DeleteNotificationResponse.fromJson(jsonDecode(response.body));

        print(
            "objDeleteNotificationResponse:${objDeleteNotificationResponse.data}");
        return objDeleteNotificationResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/login');
      } else if (statusCode == 422) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/dashboard');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objDeleteNotificationResponse;
  }

  //List Notification
  Future<UnreadNotificationResponse> listNotificationApi(
      String status, BuildContext context) async {
    UnreadNotificationResponse objUnreadNotificationResponse =
        UnreadNotificationResponse(data: [], message: '', status: 0);
    String listNotificationUrl =
        Environment.baseUrl + Environment.listNotificationUrl;
    print("list Notification url:${listNotificationUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> listNotificationParams = {"status": status};

      var body = listNotificationParams;
      // final encoding = Encoding.getByName('utf-8');

      print("ListNotificationParams :$body ");

      final response = await http.post(Uri.parse(listNotificationUrl),
          body: body, headers: headers);

      print("List Notification body:${response.body}");

      int statusCode = response.statusCode;
      print("List Notification statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objUnreadNotificationResponse =
            UnreadNotificationResponse.fromJson(jsonDecode(response.body));

        print(
            "objUnreadNotificationResponse:${objUnreadNotificationResponse.data}");
        return objUnreadNotificationResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objUnreadNotificationResponse;
  }

  //Notification Status
  Future<NotificationStatusResponse> notificationStatusApi(
      String pushNotification, BuildContext context) async {
    NotificationStatusResponse objNotificationStatusResponse =
        NotificationStatusResponse(data: NotificationData());
    String notificationStatusUrl =
        Environment.baseUrl + Environment.notificationStatusUrl;
    print("Notification Status url:${notificationStatusUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> notificationStatusParams = {
        "push_notification": pushNotification,
        "notify_monthly_payment": "0"
      };

      var body = notificationStatusParams;
      // final encoding = Encoding.getByName('utf-8');

      print("notification Status Params :$body ");

      final response = await http.post(Uri.parse(notificationStatusUrl),
          body: body, headers: headers);

      print("Notification Status body:${response.body}");

      int statusCode = response.statusCode;
      print("Notification Status statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objNotificationStatusResponse =
            NotificationStatusResponse.fromJson(jsonDecode(response.body));

        Environment.notificationStatus =
            objNotificationStatusResponse.data.pushNotification.toString();

        print(
            "objNotificationStatusResponse:${objNotificationStatusResponse.data}");
        return objNotificationStatusResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objNotificationStatusResponse;
  }

  //Help
  Future<HelpResponse> helpApi(String name, String email, String mobile,
      String message, BuildContext context) async {
    HelpResponse objHelpResponse = HelpResponse(data: HelpData());
    String helpUrl = Environment.baseUrl + Environment.helpUrl;
    print("Help url:${helpUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> helpParams = {
        "name": name,
        "mobile": mobile,
        "email": email,
        "message": message
      };

      var body = helpParams;
      // final encoding = Encoding.getByName('utf-8');

      print("Help Params :$body ");

      final response =
          await http.post(Uri.parse(helpUrl), body: body, headers: headers);

      print("Help body:${response.body}");

      int statusCode = response.statusCode;
      print("Help statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objHelpResponse = HelpResponse.fromJson(jsonDecode(response.body));

        print("objHelpResponse:${objHelpResponse.data}");
        return objHelpResponse;
      } else if (statusCode == 500) {
      } else if (statusCode == 422) {
        Fluttertoast.showToast(
            msg: "The mobile number must be a number.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      throw Exception(e);
    }
    return objHelpResponse;
  }

  //Reports List

  Future<ReportsListResponse> reportsListApi(
      String month, BuildContext context) async {
    ReportsListResponse objReportsListResponse = ReportsListResponse(data: []);
    String reportsListUrl = Environment.baseUrl + Environment.reportsListUrl;
    print("reportsListUrl:${reportsListUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> reportsListParams = {"month": month};

      var body = reportsListParams;
      // final encoding = Encoding.getByName('utf-8');

      print("reportsListParams :$body ");

      final response = await http.post(Uri.parse(reportsListUrl),
          body: body, headers: headers);

      print("reports list body:${response.body}");

      int statusCode = response.statusCode;
      print("reports list  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objReportsListResponse =
            ReportsListResponse.fromJson(jsonDecode(response.body));

        print("objReportsListResponse:${objReportsListResponse.data}");
        return objReportsListResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objReportsListResponse;
  }

//Report Detail
  Future<JobDetailResponse> reportDetailApi(
      String bookingId, BuildContext context) async {
    JobDetailResponse objJobDetailResponse = JobDetailResponse(
        data: JobDetailData(
            rateWashlists: [],
            bookingDetails: BookingDetails(
              user: JobDetailCleaner(),
              userVehicle: JobDetailUserVehicle(
                  brand: JobDetailSubscription(),
                  model: JobDetailSubscription(),
                  vehicle: JobDetailSubscription()),
              userAddress: JobDetailUserAddress(),
              cleaner: JobDetailCleaner(),
              media: [],
              subscription: JobDetailSubscription(),
              transaction: JobDetailTransaction(),
              service: JobDetailService(),
              status: '',
              actionImageUrl: '',
            )));
    String jobDetailUrl = Environment.baseUrl + Environment.reportsDetailUrl;
    print("JobDetailUrl:${jobDetailUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> reportsDetailParams = {"booking_id": bookingId};

      var body = reportsDetailParams;
      // final encoding = Encoding.getByName('utf-8');

      print("reportsDetailParams :$body ");

      final response = await http.post(Uri.parse(jobDetailUrl),
          body: body, headers: headers);

      print("reports Detail  body:${response.body}");

      int statusCode = response.statusCode;
      print("reports Detail  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objJobDetailResponse =
            JobDetailResponse.fromJson(jsonDecode(response.body));

        print("objJobDetailResponse:${objJobDetailResponse.data}");
        return objJobDetailResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objJobDetailResponse;
  }

  //Job Status Not Going
  Future<StatusResponse> jobStatusApi(String jobId, String status,
      String actionReason, String actionMessage, BuildContext context) async {
    StatusResponse objJobStatusResponse = StatusResponse(data: []);
    String jobStatusUrl = Environment.baseUrl + Environment.statusUrl;
    print("JobStatusUrl:${jobStatusUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> statusParams = {
        "job_id": jobId,
        "status": status,
        "action_reason": actionReason,
        "action_message": actionMessage
      };

      var body = statusParams;
      // final encoding = Encoding.getByName('utf-8');

      print("Status Params :$body ");

      final response = await http.post(Uri.parse(jobStatusUrl),
          body: body, headers: headers);

      print("Status  body:${response.body}");

      int statusCode = response.statusCode;
      print("Status  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objJobStatusResponse =
            StatusResponse.fromJson(jsonDecode(response.body));

        print("objJobStatusResponse:${objJobStatusResponse.data}");
        return objJobStatusResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objJobStatusResponse;
  }

  //Reason
  Future<ReasonResponse> reasonApi(BuildContext context) async {
    ReasonResponse objReasonResponse = ReasonResponse(data: []);
    String reasonUrl = Environment.baseUrl + Environment.reasonUrl;
    print("ReasonUrl:${reasonUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      // Map<String, dynamic> statusParams = {
      //   "job_id": "5",
      //   "status": "Not Going",
      //   "action_reason": "not well",
      //   "action_message": "I am not well"
      // };
      //
      // var body = statusParams;
      // // final encoding = Encoding.getByName('utf-8');
      //
      // print("Status Params :$body ");

      final response = await http.get(Uri.parse(reasonUrl), headers: headers);

      print("Reason  body:${response.body}");

      int statusCode = response.statusCode;
      print("Reason  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objReasonResponse = ReasonResponse.fromJson(jsonDecode(response.body));

        print("objReasonResponse:${objReasonResponse.data}");
        return objReasonResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objReasonResponse;
  }

  //Special Request List

  Future<SpecialRequestListResponse> specialRequestListApi(
      String month, BuildContext context) async {
    SpecialRequestListResponse objSpecialListResponse =
        SpecialRequestListResponse(data: [], message: '', status: 0);
    String specialRequestListUrl =
        Environment.baseUrl + Environment.specialRequestListUrl;
    print("specialRequestListUrl:${specialRequestListUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> spclReqListParams = {"month": month};

      var body = spclReqListParams;
      // final encoding = Encoding.getByName('utf-8');

      print("spclReqListParams :$body ");
      final response = await http.post(Uri.parse(specialRequestListUrl),
          body: body, headers: headers);

      print("special request list body:${response.body}");

      int statusCode = response.statusCode;
      print("special Request list  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        // final List body = json.decode(response.body);
        // return body.map((e) => SpecialRequestListResponse.fromJson(e)).toList();

        objSpecialListResponse =
            SpecialRequestListResponse.fromJson(json.decode(response.body));

        print("objSpecialListResponse :${objSpecialListResponse.data}");
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSpecialListResponse;
  }

  //About Us
  Future<AboutUsResponse> aboutUsApi(String slug, BuildContext context) async {
    AboutUsResponse objAboutUsResponse = AboutUsResponse(
      message: '',
      status: 0,
      data: AboutUsdata(slug: '', tittle: '', description: ''),
    );
    String aboutUsUrl = Environment.baseUrl + Environment.aboutUsUrl;
    print("about Us url:${aboutUsUrl}");

    try {
      final headers = {
        // 'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //  'Charset': 'utf-8',
        // 'Authorization': 'Bearer ${Environment.accessToken}'
      };

      Map<String, String> aboutUsParams = {
        "slug": slug,
      };
      // final encoding = Encoding.getByName('utf-8');

      print("aboutUsParams :$aboutUsParams ");

      final response = await http.post(Uri.parse(aboutUsUrl),
          body: aboutUsParams, headers: headers);

      print("about Us body:${response.body}");

      int statusCode = response.statusCode;
      print("about us statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // objAboutUsResponse = aboutUsResponseFromJson(response.body);
        objAboutUsResponse =
            AboutUsResponse.fromJson(jsonDecode(response.body));
        return objAboutUsResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              mobile: '',
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objAboutUsResponse;
  }
}
