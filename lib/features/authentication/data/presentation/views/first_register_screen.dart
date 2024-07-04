import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Image.asset(AssetsData.logo),
          SizedBox(
            height: 24.h,
          ),
          Text(
            AppLocalizations.of(context)!.title,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ))),
    );
  }
}
