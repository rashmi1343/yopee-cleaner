class Environment {
  static String accessToken = "";
  static String loginMobileNumber = "";
  static String userCategory = "";
  static String userDocVerification = "";
  static int selectedIndex = 0;
  static String profileName = "";
  static String profileEmail = "";
  static int? accountDetails = 0;
  static String notificationStatus = "0";
  static const String baseUrl =
      "https://binarymetrix-staging.com/yopee/public/api/";

  static const String loginUrl = "cleaner/login";
  static const String signupUrl = "cleaner/signup";
  static const String logoutUrl = "otp/logout";
  static const String otpVerifyUrl = "customer/verify";
  static const String resendOtpUrl = "cleaner/resendOtp";
  static const String dashboardUrl = "cleaner/dashboard";
  static const String updateProfileUrl = "cleaner/update-account-details";
  static const String earningUrl = "cleaner/earning";
  static const String grossEarningUrl = "cleaner/gross-earning";
  static const String paymentDetailsUrl = "cleaner/payment-details";
  //For Profile
  static const String profileViewUrl = "user/profile";
  static const String profileUpdateUrl = "user/update-profile";

  //For About us
  static const String aboutUsUrl = "setting/cms";

  //For uploading photo
  static const String uploadPhotoUrl = "user/update-photo";

  //For notification
  static const String readNotificationUrl = "notifications/read";
  static const String deleteNotificationUrl = "notifications/delete";
  static const String listNotificationUrl = "notifications";
  static const String notificationStatusUrl = "user/notification-button";
  //For Help
  static const String helpUrl = "customer/user-help";

  //For reports list
  static const String reportsListUrl = "user/user-report-list";
  static const String reportsDetailUrl = "user/user-rate-wash-list";

  static const String statusUrl = "cleaner/action";
  static const String statusDoneUrl = "cleaner/action_done";
  static const String reasonUrl = "customer/reasons";
  //For Special Request
  static const String specialRequestListUrl = "cleaner/special-request-list";
}
