import 'package:go_router/go_router.dart';
import 'package:mansa_app/features/authentication/data/presentation/views/first_register_screen.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kHomeLayout = '/HomeLayout';

  static const kFistRegisterScreen = '/FistRegisterScreen';

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
      ]);
}
