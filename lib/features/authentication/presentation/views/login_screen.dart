import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                    height: 24.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.email,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomFormField(
                      controller: LoginCubit.get(context)!.emailController,
                      validationMassage: conditionOfValidationName,
                      hintText: 'S6P9v@example.com',
                      textInputType: TextInputType.text),
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
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.doUForgrtPassword,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: kDarktBlue),
                    ),
                  )),
                  SizedBox(
                    height: 100.h,
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
                      Text(AppLocalizations.of(context)!.alreadyHaveAccount,
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black)),
                      const SizedBox(
                        width: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return TermsAndConditionsScreen();
                          // }));
                        },
                        child: Text(AppLocalizations.of(context)!.login,
                            style: Styles.textStyle14),
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
                          style:
                              Styles.textStyle14.copyWith(color: Colors.blue),
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
