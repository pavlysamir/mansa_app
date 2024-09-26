import 'package:go_router/go_router.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Layouts/home_layout.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/presentation/views/first_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/login_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/reset_password_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/second_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/third_register_screen.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_otp_reset_password.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_phone_otp.dart';
import 'package:mansa_app/features/authentication/presentation/views/verify_phone_reset_passwprd.dart';
import 'package:mansa_app/features/notification/presentation/views/notification_screen.dart';
import 'package:mansa_app/features/search/presentation/views/result_search_screen.dart';
import 'package:mansa_app/features/search/presentation/views/search_screen.dart';
import 'package:mansa_app/features/settings/presentation/views/contant_us_screen.dart';
import 'package:mansa_app/features/settings/presentation/views/edit_profile_screen.dart';
import 'package:mansa_app/features/settings/presentation/views/invite_friend_screen.dart';
import 'package:mansa_app/features/settings/presentation/views/my_balance_screen.dart';

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

  static const kSearchScreen = '/SearchScreen';

  static const kNotificationScreen = '/NotificationScreen';

  static const kResultSearchScreen = '/ResultSearchScreen';

  static const kEditProfileScreen = '/EditProfileScreen';

  static const kMyBalanceScreen = '/MyBalanceScreen';

  static const kInviteFriendcreen = '/InviteFriendcreen';

  static const kContantUsScreen = '/ContantUsScreen';

  static final router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation:
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token) !=
                  null
              ? kHomeLayout
              : kFistRegisterScreen,
      routes: [
        GoRoute(
          path: kHomeLayout,
          builder: (context, state) => const HomeLayout(),
        ),
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
          builder: (context, state) => VerifyPhoneResetPasswprd(
            isFromLogin: state.extra as bool,
          ),
        ),
        GoRoute(
          path: kVerifyOtpResetPasswordScreen,
          builder: (context, state) =>
              const VerifyPhoneOtpResetPasswordScreen(),
        ),
        GoRoute(
          path: kResetPasswordScreen,
          builder: (context, state) =>
              ResetPasswordScreen(isFromLoginScreen: state.extra as bool),
        ),
        GoRoute(
          path: kSearchScreen,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: kNotificationScreen,
          builder: (context, state) => const NotificationScreen(),
        ),
        GoRoute(
          path: kResultSearchScreen,
          builder: (context, state) => const ResultSearchScreen(),
        ),
        GoRoute(
          path: kEditProfileScreen,
          builder: (context, state) => const EditProfileScreen(),
        ),
        GoRoute(
          path: kMyBalanceScreen,
          builder: (context, state) => const MyBalanceScreen(),
        ),
        GoRoute(
          path: kInviteFriendcreen,
          builder: (context, state) => const InviteFriendScreen(),
        ),
        GoRoute(
          path: kContantUsScreen,
          builder: (context, state) => const ContantUsScreen(),
        ),
      ]);
}
