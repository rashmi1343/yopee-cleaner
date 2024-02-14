import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yopee_cleaner/AppBottomNav.dart';
import 'package:yopee_cleaner/Entity/Responses/PaymentDetailsResponse.dart';
import 'package:yopee_cleaner/View/Dashboard/Home.dart';
import 'package:yopee_cleaner/View/Dashboard/Notification.dart';
import 'package:yopee_cleaner/View/OTP/OtpVerification.dart';
import 'dart:io';
import '../Entity/Responses/AboutUsResponse.dart';
import '../Entity/Responses/DashboardResponse.dart';
import '../Entity/Responses/HelpResponse.dart';
import '../Entity/Responses/JobDetailResponse.dart';
import '../Entity/Responses/JobStatusDoneResponse.dart';
import '../Entity/Responses/Login/SignupResponse.dart';
import '../Entity/Responses/Notification/DeleteNotificationResponse.dart';
import '../Entity/Responses/EarningsResponse.dart';
import '../Entity/Responses/GrossEarningsResponse.dart';
import '../Entity/Responses/Login/loginResponse.dart';
import '../Entity/Responses/LogoutResponse.dart';
import '../Entity/Responses/Notification/NotificationStatusResponse.dart';
import '../Entity/Responses/Otp/ResendOtpResponse.dart';
import '../Entity/Responses/Otp/otpResponse.dart';
import '../Entity/Responses/Profile/ProfileUpdateResponse.dart';
import '../Entity/Responses/Profile/ProfileViewResponse.dart';
import '../Entity/Responses/Notification/ReadNotificationResponse.dart';
import '../Entity/Responses/Notification/UnreadNotificationResponse.dart';
import '../Entity/Responses/ReasonResponse.dart';
import '../Entity/Responses/ReportsListResponse.dart';
import '../Entity/Responses/SpecialRequestListResponse.dart';
import '../Entity/Responses/StatusResponse.dart';
import '../Entity/Responses/UploadPhotoResponse.dart';
import '../Interactor/YopeeRepository.dart';
import '../Router/Routes.dart';
import '../Utility/ColorTheme.dart';
import '../Utility/Environment.dart';
import '../View/Dashboard/dashboard.dart';
import '../View/Login/Login.dart';

class YopeeProvider extends ChangeNotifier {
  bool? _updateValue = false;
  bool? get updateValue => _updateValue;

  void setUpdatedValue(bool value) {
    _updateValue = value;
    notifyListeners();
  }

  int index = 0;
  bool isBottomNavViaHome = false;
  // bool profileUpdateClicked = false;

  // bool get profileUpdateClicked => _profileUpdateClicked;

  // void setEnableButton() {
  //   _profileUpdateClicked = true;
  //   notifyListeners();
  // }
  //
  // void setDisableButton() {
  //   _profileUpdateClicked = false;
  //   notifyListeners();
  // }

  bool _helpUpdateClicked = true;

  bool get helpUpdateClicked => _helpUpdateClicked;

  void setHelpEnableButton() {
    _helpUpdateClicked = true;
    notifyListeners();
  }

  void setHelpDisableButton() {
    _helpUpdateClicked = false;
    notifyListeners();
  }

  bool logoutClicked = false;

  // bool get logoutClicked => _logoutClicked;
  //
  // void setlogoutEnableButton() {
  //   _logoutClicked = true;
  //   notifyListeners();
  // }
  //
  // void setlogoutDisableButton() {
  //   _logoutClicked = false;
  //   notifyListeners();
  // }

  Future<void> navigateToLogin(BuildContext context) async {
    Navigator.of(context).pushNamed(Routes.login);
    notifyListeners();
  }

  Future<void> navigateToOtp(BuildContext context) async {
    // Navigator.of(context).pushNamed(Routes.otp);
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
            OtpVerification(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
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
    notifyListeners();
  }

  Future<void> navigateToDashboard(BuildContext context) async {
    Navigator.of(context).pushNamed(Routes.dashboard);
    notifyListeners();
  }

  Future<void> navigateToHome(BuildContext context) async {
    // Navigator.of(context).pushNamed(Routes.home);
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => AppBottomNav(),
      // transitionsBuilder: (BuildContext context,
      //     Animation<double> animation,
      //     Animation<double> secondaryAnimation,
      //     Widget child) {
      //   return new SlideTransition(
      //     position: new Tween<Offset>(
      //       //Left to right
      //       // begin: const Offset(-1.0, 0.0),
      //       // end: Offset.zero,
      //
      //       //Right to left
      //       begin: const Offset(1.0, 0.0),
      //       end: Offset.zero,
      //
      //       //top to bottom
      //       // begin: const Offset(0.0, -1.0),
      //       // end: Offset.zero,
      //
      //       //   bottom to top
      //       // begin: Offset(0.0, 1.0),
      //       // end: Offset.zero,
      //     ).animate(animation),
      //     child: child,
      //   );
      // }
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: page,
        );
      },
    ));
    notifyListeners();
  }

  Future<void> navigateToProfile(BuildContext context) async {
    Navigator.of(context).pushNamed(Routes.profile);
    notifyListeners();
  }

  bool isLoading = false;
  bool isSuccess = false;
  bool isError = false;
  final yopeeRepo = YopeeRepository();
  String? dropdownvalue;

  bool _isEarningMenu = false;
  bool get isEarningMenu => _isEarningMenu;

  void setEarningMenu(bool value) {
    _isEarningMenu = value;
    notifyListeners();
  }

  TextEditingController _messageController = TextEditingController();

  TextEditingController get messageController => _messageController;
  TextEditingController _messageOwnerController = TextEditingController();

  TextEditingController get messageOwnerController => _messageOwnerController;
  late BuildContext _providerContext;

  BuildContext get providerContext => _providerContext;

  void setProviderContext(BuildContext context) {
    _providerContext = context;
    notifyListeners();
  }

  int bottomSelectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void pageChanged(int index) {
    bottomSelectedIndex = index;
    notifyListeners();
  }

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  TextEditingController _otp1Controller = TextEditingController();
  TextEditingController _otp2Controller = TextEditingController();
  TextEditingController _otp3Controller = TextEditingController();
  TextEditingController _otp4Controller = TextEditingController();

  TextEditingController get otp1Controller => _otp1Controller;

  TextEditingController get otp2Controller => _otp2Controller;

  TextEditingController get otp3Controller => _otp3Controller;

  TextEditingController get otp4Controller => _otp4Controller;

  TextEditingController _profileNameController = TextEditingController();
  TextEditingController _profileEmailAddressController =
      TextEditingController();
  TextEditingController _profilePhoneNumberController = TextEditingController();

  TextEditingController get profileNameController => _profileNameController;

  TextEditingController get profileEmailAddressController =>
      _profileEmailAddressController;
  TextEditingController _profileAddressController = TextEditingController();
  TextEditingController get profilePhoneNumberController =>
      _profilePhoneNumberController;
  TextEditingController get profileAddressController =>
      _profileAddressController;

  TextEditingController _loginPhoneNumberController = TextEditingController();

  TextEditingController get loginPhoneNumberController =>
      _loginPhoneNumberController;

  TextEditingController _helpNameController = TextEditingController();
  TextEditingController _helpEmailAddressController = TextEditingController();
  TextEditingController _helpPhoneNumberController = TextEditingController();
  TextEditingController _helpMessageController = TextEditingController();
  TextEditingController _notGoingMessageController = TextEditingController();

  TextEditingController get helpNameController => _helpNameController;

  TextEditingController get helpEmailAddressController =>
      _helpEmailAddressController;
  TextEditingController _helpAddressController = TextEditingController();
  TextEditingController get helpPhoneNumberController =>
      _helpPhoneNumberController;
  TextEditingController get helpAddressController => _helpAddressController;
  TextEditingController get helpMessageController => _helpMessageController;
  TextEditingController get notGoingMessageController =>
      _notGoingMessageController;

  bool loginClicked = false;
  bool signupClicked = false;

  bool otpClicked = false;

// loginApi
  LoginResponse _objLoginResponse = LoginResponse(data: []);

  LoginResponse get objLoginResponse => _objLoginResponse;

  Future<LoginResponse> getLoginApi(String mobile, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final loginResponse = await yopeeRepo.loginRepo(mobile);
      _objLoginResponse = loginResponse;
      if (_objLoginResponse.status == 200) {
        //   if (_objLoginResponse.data is Map<String, dynamic>) {
        isLoading = false;
        isSuccess = true;
        isError = true;
        notifyListeners();

        if (_objLoginResponse.data.isEmpty) {
          // Fluttertoast.showToast(
          //     msg: "${_objLoginResponse.message}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          // contactToAdministrator(
          //   context,
          // );
          loginClicked = false;
        } else {
          Fluttertoast.showToast(
              msg: "${_objLoginResponse.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          loginPhoneNumberController.clear();
          loginClicked = false;

          if (_objLoginResponse.data.isNotEmpty) {
            navigateToOtp(context);
          }
        }

        print("login api Called Successfully");
        // } else if (_objLoginResponse.data is List<dynamic>) {
        //   isLoading = false;
        //   isSuccess = true;
        //   isError = true;
        //
        //   notifyListeners();
        //
        //   print("login api error");
        //   Fluttertoast.showToast(
        //       msg: "${_objLoginResponse.message}",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.CENTER,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        //   loginClicked = false;
        // }
      } else if (_objLoginResponse.status == 422) {
        Fluttertoast.showToast(
            msg: "${_objLoginResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xffF3CBCB),
            textColor: Colors.red,
            fontSize: 16.0);
      } else if (_objLoginResponse.status == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again.!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xffF3CBCB),
            textColor: Colors.red,
            fontSize: 16.0);
      } else {
        isLoading = false;
        isError = false;
        loginClicked = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      loginClicked = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Network is unreachable!!\nPlease check your internet!.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xffF3CBCB),
          textColor: Colors.red,
          fontSize: 16.0);

      print("Exception:$e");
    }
    return _objLoginResponse;
  }

  //Logout

  LogoutResponse _objLogoutResponse = LogoutResponse(data: []);

  LogoutResponse get objLogoutResponse => _objLogoutResponse;

  Future<LogoutResponse> getLogoutApi(
      String mobile, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      //  notifyListeners();
      final logoutResponse = await yopeeRepo.logoutRepo(mobile);
      _objLogoutResponse = logoutResponse;
      if (_objLogoutResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;
        notifyListeners();

        Fluttertoast.showToast(
            msg: "Logout successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);
        logoutClicked = false;
        Timer(
            const Duration(seconds: 0),
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Login(
                          mobile: '',
                        ))));

        print("logout api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        logoutClicked = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      logoutClicked = false;
      notifyListeners();
      print("Exception:$e");
    }
    return _objLogoutResponse;
  }

  // Otp Verify
  OtpResponse _objOtpResponse = OtpResponse();

  OtpResponse get objOtpResponse => _objOtpResponse;

  Future<OtpResponse> getOtpApi(
      String userId, String otpNumber, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final otpResponse = await yopeeRepo.otpRepo(userId, otpNumber);
      _objOtpResponse = otpResponse;
      if (_objOtpResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        // Fluttertoast.showToast(
        //     msg: "You have logged in successfully with OTP.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        otp1Controller.clear();
        otp2Controller.clear();
        otp3Controller.clear();
        otp4Controller.clear();

        otpClicked = false;

        navigateToHome(context);

        print("otp api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        otpClicked = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      otpClicked = false;
      notifyListeners();
      print("Exception:$e");
    }
    return _objOtpResponse;
  }

  bool isProfileEdit = false;

  //Profile View
  ProfileViewResponse _objProfileViewResponse = ProfileViewResponse(
      data: ProfileViewData(
          id: 0,
          userType: '',
          status: '',
          email: '',
          countryCode: '',
          mobile: 0,
          latitude: '0',
          longitude: '0',
          address: '0',
          accessToken: '',
          pushNotification: 0,
          notifyMonthlyPayment: 0,
          profileImageUrl: '',
          name: ''),
      message: '',
      status: 0);

  ProfileViewResponse get objProfileViewResponse => _objProfileViewResponse;

  Future<ProfileViewResponse> getProfileViewApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final profileViewResponse = await yopeeRepo.profileViewRepo(context);
      _objProfileViewResponse = profileViewResponse;
      if (_objProfileViewResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        Environment.profileName = objProfileViewResponse.data.name.toString();
        Environment.profileEmail = objProfileViewResponse.data.email.toString();

        print("profile view  api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objProfileViewResponse;
  }

  // //Profile update
  // ProfileUpdateResponse _objProfileUpdateResponse = ProfileUpdateResponse();
  //
  // ProfileUpdateResponse get objProfileUpdateResponse =>
  //     objProfileUpdateResponse;
  //
  // Future<ProfileUpdateResponse> getProfileUpdateApi(String name, String email,
  //     String mobile, String address, BuildContext context) async {
  //   try {
  //     isLoading = true;
  //     isError = false;
  //     notifyListeners();
  //     final profileUpdateResponse =
  //         await yopeeRepo.profileUpdateRepo(name, email, mobile, address);
  //     _objProfileUpdateResponse = profileUpdateResponse;
  //     if (_objProfileUpdateResponse.status == 200) {
  //       isLoading = false;
  //       isSuccess = true;
  //       isError = true;
  //
  //       notifyListeners();
  //       Fluttertoast.showToast(
  //           msg: "Profile has been updated successfully.",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: ColorTheme.themeGreenColor,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //
  //       print("profile update api Called Successfully");
  //
  //       Timer(
  //           const Duration(seconds: 2),
  //           () => Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => MyHomePage())));
  //     } else {
  //       isLoading = false;
  //       isError = false;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     isLoading = false;
  //     isError = true;
  //     notifyListeners();
  //     print("Exception:$e");
  //   }
  //   return _objProfileUpdateResponse;
  // }

  //Dashboard
  DashboardResponse _objDashboardResponse = DashboardResponse(
      data: DashboardData(jobRequest: [], userProfile: UserProfile()));

  DashboardResponse get objDashboardResponse => _objDashboardResponse;

  List<DashboardTranscation> dashboardtransactionList = [];

  Future<DashboardResponse> getDashboardApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final dashboardResponse = await yopeeRepo.dashboardRepo(context);
      _objDashboardResponse = dashboardResponse;
      if (_objDashboardResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;
        // dashboardtransactionList = _objDashboardResponse.data.transcations;
        // for (var i = 0; i < dashboardtransactionList.length; i++) {
        //   if (dashboardtransactionList[i].status == "Not Going") {
        //     dashboardtransactionList.removeAt(i);
        //     print(
        //         "dashboardtransactionList:${dashboardtransactionList.length}");
        //   }
        // }

        notifyListeners();

        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objDashboardResponse;
  }

  //Earnings
  EarningsResponse _objEarningsResponse =
      EarningsResponse(data: EarningsData(transcations: []));

  EarningsResponse get objEarningsResponse => _objEarningsResponse;

  Future<EarningsResponse> getEarningsApi(
      String month, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final earningsResponse = await yopeeRepo.earningsRepo(month);
      _objEarningsResponse = earningsResponse;
      if (_objEarningsResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("earnings api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objEarningsResponse;
  }

  // Gross Earnings
  GrossEarningsResponse _objGrossEarningsResponse = GrossEarningsResponse(
      data: GrossEarningsData(transcations: [], totalGrassEarning: 0));

  GrossEarningsResponse get objGrossEarningsResponse =>
      _objGrossEarningsResponse;

  Future<GrossEarningsResponse> getGrossEarningsApi(
      String month, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final grossearningsResponse = await yopeeRepo.grossEarningsRepo(month);
      _objGrossEarningsResponse = grossearningsResponse;
      if (_objGrossEarningsResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("gross earnings api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objGrossEarningsResponse;
  }

  // Payment Details
  PaymentDetailsResponse _objPaymentDetailsResponse = PaymentDetailsResponse(
      data: PaymentDetailsData(
          transcation: TranscationData(
              userAddress: PaymentUserAddress(),
              userVehicle: PaymentUserVehicle(
                  brand: PaymentBrand(),
                  model: PaymentBrand(),
                  vehicle: PaymentBrand()),
              user: PaymentUser())));

  PaymentDetailsResponse get objPaymentDetailsResponse =>
      _objPaymentDetailsResponse;

  Future<PaymentDetailsResponse> getPaymentDetailsApi(
      String id, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final paymentDetailsResponse = await yopeeRepo.paymentDetailsRepo(id);
      _objPaymentDetailsResponse = paymentDetailsResponse;
      if (_objPaymentDetailsResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("Payment Details api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objPaymentDetailsResponse;
  }

  List<PlatformFile>? _paths;
  static var dio = Dio();
  var file = "";
  String _uploadFileName = "";

  String get uploadFileName => _uploadFileName;

  // XFile? image;

  final ImagePicker picker = ImagePicker();

  XFile? image;

  Future pickImages(ImageSource media) async {
    try {
      image = await picker.pickImage(source: media);
      //if (image == null) return;

      //image = pickImage;

      var uploadImageUrl = Environment.baseUrl + Environment.uploadPhotoUrl;
      uploadImage(image, uploadImageUrl);
      notifyListeners();
      // FilePickerResult? imageResult = await FilePicker.platform.pickFiles(
      //   allowMultiple: true,
      //   type: FileType.custom,
      //   allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg'],
      // );
      //
      // print("imageResult:${imageResult.files.}")
      // if (imageResult != null) {
      //   List files = imageResult.paths
      //       .map((path) => MultipartFile.fromFileSync(
      //             path.toString(),
      //             filename: imageResult.paths.split("/").last,
      //             contentType: MediaType('image')
      //
      //           ))
      //       .toList();
      //   var dio = Dio();
      //   var formData = FormData.fromMap({
      //     'profile_image': files,
      //   });
      //   var response = await dio.post(uploadImageUrl, data: formData);
      //
      //   if (response.statusCode == 200) {
      //     isLoading = false;
      //     isSuccess = true;
      //     isError = true;
      //     notifyListeners();
      //
      //     Fluttertoast.showToast(
      //         msg: "Image Uploaded Successfully",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         backgroundColor: ColorTheme.themeGreenColor,
      //         textColor: Colors.white,
      //         fontSize: 16.0);
      //
      //     print("upload api Called Successfully");
      //     // it's uploaded
      //   }
      // } else {
      //   // User canceled the picker
      // }
      // notifyListeners();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<UploadPhotoResponse> uploadImage(
      XFile? file, String uploadImageUrl) async {
    UploadPhotoResponse uploadPhotoResponse = UploadPhotoResponse();
    String fileName = file!.path.split('/').last;
    print("filnename:$fileName");
    FormData formData = FormData.fromMap({
      "profile_image":
          await MultipartFile.fromFile(file.path, filename: fileName),
    });
    var response = await dio.post(
      uploadImageUrl,
      data: formData,
      options: Options(
          headers: {"Authorization": "Bearer ${Environment.accessToken}"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    if (response.statusCode == 200) {
      uploadPhotoResponse = UploadPhotoResponse.fromJson(response.data);
      Fluttertoast.showToast(
          msg: "Image Uploaded Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: ColorTheme.themeGreenColor,
          textColor: Colors.white,
          fontSize: 16.0);

      print("upload api Called Successfully");
    }
    return uploadPhotoResponse;
  }

  String uploadedFileName = "";
  PlatformFile? uploadedfile;

  Future<void> pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    uploadedfile = result.files.first;
    print("picked File:$uploadedfile");
    uploadedFileName = uploadedfile!.name;
    print("picked uploadedFileName:$uploadedFileName");
    notifyListeners();
  }

  File? documentImage;
  String uploadedProfileName = "";

  Future<void> pickDocumentImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      documentImage = File(pickedFile.path);
      uploadedProfileName = documentImage!.path.split('/').last;
      notifyListeners();
    }
  }

  File? signupdocumentImage;
  String uploadedsignupName = "";

  Future<void> signuppickDocumentImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      signupdocumentImage = File(pickedFile.path);
      uploadedsignupName = signupdocumentImage!.path.split('/').last;
      notifyListeners();
    }
  }

  //Profile Update
  Future<ProfileUpdateResponse> profileUpdateApi(
      String name,
      String email,
      String mobile,
      String address,
      //  String imagePath,
      BuildContext context) async {
    //image = await picker.pickImage(source: media);
    // String fileName = image!.path.split('/').last;
    // print("filnename:$fileName");
    ProfileUpdateResponse objProfileUpdateResponse = ProfileUpdateResponse();
    String profileUpdateUrl =
        Environment.baseUrl + Environment.updateProfileUrl;
    print("profile update url:${profileUpdateUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> profileUpdateParams = {
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address
      };

      var request = http.MultipartRequest('POST', Uri.parse(profileUpdateUrl));

      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['address'] = address;
      request.headers.addAll(headers);

      // final path = await FilePicker.platform.pickFiles(allowMultiple: true);
      // String? filePath = path?.files.single.path;

      //  print("filePath:$filePath");

      if (documentImage != null) {
        String filename = documentImage!.path.split('/').last;

        request.files.add(await http.MultipartFile.fromPath(
            'document_image', documentImage!.path,
            filename: filename));
      }

      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("profile update statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objProfileUpdateResponse =
            ProfileUpdateResponse.fromJson(jsonDecode(res.body));

        print("objsignupResponse:${objProfileUpdateResponse.data}");

        Fluttertoast.showToast(
            msg: "Profile has been updated successfully.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("profile update api Called Successfully");
        // profileUpdateClicked = false;

        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AppBottomNav())));
        return objProfileUpdateResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objProfileUpdateResponse;
  }

  //Signup
  Future<SignUpResponse> signUpApi(
      String name,
      String email,
      String mobile,
      String address,
      //  String imagePath,
      BuildContext context) async {
    //image = await picker.pickImage(source: media);
    // String fileName = image!.path.split('/').last;
    // print("filnename:$fileName");
    SignUpResponse objSignUpResponse = SignUpResponse(data: SignUpData());
    String signUpUrl = Environment.baseUrl + Environment.signupUrl;
    print("SignUp url:${signUpUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> profileUpdateParams = {
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address
      };

      var request = http.MultipartRequest('POST', Uri.parse(signUpUrl));

      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['address'] = address;
      request.headers.addAll(headers);

      // final path = await FilePicker.platform.pickFiles(allowMultiple: true);
      // String? filePath = path?.files.single.path;

      //  print("filePath:$filePath");

      if (signupdocumentImage != null) {
        String filename = signupdocumentImage!.path.split('/').last;

        request.files.add(await http.MultipartFile.fromPath(
            'document_image', signupdocumentImage!.path,
            filename: filename));
      }

      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("profile update statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objSignUpResponse = SignUpResponse.fromJson(jsonDecode(res.body));

        print("objSignUpResponse:${objSignUpResponse.data}");

        Fluttertoast.showToast(
            msg: "Signup Successful. Please login with your credentials!.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("signup api Called Successfully");

        signupNameController.clear();
        signupPhoneNumberController.clear();
        signupEmailAddressController.clear();
        signupAddressController.clear();
        signupClicked = false;

        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Login(mobile: objSignUpResponse.data.mobile.toString()))));

        return objSignUpResponse;
      } else if (statusCode == 500) {}
    } catch (e) {
      throw Exception(e);
    }
    return objSignUpResponse;
  }

  bool _markAll = false;
  bool get markAll => _markAll;
  void setMarkAllNotification(bool value) {
    _markAll = value;
    notifyListeners();
  }

  //Read Notification

  ReadNotificationResponse _objReadNotificationResponse =
      ReadNotificationResponse();
  ReadNotificationResponse get objReadNotificationResponse =>
      _objReadNotificationResponse;

  Future<ReadNotificationResponse> getReadNotificationApi(
      String id, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final readNotificationResponse =
          await yopeeRepo.readNotificationRepo(id, context);
      _objReadNotificationResponse = readNotificationResponse;
      if (_objReadNotificationResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        getListNotificationApi("", context);
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("Read Notification api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //     () => Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => NotificationScreen())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objReadNotificationResponse;
  }

  //Delete Notification

  DeleteNotificationResponse _objDeleteNotificationResponse =
      DeleteNotificationResponse();
  DeleteNotificationResponse get objDeleteNotificationResponse =>
      _objDeleteNotificationResponse;

  Future<DeleteNotificationResponse> getDeleteNotificationApi(
      String receiverId, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final deleteNotificationResponse =
          await yopeeRepo.deleteNotificationRepo(receiverId, context);
      _objDeleteNotificationResponse = deleteNotificationResponse;
      if (_objDeleteNotificationResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        getListNotificationApi("", context);
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("Delete Notification api Called Successfully");

        Timer(
            const Duration(seconds: 2),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppBottomNav())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objDeleteNotificationResponse;
  }

  //List Notification

  bool _isUnreadNotificationVisible = false;
  bool get isUnreadNotificationVisible => _isUnreadNotificationVisible;

  void setUnreadNotificationVisibility(bool value) {
    _isUnreadNotificationVisible = value;
    notifyListeners();
  }

  String? _receiverId;
  String? get receiverId => _receiverId;

  UnreadNotificationResponse _objListNotificationResponse =
      UnreadNotificationResponse(data: [], message: '', status: 0);
  UnreadNotificationResponse get objListNotificationResponse =>
      _objListNotificationResponse;

  Future<UnreadNotificationResponse> getListNotificationApi(
      String status, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final listNotificationResponse =
          await yopeeRepo.listNotificationRepo(status, context);
      _objListNotificationResponse = listNotificationResponse;
      if (_objListNotificationResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("List Notification api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objListNotificationResponse;
  }

  // Notification Status

  NotificationStatusResponse _objNotificationStatusResponse =
      NotificationStatusResponse(data: NotificationData());
  NotificationStatusResponse get objNotificationStatusResponse =>
      _objNotificationStatusResponse;

  Future<NotificationStatusResponse> getNotificationStatusApi(
      String pushNotification, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      // notifyListeners();
      final notificationStatusResponse =
          await yopeeRepo.notificationStatusRepo(pushNotification, context);
      _objNotificationStatusResponse = notificationStatusResponse;
      if (_objNotificationStatusResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        // getListNotificationApi("", context);

        // _objNotificationStatusResponse.data.pushNotification == "0"
        //     ? Fluttertoast.showToast(
        //         msg: "Notification is Off.",
        //         toastLength: Toast.LENGTH_SHORT,
        //         gravity: ToastGravity.CENTER,
        //         timeInSecForIosWeb: 1,
        //         backgroundColor: Colors.red,
        //         textColor: Colors.white,
        //         fontSize: 16.0)
        //     : Fluttertoast.showToast(
        //         msg: "Notification is On.",
        //         toastLength: Toast.LENGTH_SHORT,
        //         gravity: ToastGravity.CENTER,
        //         timeInSecForIosWeb: 1,
        //         backgroundColor: ColorTheme.themeGreenColor,
        //         textColor: Colors.white,
        //         fontSize: 16.0);

        print("Notification Status api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objNotificationStatusResponse;
  }

  //Help

  HelpResponse _objHelpResponse = HelpResponse(data: HelpData());
  HelpResponse get objHelpResponse => _objHelpResponse;

  Future<HelpResponse> getHelpApi(String name, String email, String mobile,
      String message, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      // notifyListeners();
      final helpResponse =
          await yopeeRepo.helpRepo(name, email, mobile, message, context);
      _objHelpResponse = helpResponse;
      if (_objHelpResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        Fluttertoast.showToast(
            msg: "User Help has been created successfully.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("Help api Called Successfully");

        helpMessageController.clear();

        Timer(
            const Duration(seconds: 1),
            () => Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AppBottomNav(),
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
                )));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objHelpResponse;
  }

  //Reports List
  ReportsListResponse _objReportsListResponse = ReportsListResponse(data: []);

  ReportsListResponse get objReportsListResponse => _objReportsListResponse;

  Future<ReportsListResponse> getReportsListApi(
      String month, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final reportsListResponse =
          await yopeeRepo.reportsListRepo(month, context);
      _objReportsListResponse = reportsListResponse;
      if (_objReportsListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        print("reports list api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objReportsListResponse;
  }

  //Reports Detail
  JobDetailResponse _objReportsDetailResponse = JobDetailResponse(
      data: JobDetailData(
          rateWashlists: [],
          bookingDetails: BookingDetails(
            user: JobDetailCleaner(),
            userVehicle: JobDetailUserVehicle(
              brand: JobDetailSubscription(),
              model: JobDetailSubscription(),
              vehicle: JobDetailSubscription(),
            ),
            userAddress: JobDetailUserAddress(),
            cleaner: JobDetailCleaner(),
            media: [],
            subscription: JobDetailSubscription(),
            transaction: JobDetailTransaction(),
            service: JobDetailService(),
            status: '',
            actionImageUrl: '',
          )));

  JobDetailResponse get objReportsDetailResponse => _objReportsDetailResponse;

  Future<JobDetailResponse> getReportsDetailApi(
      String bookingId, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final reportsDetailResponse =
          await yopeeRepo.reportsDetailRepo(bookingId, context);
      _objReportsDetailResponse = reportsDetailResponse;
      if (_objReportsDetailResponse.status == 200) {
        if (_objReportsDetailResponse.data.bookingDetails.subscription
                is Map<String, dynamic> &&
            _objReportsDetailResponse
                .data.bookingDetails.subscription.isNotEmpty) {
          isLoading = false;
          isSuccess = true;
          isError = true;

          notifyListeners();
          // Fluttertoast.showToast(
          //     msg: "${_objReportsDetailResponse.message}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: ColorTheme.themeGreenColor,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          // subsAddClicked = false;
          print("job status reports  api Called Successfully");

          // Timer(
          //     const Duration(seconds: 1),
          //         () => Navigator.of(context).push(PageRouteBuilder(
          //       transitionDuration: const Duration(milliseconds: 400),
          //       pageBuilder: (context, animation, secondaryAnimation) =>
          //           Dashboard(),
          //       // transitionsBuilder: (BuildContext context,
          //       //     Animation<double> animation,
          //       //     Animation<double> secondaryAnimation,
          //       //     Widget child) {
          //       //   return new SlideTransition(
          //       //     position: new Tween<Offset>(
          //       //       //Left to right
          //       //       begin: const Offset(-1.0, 0.0),
          //       //       end: Offset.zero,
          //       //
          //       //       //Right to left
          //       //       // begin: const Offset(1.0, 0.0),
          //       //       // end: Offset.zero,
          //       //
          //       //       //top to bottom
          //       //       // begin: const Offset(0.0, -1.0),
          //       //       // end: Offset.zero,
          //       //
          //       //       //   bottom to top
          //       //       // begin: Offset(0.0, 1.0),
          //       //       // end: Offset.zero,
          //       //     ).animate(animation),
          //       //     child: child,
          //       //   );
          //       // }
          //       transitionsBuilder:
          //           (context, animation, secondaryAnimation, page) {
          //         var begin = 0.0;
          //         var end = 1.0;
          //         var curve = Curves.ease;
          //
          //         var tween = Tween(begin: begin, end: end)
          //             .chain(CurveTween(curve: curve));
          //         return ScaleTransition(
          //           scale: animation.drive(tween),
          //           child: page,
          //         );
          //       },
          //     ))
          //
          //   // Navigator.push(
          //   // context, MaterialPageRoute(builder: (context) => Dashboard()))
          //
          // );
        } else if (_objReportsDetailResponse.data.bookingDetails.service
                is Map<String, dynamic> &&
            _objReportsDetailResponse.data.bookingDetails.service.isNotEmpty) {
          isLoading = false;
          isSuccess = true;
          isError = true;

          notifyListeners();
          // Fluttertoast.showToast(
          //     msg: "${_objReportsDetailResponse.message}",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: ColorTheme.themeGreenColor,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          // subsAddClicked = false;
          print("job status reports  api Called Successfully");

          // Timer(
          //     const Duration(seconds: 1),
          //         () => Navigator.of(context).push(PageRouteBuilder(
          //       transitionDuration: const Duration(milliseconds: 400),
          //       pageBuilder: (context, animation, secondaryAnimation) =>
          //           Dashboard(),
          //       // transitionsBuilder: (BuildContext context,
          //       //     Animation<double> animation,
          //       //     Animation<double> secondaryAnimation,
          //       //     Widget child) {
          //       //   return new SlideTransition(
          //       //     position: new Tween<Offset>(
          //       //       //Left to right
          //       //       begin: const Offset(-1.0, 0.0),
          //       //       end: Offset.zero,
          //       //
          //       //       //Right to left
          //       //       // begin: const Offset(1.0, 0.0),
          //       //       // end: Offset.zero,
          //       //
          //       //       //top to bottom
          //       //       // begin: const Offset(0.0, -1.0),
          //       //       // end: Offset.zero,
          //       //
          //       //       //   bottom to top
          //       //       // begin: Offset(0.0, 1.0),
          //       //       // end: Offset.zero,
          //       //     ).animate(animation),
          //       //     child: child,
          //       //   );
          //       // }
          //       transitionsBuilder:
          //           (context, animation, secondaryAnimation, page) {
          //         var begin = 0.0;
          //         var end = 1.0;
          //         var curve = Curves.ease;
          //
          //         var tween = Tween(begin: begin, end: end)
          //             .chain(CurveTween(curve: curve));
          //         return ScaleTransition(
          //           scale: animation.drive(tween),
          //           child: page,
          //         );
          //       },
          //     ))
          //
          //   // Navigator.push(
          //   // context, MaterialPageRoute(builder: (context) => Dashboard()))
          //
          // );
        }
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objReportsDetailResponse;
  }

  List<File> selectedRateWashImages = [];

  Future getRateWashImages(ImageSource camera) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedRateWashImages.add(File(xfilePick[i].path));
        notifyListeners();
      }
    }
  }

  bool isRateWashSubmit = false;

  List<MultipartFile> newList = [];

  // Future<RateWashResponse> getRateWashApi(String bookingId, String icon,
  //     String rating, String feedback, BuildContext context) async {
  //   RateWashResponse objRateWashResponse = RateWashResponse(
  //       data: RateWashDataItems(icon: '', rating: '', feedback: '', media: []));
  //   String rateWashUrl = Environment.baseUrl + Environment.rateWashUrl;
  //   print("RateWash url:${rateWashUrl}");
  //   try {
  //     final headers = {
  //       // 'Charset': 'utf-8',
  //       'Authorization': 'Bearer ${Environment.accessToken}'
  //     };
  //     Map<String, dynamic> rateWashParams = {
  //       "booking_id": bookingId,
  //       "icon": icon,
  //       "rating": rating,
  //       "feedback": feedback
  //     };
  //
  //     var request = http.MultipartRequest('POST', Uri.parse(rateWashUrl));
  //
  //     request.fields['booking_id'] = bookingId;
  //     request.fields['icon'] = icon;
  //     request.fields['rating'] = rating;
  //     request.fields['feedback'] = feedback;
  //     request.headers.addAll(headers);
  //
  //     // if (image != null) {
  //     //   request.files.add(
  //     //       await http.MultipartFile.fromPath('document[]', uploadFileName));
  //     // }
  //
  //     for (int i = 0; i < selectedRateWashImages.length; i++) {
  //       final f = await http.MultipartFile.fromPath(
  //           'document[]', selectedRateWashImages[i].path);
  //       request.files.add(f);
  //     }
  //
  //     printRateWashParams(request);
  //     // var body = profileUpdateParams;
  //     // final encoding = Encoding.getByName('utf-8');
  //
  //     // print("profileUpdateParams :$body ");
  //
  //     // final response = await http.post(Uri.parse(profileUpdateUrl),
  //     //     body: body, headers: headers);
  //
  //     final response = await request.send();
  //     var res = await http.Response.fromStream(response);
  //
  //     // print("profile update body:${response.body}");
  //
  //     int statusCode = res.statusCode;
  //     print("rate wash statusCode: ${res.statusCode}");
  //
  //     if (statusCode == 200) {
  //       // var data = await jsonDecode(response.body);
  //       // print("profileupdate_data:$data");
  //       objRateWashResponse = RateWashResponse.fromJson(jsonDecode(res.body));
  //
  //       print("objRateWashResponse:${objRateWashResponse.data}");
  //       isLoading = false;
  //       isSuccess = true;
  //       isError = true;
  //
  //       notifyListeners();
  //       isRateWashSubmit = false;
  //
  //       Fluttertoast.showToast(
  //           msg: "Rating submitted successfully.",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: ColorTheme.themeGreenColor,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //
  //       print("Rating submitted Successfully");
  //
  //       Timer(
  //           const Duration(seconds: 1),
  //               () => Navigator.push(
  //               context, MaterialPageRoute(builder: (context) => Reports())));
  //       return objRateWashResponse;
  //     } else if (statusCode == 500) {
  //       isLoading = false;
  //       isError = false;
  //       isRateWashSubmit = false;
  //       notifyListeners();
  //
  //       Fluttertoast.showToast(
  //           msg: "Something went wrong.Please try again!!",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   } catch (e) {
  //     isLoading = false;
  //     isError = true;
  //     isRateWashSubmit = false;
  //     notifyListeners();
  //     print("Exception:$e");
  //   }
  //   return objRateWashResponse;
  // }

  //Status
  StatusResponse _objStatusResponse = StatusResponse(data: []);

  StatusResponse get objStatusResponse => _objStatusResponse;

  Future<StatusResponse> getStatusApi(String jobId, String status,
      String actionReason, String actionMessage, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final statusResponse = await yopeeRepo.statusRepo(
          jobId, status, actionReason, actionMessage, context);
      _objStatusResponse = statusResponse;
      if (_objStatusResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        Fluttertoast.showToast(
            msg: "${_objStatusResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);
        //dropdownvalue = "";

        Timer(
            const Duration(seconds: 1),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppBottomNav())));

        print("status api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objStatusResponse;
  }

  //Reason
  ReasonResponse _objReasonResponse = ReasonResponse(data: []);
  List<String> reasonItemlist = [];
  ReasonResponse get objReasonResponse => _objReasonResponse;

  Future<ReasonResponse> getReasonApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final reasonResponse = await yopeeRepo.reasonRepo(context);
      _objReasonResponse = reasonResponse;
      if (_objReasonResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        reasonItemlist = _objReasonResponse.data;

        print("reason Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objReasonResponse;
  }

  int currentBottomBarIndex = 0;

  bool isSpecialRequest = false;

  //Special Request  List
  SpecialRequestListResponse _objSpecialRequestListResponse =
      SpecialRequestListResponse(data: [], message: '', status: 0);

  SpecialRequestListResponse get objSpecialRequestListResponse =>
      _objSpecialRequestListResponse;

  Future<SpecialRequestListResponse> getSpecialRequestListApi(
      String month, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final specialRequestListResponse =
          await yopeeRepo.specialReqListRepo(month, context);
      _objSpecialRequestListResponse = specialRequestListResponse;
      if (_objSpecialRequestListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        print("Special Request list api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objSpecialRequestListResponse;
  }

  int? _accountDetailsKey = 0;
  int? get accountDetailsKey => _accountDetailsKey;
  void setProfileAccountDetails(int? value) {
    _accountDetailsKey = value;
    notifyListeners();
  }

  String? _carName;
  String? get carName => _carName;

  void getCarName(String? value) {
    _carName = value;
    notifyListeners();
  }

  String? _regNumber;
  String? get regNumber => _regNumber;
  void getRegNumber(String? value) {
    _regNumber = value;
    notifyListeners();
  }

  String? _fullMessage;
  String? get fullMessage => _fullMessage;
  void getfullMessage(String? value) {
    _fullMessage = value;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();
  String _date = "";
  String get date => _date;
  void setDate(String date) {
    _date = date;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String reportDate = DateFormat("yyyy-MM-dd").format(selectedDate);
      _date = DateFormat("dd MMM, yyyy").format(selectedDate);

      setDate(_date);
      print("date:$date");
      getReportsListApi(reportDate, context);
      notifyListeners();
    }
  }

  DateTime selectedDateSpclReq = DateTime.now();
  String _dateSpclReq = "";
  String get dateSpclReq => _dateSpclReq;
  void setDateSpclReq(String date) {
    _dateSpclReq = date;
    notifyListeners();
  }

  Future<void> selectDateSpclReq(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateSpclReq,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDateSpclReq) {
      selectedDateSpclReq = picked;
      String reportDateSpclReq =
          DateFormat("yyyy-MM-dd").format(selectedDateSpclReq);
      _dateSpclReq = DateFormat("dd MMM, yyyy").format(selectedDateSpclReq);

      setDate(_dateSpclReq);
      print("date:$dateSpclReq");
      getSpecialRequestListApi(reportDateSpclReq, context);
      notifyListeners();
    }
  }

  // Initial Selected Value
  String? _monthdropdownvalue = DateFormat('MMMM').format(DateTime.now());
  String? get monthdropdownvalue => _monthdropdownvalue;
  void setMonthDropDown(String? value) {
    _monthdropdownvalue = value;
    notifyListeners();
  }

  // Initial Selected Value
  String? _monthEarningdropdownvalue =
      DateFormat('MMMM').format(DateTime.now());
  String? get monthEarningdropdownvalue => _monthEarningdropdownvalue;
  void setMonthEarningDropDown(String? value) {
    _monthEarningdropdownvalue = value;
    notifyListeners();
  }

  String _aboutUsDesc = "";
  String? get aboutUsDesc => _aboutUsDesc;

  void setAboutUs(String value) {
    _aboutUsDesc = value;
    notifyListeners();
  }

  //About Us
  AboutUsResponse _objAboutUsResponse = AboutUsResponse(
    message: '',
    status: 0,
    data: AboutUsdata(slug: '', tittle: '', description: ''),
  );

  AboutUsResponse get objAboutUsResponse => _objAboutUsResponse;

  Future<AboutUsResponse> getAboutUsApi(
      String slug, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final aboutUsResponse = await yopeeRepo.aboutUsRepo(slug, context);
      _objAboutUsResponse = aboutUsResponse;
      if (_objAboutUsResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        print("about us api Called Successfully");

        _aboutUsDesc = _objAboutUsResponse.data.description.toString();
        print("aboutUsDesc:$_aboutUsDesc");

        // Timer(
        //     const Duration(seconds: 1),
        //     () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => MoreMenu())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objAboutUsResponse;
  }

  contactToAdministrator(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                width: 250,
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // width: double.infinity,
                          // decoration: BoxDecoration(
                          //   color: ColorTheme.themeWhiteColor,
                          //   borderRadius: BorderRadius.circular(
                          //     5.00,
                          //   ),
                          // ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 18, top: 14, right: 18, bottom: 20),
                                child: Text(
                                  " No longer active.!!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontFamily: 'SemiBold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                //  width: 152.00,
                                margin: EdgeInsets.only(
                                  left: 18,
                                  top: 3,
                                  right: 18,
                                ),
                                child: Text(
                                  "Please contact your Administrator.",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  List<File> images = [];
  List<File> selectedWashImages = [];

  Future getWashImages(ImageSource source) async {
    final pickedFile = await picker.pickImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000, source: source);
    XFile? xfilePick = pickedFile;

    // if (xfilePick!.isNotEmpty) {
    //  for (var i = 0; i < xfilePick.length; i++) {
    selectedWashImages.add(File(xfilePick!.path));
    notifyListeners();
    //}
    // }
  }

  bool isJobStatusDoneSubmit = false;

  List<MultipartFile> newJobStatusDoneList = [];
  //Job Status Done
  Future<JobStatusDoneResponse> jobStatusDoneApi(
      String jobId, String status, String message, BuildContext context) async {
    JobStatusDoneResponse objJobStatusDoneResponse =
        JobStatusDoneResponse(data: JobStatusDoneData());
    String statusDoneUrl = Environment.baseUrl + Environment.statusDoneUrl;
    print("jobStatusDone url:${statusDoneUrl}");
    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> rateWashParams = {
        "job_id": jobId,
        "status": status,
        "message": message,
      };

      var request = http.MultipartRequest('POST', Uri.parse(statusDoneUrl));

      request.fields['job_id'] = jobId;
      request.fields['status'] = status;
      request.fields['message'] = message;

      request.headers.addAll(headers);

      // if (image != null) {
      //   request.files.add(
      //       await http.MultipartFile.fromPath('document[]', uploadFileName));
      // }

      for (int i = 0; i < selectedWashImages.length; i++) {
        final f = await http.MultipartFile.fromPath(
            'action_image', selectedWashImages[i].path);
        request.files.add(f);
      }

      printJobStatusDoneParams(request);
      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("job status done statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objJobStatusDoneResponse =
            JobStatusDoneResponse.fromJson(jsonDecode(res.body));

        print("objJobStatusDoneResponse:${objJobStatusDoneResponse.data}");
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // isJobStatusDoneSubmit = false;

        Fluttertoast.showToast(
            msg: "${objJobStatusDoneResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("Job Status DOne api  submitted Successfully");

        Timer(
            const Duration(seconds: 1),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppBottomNav())));

        messageOwnerController.clear();
        selectedWashImages = [];
        return objJobStatusDoneResponse;
      } else if (statusCode == 500) {
        isLoading = false;
        isError = false;
        // isJobStatusDoneSubmit = false;
        notifyListeners();

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
      isLoading = false;
      isError = true;
      // isJobStatusDoneSubmit = false;
      notifyListeners();
      print("Exception:$e");
    }
    return objJobStatusDoneResponse;
  }

  void printJobStatusDoneParams(http.MultipartRequest request) {
    request.fields.forEach((key, value) {
      print("Job Status DOne Params $key:$value");
    });
  }

  TextEditingController _signupNameController = TextEditingController();
  TextEditingController _signupEmailAddressController = TextEditingController();
  TextEditingController _signupPhoneNumberController = TextEditingController();

  TextEditingController get signupNameController => _signupNameController;

  TextEditingController get signupEmailAddressController =>
      _signupEmailAddressController;
  TextEditingController _signupAddressController = TextEditingController();
  TextEditingController get signupPhoneNumberController =>
      _signupPhoneNumberController;
  TextEditingController get signupAddressController => _signupAddressController;

  //Resend Otp
  ResendOtpResponse _objResendOtpResponse =
      ResendOtpResponse(data: [], message: '', status: 0);

  ResendOtpResponse get objResendOtpResponse => _objResendOtpResponse;
  Future<ResendOtpResponse> getResendOtpApi(
      String mobileNumber, BuildContext context) async {
    String resendotpUrl = Environment.baseUrl + Environment.resendOtpUrl;
    print("ResendOtp url:${resendotpUrl}");
    try {
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> resendOtPParams = {
        "mobile": mobileNumber,
        "country_code": "+91"
      };
      // final encoding = Encoding.getByName('utf-8');

      print("resendOtPParams:$resendOtPParams");

      final response = await http.post(
        Uri.parse(resendotpUrl),
        body: resendOtPParams,
        //encoding: encoding,
      );

      print("resend body:${response.body}");

      int statusCode = response.statusCode;
      print("Resend statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        _objResendOtpResponse =
            ResendOtpResponse.fromJson(jsonDecode(response.body));
        // Environment.loginMobileNumber =
        //     objLoginResponse.data!.mobile.toString();
        // print("Login Mobile Number:${Environment.loginMobileNumber}");
        Fluttertoast.showToast(
            msg: "${_objResendOtpResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        return _objResendOtpResponse;
      }
    } catch (e) {
      throw Exception(e);
    }
    return _objResendOtpResponse;
  }
}
