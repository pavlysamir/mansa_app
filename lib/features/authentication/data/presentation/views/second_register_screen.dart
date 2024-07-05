import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/data/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/data/presentation/widgets/custom_smooth_indicaror.dart';

class SecondRegisterScreen extends StatelessWidget {
  const SecondRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
            key: RegisterCubit.get(context)!.formSecondScreenRegisterKey,
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
                      AppLocalizations.of(context)!.createAccount,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Center(
                    child: CustomSmoothIndicator(
                      activeIndex: 1,
                      count: 3,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.kedDegree,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomFormField(
                                  textInputType: TextInputType.text,
                                  hintText:
                                      AppLocalizations.of(context)!.kedDegree,
                                  controller: RegisterCubit.get(context)!
                                      .kedDegreeController,
                                  validationMassage: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .kedDegree;
                                    }
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.kedNumber,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomFormField(
                                  textInputType: TextInputType.text,
                                  hintText:
                                      AppLocalizations.of(context)!.kedNumber,
                                  controller: RegisterCubit.get(context)!
                                      .kedNumberController,
                                  validationMassage: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .kedNumber;
                                    }
                                  }),
                            ],
                          ),
                        )
                      ]),
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
                      isEyeTrue: RegisterCubit.get(context)!.ifPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          RegisterCubit.get(context)!.isVisiblePasswordEye();
                        },
                        icon:
                            Icon(RegisterCubit.get(context)!.iconDataPassword),
                      ),
                      controller:
                          RegisterCubit.get(context)!.passwordController,
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
                      isEyeTrue:
                          RegisterCubit.get(context)!.ifConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          RegisterCubit.get(context)!
                              .isVisibleConformPasswordEye();
                        },
                        icon:
                            Icon(RegisterCubit.get(context)!.iconDataPassword),
                      ),
                      controller:
                          RegisterCubit.get(context)!.confirmPasswordController,
                      validationMassage: (value) {
                        if (value ==
                            RegisterCubit.get(context)!
                                .passwordController
                                .text) {
                          return null;
                        } else {
                          return 'does\'t match ';
                        }
                      },
                      hintText: '************',
                      textInputType: TextInputType.visiblePassword),
                  SizedBox(
                    height: 130.h,
                  ),
                  CustomButtonLarge(
                      text: AppLocalizations.of(context)!.followSubscription,
                      textColor: Colors.white,
                      function: () {
                        if (RegisterCubit.get(context)!
                            .formSecondScreenRegisterKey
                            .currentState!
                            .validate()) {
                          customGoAndDeleteNavigate(
                              context: context,
                              path: AppRouter.kVerifyOtpPhoneScreen);
                        }
                      }),
                  SizedBox(
                    height: 90.h,
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
