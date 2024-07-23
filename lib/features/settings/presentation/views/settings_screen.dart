import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.dg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.lock_outlined),
                title: Text(
                  AppLocalizations.of(context)!.balance,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: Text(
                  AppLocalizations.of(context)!.inviteFriend,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: Text(
                  AppLocalizations.of(context)!.editProfile,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.call_outlined),
                title: Text(
                  AppLocalizations.of(context)!.contactUs,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: Text(
                  AppLocalizations.of(context)!.deleteAccount,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUpDialog(
                      function2: () {
                        Navigator.pop(context);
                      },
                      context: context,
                      function: () {
                        //SettingsCubit.get(context).changeLanguage();
                        Navigator.pop(context);
                      },
                      title: AppLocalizations.of(context)!.doUDeleteAccount,
                      subTitle: '',
                      img: AssetsData.deleteAccount,
                      colorButton1: Colors.white,
                      colorButton2: kPrimaryKey,
                      textColortcolor1: kBlackColor,
                      textColortcolor2: Colors.white,
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => PopUpDialog(
                        function2: () {
                          Navigator.pop(context);
                        },
                        context: context,
                        function: () {
                          //SettingsCubit.get(context).changeLanguage();
                          Navigator.pop(context);
                        },
                        title: AppLocalizations.of(context)!.doUWantToLogOut,
                        subTitle: '',
                        img: AssetsData.logOut,
                        colorButton1: Colors.white,
                        colorButton2: kPrimaryKey,
                        textColortcolor1: kBlackColor,
                        textColortcolor2: Colors.white,
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.logOut,
                    style: Styles.textStyle14.copyWith(
                      color: kDarktBlue,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ));
  }
}
