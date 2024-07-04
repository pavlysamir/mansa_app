import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Theme/Teme_data.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MansaApp extends StatelessWidget {
  const MansaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
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
          theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme),
    );
  }
}
