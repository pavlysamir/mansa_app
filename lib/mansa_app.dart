import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Theme/Teme_data.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo_impl.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:mansa_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MansaApp extends StatelessWidget {
  const MansaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>())
            ..getAllGradesRegistration(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            //isEnglish ? const Locale('en') : const Locale('ar'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            routerConfig: AppRouter.router,
            theme:
                //isDark ? AppTheme.darkTheme :
                AppTheme.lightTheme),
      ),
    );
  }
}
