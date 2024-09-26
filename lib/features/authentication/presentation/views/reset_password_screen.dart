import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, this.isFromLoginScreen = false});
  final bool isFromLoginScreen;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is EditNewPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('تم '),
            ),
          );
          if (isFromLoginScreen) {
            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kLoginScreen);
          } else {
            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kHomeLayout);
          }
        } else if (state is EditNewPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Form(
                key: LoginCubit.get(context)!.formScreenResetPasswordKey,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Image.asset(
                            AssetsData.logo,
                            height: 73,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.resetPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.password,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              isEyeTrue:
                                  LoginCubit.get(context)!.ifPasswordVisible,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context)!
                                      .isVisiblePasswordEye();
                                },
                                icon: Icon(
                                    LoginCubit.get(context)!.iconDataPassword),
                              ),
                              controller: LoginCubit.get(context)!
                                  .newPasswordController,
                              validationMassage: conditionOfValidationPassWord,
                              hintText: '************',
                              textInputType: TextInputType.visiblePassword),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.confirmPassword,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              isEyeTrue: LoginCubit.get(context)!
                                  .ifConfirmPasswordVisible,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context)!
                                      .isVisibleConformPasswordEye();
                                },
                                icon: Icon(LoginCubit.get(context)!
                                    .iconDataConfirmPassword),
                              ),
                              controller: LoginCubit.get(context)!
                                  .confirmNewPasswordController,
                              validationMassage: (value) {
                                if (value ==
                                    LoginCubit.get(context)!
                                        .newPasswordController
                                        .text) {
                                  return null;
                                } else {
                                  return 'does\'t match ';
                                }
                              },
                              hintText: '************',
                              textInputType: TextInputType.visiblePassword),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                          state is EditNewPasswordLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryKey,
                                  ),
                                )
                              : CustomButtonLarge(
                                  text: AppLocalizations.of(context)!.login,
                                  textColor: Colors.white,
                                  function: () async {
                                    if (LoginCubit.get(context)!
                                        .formScreenResetPasswordKey
                                        .currentState!
                                        .validate()) {
                                      LoginCubit.get(context)!
                                          .verifyNumberOtpforgetPassword();
                                    }
                                  }),
                        ]))),
          )),
        );
      },
    );
  }
}
