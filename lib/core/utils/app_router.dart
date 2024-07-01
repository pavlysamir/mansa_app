import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kHomeLayout = '/HomeLayout';

  static const kOnBoarding = '/OnBoardingScreen';
  static const kRegistretion = '/RegistretionScreen';
  static const kLogin = '/LoginScreen';
  static const kForgotPassword = '/ForgotPasswordScreen';
  static const kAddNewPassword = '/AddNEWPasswordScreen';
  static const kVerifyEmail = '/VerifyEmailScreen';
  static const kOtpView = '/OtpView';
  static const kOtpForgetPass = '/OtpForgetPass';
  static const kDonePassword = '/DonePassword';
  static const kHomeScreen = '/HomeScreen';
  static const kServicesScreen = '/ServicesScreen';
  static const kSettingScreen = '/SettingScreen';
  static const kResetPasswordScreen = '/ResetPasswordScreen';
  static const kChooseRideScreen = '/ChooseRideScreen';

  static final router = GoRouter(
      initialLocation:
          //kHomeLayOut,
          // getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token) !=
          //         null
          //     ? kHomeLayOut
          //     : getIt
          //                 .get<CashHelperSharedPreferences>()
          //                 .getData(key: 'onBoarding') ==
          //             true
          //         ? kLogin
          //         :
          kHomeLayout,
      routes: [
        // GoRoute(
        //   path: kHomeLayout,
        //   builder: (context, state) => const HomeLayout(),
        // ),
      ]);
}
