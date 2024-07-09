import 'package:go_router/go_router.dart';
import 'package:mansa_app/features/authentication/presentation/views/first_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/login_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/second_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/third_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_phone_otp.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kHomeLayout = '/HomeLayout';

  static const kFistRegisterScreen = '/FistRegisterScreen';

  static const kVerifyOtpPhoneScreen = '/VerifyOtpPhoneScreen';

  static const kSecondRegisterScreen = '/SecondRegisterScreen';

  static const kThirdRegisterScreen = '/ThirdRegisterScreen';

  static const kLoginScreen = '/LoginScreen';

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
      ]);
}
