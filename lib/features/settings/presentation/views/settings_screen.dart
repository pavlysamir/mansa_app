import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: SettingsCubit.get(context)!.isLoading,
      progressIndicator: const CircularProgressIndicator(color: kPrimaryKey),
      child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.dg),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_outlined),
                    title: Text(
                      AppLocalizations.of(context)!.balance,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kMyBalanceScreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: Text(
                      AppLocalizations.of(context)!.inviteFriend,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kInviteFriendcreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: Text(
                      AppLocalizations.of(context)!.editProfile,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kEditProfileScreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: Text(
                      AppLocalizations.of(context)!.resetPassword,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () {
                      customJustGoNavigate(
                          context: context,
                          path: AppRouter.kVerifyPhoneScreen,
                          data: true);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.call_outlined),
                    title: Text(
                      AppLocalizations.of(context)!.contactUs,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kContantUsScreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(
                      AppLocalizations.of(context)!.changeLang,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
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
                            SettingsCubit.get(context)!.changeLanguage();
                            Navigator.pop(context);
                          },
                          title:
                              AppLocalizations.of(context)!.doUWantChangeLang,
                          subTitle: '',
                          img: AssetsData.arabic,
                          colorButton1: Colors.white,
                          colorButton2: kPrimaryKey,
                          textColortcolor1: kBlackColor,
                          textColortcolor2: Colors.white,
                        ),
                      );
                    },
                  ),
                  // ListTile(
                  //   leading: const Icon(Icons.color_lens_outlined),
                  //   title: Text(
                  //     AppLocalizations.of(context)!.changeTheme,
                  //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //           decoration: TextDecoration.underline,
                  //         ),
                  //   ),
                  //   onTap: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) => PopUpDialog(
                  //         function2: () {
                  //           Navigator.pop(context);
                  //         },
                  //         context: context,
                  //         function: () {
                  //           SettingsCubit.get(context)!.changeTheme();
                  //           Navigator.pop(context);
                  //         },
                  //         title:
                  //             AppLocalizations.of(context)!.doUWantChangetheme,
                  //         subTitle: '',
                  //         img: AssetsData.deleteAccount,
                  //         colorButton1: Colors.white,
                  //         colorButton2: kPrimaryKey,
                  //         textColortcolor1: kBlackColor,
                  //         textColortcolor2: Colors.white,
                  //       ),
                  //     );
                  //   },
                  // ),
                  BlocConsumer<SettingsCubit, SettingsState>(
                    listener: (context, state) {
                      if (state is DeleteAccountSuccess) {
                        customGoAndDeleteNavigate(
                            context: context, path: AppRouter.kLoginScreen);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(state.message),
                          ),
                        );
                      } else if (state is DeleteAccountFaluir) {
                        customGoAndDeleteNavigate(
                            context: context, path: AppRouter.kLoginScreen);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ListTile(
                        leading: const Icon(Icons.delete_outline),
                        title: Text(
                          AppLocalizations.of(context)!.deleteAccount,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
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
                                SettingsCubit.get(context)!.deleteAccount();
                                Navigator.pop(context);
                              },
                              title: AppLocalizations.of(context)!
                                  .doUDeleteAccount,
                              subTitle: '',
                              img: AssetsData.deleteAccount,
                              colorButton1: Colors.white,
                              colorButton2: kPrimaryKey,
                              textColortcolor1: kBlackColor,
                              textColortcolor2: Colors.white,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  BlocConsumer<SettingsCubit, SettingsState>(
                    listener: (context, state) {
                      if (state is LogOutSuccess) {
                        customGoAndDeleteNavigate(
                            context: context, path: AppRouter.kLoginScreen);
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => PopUpDialog(
                                function2: () {
                                  Navigator.pop(context);
                                },
                                context: context,
                                function: () {
                                  SettingsCubit.get(context)!.logOut();
                                  Navigator.pop(context);
                                },
                                title: AppLocalizations.of(context)!
                                    .doUWantToLogOut,
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
                          ));
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
