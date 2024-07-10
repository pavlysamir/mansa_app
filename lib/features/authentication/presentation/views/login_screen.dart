import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
            key: LoginCubit.get(context)!.formScreenLoginrKey,
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
                      AppLocalizations.of(context)!.signUp,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.phoneNumber,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomFormField(
                      controller: LoginCubit.get(context)!.emailController,
                      validationMassage: conditionOfValidationPhone,
                      hintText: '01000000000',
                      textInputType: TextInputType.number),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomFormField(
                      isEyeTrue: LoginCubit.get(context)!.ifPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          LoginCubit.get(context)!.isVisiblePasswordEye();
                        },
                        icon: Icon(LoginCubit.get(context)!.iconDataPassword),
                      ),
                      controller: LoginCubit.get(context)!.passwordController,
                      validationMassage: conditionOfValidationPassWord,
                      hintText: '************',
                      textInputType: TextInputType.visiblePassword),
                  Center(
                      child: TextButton(
                    onPressed: () {
                      customJustGoNavigate(
                          context: context, path: AppRouter.kVerifyPhoneScreen);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.doUForgrtPassword,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  )),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButtonLarge(
                      text: AppLocalizations.of(context)!.followSubscription,
                      textColor: Colors.white,
                      function: () async {
                        if (LoginCubit.get(context)!
                            .formScreenLoginrKey
                            .currentState!
                            .validate()) {}
                      }),
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.doUDoNotHaveAccount,
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black)),
                      const SizedBox(
                        width: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          customGoAndDeleteNavigate(
                              context: context,
                              path: AppRouter.kFistRegisterScreen);
                        },
                        child: Text(AppLocalizations.of(context)!.createAccount,
                            style: Styles.textStyle14.copyWith(
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.contactUs,
                          style: Styles.textStyle14.copyWith(
                            color: kDarktBlue,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ))),
        );
      },
    );
  }
}
