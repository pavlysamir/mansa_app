class EndPoint {
  static String baseUrl = "https://iktsar.onrender.com/";

  static String login = "user/login";
  static String signUp = "user/";

  static const String contentType = 'application/json';
  static String verifyforgetPasswordOtp = "user/verify-otp";
  static String forgotPassword = "user/forgetpass";
  static String changeForgetPassword = "/Auth/change-forget-password";
  static String verfyAccount = "user/verify-account";

  static String resetPassword = "user/reset";

  static String getUserDataEndPoint(id) {
    return "/User/$id";
  }

  static String confirnSubscribeEndPoint(refId) {
    return "/plans/subscribe/confirmPayment/$refId";
  }

  static String plans = "/plans";
  static String contactUs = "/contactUs";
  static String promocode = "/promocode";

  static String changePassword = "/Auth/change-password";
  static String mySubscraption = "/plans/mySubscribtions";

  // static String mySubscraption(id) {
  //   return "/plans/mySubscribtions/$id";
  // }

  //   static String getPlaneDataEndPoint(padgeNumber,) {
  //   return "/plans/$id";
  // }
  //
  //https://post-bet.onrender.com/plans/mySubscribtions
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "message";
  static String errors = "errors";
  static String email = "email";
  static String password = "password";
  static String mobNumber = "mobileNumber";
  static String otp = "OTP";
  static String newForgetPassword = "newPass";
  static String token = "token";

  static String id = "id";
  static String firstName = "firstName";
  static String lastName = "lastName";

  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profileImage";
  static String authorizationHeader = "Authorization";
  static String verfyAccount = "verfyAccount";
  static String oldPassword = "oldPassword";
  static String newPassword = "newPassword";
  static String promoCode = "promoCode";
  static String planId = "planId";
  static String profileKey = "profileKey";

  static String refId = "refId";
  static String chargeId = "chargeId";
  static String transactionUrl = "transactionUrl";
  static String plan = "plan";
  static String mySubscribeId = "subscrabtionId";
  static String limitNumberOfPostsPerDay = "limitNumberOfPostsPerDay";
}
