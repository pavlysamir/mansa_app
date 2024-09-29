import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Theme/Teme_data.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo_impl.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo_impl.dart';
import 'package:mansa_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:mansa_app/features/profile/presentation/managers/cubit/profile_cubit.dart';
import 'package:mansa_app/features/search/data/repo/search_repo_impl.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:mansa_app/features/settings/data/repo/settings_repo_impl.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:mansa_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

GlobalKey globalKey = GlobalKey();

class MansaApp extends StatelessWidget {
  const MansaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>())
              ..getAllGradesRegistration(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<SearchRepoImpl>())..triggerGetFunctions(),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>())
              ..initializeLanguage()
              ..triggerGetFunctions(),
          ),
          BlocProvider(
              create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>()))
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              key: globalKey,
              locale: isEnglish ? const Locale('en') : const Locale('ar'),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            );
          },
        ),
      ),
    );
  }
}
