import 'package:go_router/go_router.dart';
import 'package:mansa_app/features/authentication/presentation/views/first_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/login_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/reset_password_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/second_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/third_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_otp_reset_password.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_phone_otp.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_phone_reset_passwprd.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kHomeLayout = '/HomeLayout';

  static const kFistRegisterScreen = '/FistRegisterScreen';

  static const kVerifyOtpPhoneScreen = '/VerifyOtpPhoneScreen';

  static const kSecondRegisterScreen = '/SecondRegisterScreen';

  static const kThirdRegisterScreen = '/ThirdRegisterScreen';

  static const kLoginScreen = '/LoginScreen';

  static const kVerifyPhoneScreen = '/VerifyPhoneScreen';

  static const kVerifyOtpResetPasswordScreen = '/VerifyOtpResetPasswordScreen';

  static const kResetPasswordScreen = '/ResetPasswordScreen';

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
          kFistRegisterScreen,
      routes: [
        GoRoute(
          path: kFistRegisterScreen,
          builder: (context, state) => const FirstRegisterScreen(),
        ),
        GoRoute(
          path: kVerifyOtpPhoneScreen,
          builder: (context, state) => const VerifyPhoneOtpRegisterScreen(),
        ),
        GoRoute(
          path: kSecondRegisterScreen,
          builder: (context, state) => const SecondRegisterScreen(),
        ),
        GoRoute(
          path: kThirdRegisterScreen,
          builder: (context, state) => const ThirdRegisterScreen(),
        ),
        GoRoute(
          path: kLoginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: kVerifyPhoneScreen,
          builder: (context, state) => const VerifyPhoneResetPasswprd(),
        ),
        GoRoute(
          path: kVerifyOtpResetPasswordScreen,
          builder: (context, state) =>
              const VerifyPhoneOtpResetPasswordScreen(),
        ),
        GoRoute(
          path: kResetPasswordScreen,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
      ]);
}
