import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_smooth_indicaror.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is VerifyMobileNumSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
          customGoAndDeleteNavigate(
              context: context, path: AppRouter.kVerifyOtpPhoneScreen);
        }
        if (state is VerifyMobileNumFaluir) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
            key: RegisterCubit.get(context)!.formFirstScreenRegisterKey,
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
                      activeIndex: 0,
                      count: 3,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomFormField(
                      controller: RegisterCubit.get(context)!.nameController,
                      validationMassage: conditionOfValidationName,
                      hintText: AppLocalizations.of(context)!.tripleName,
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.phoneNumber,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomFormField(
                      controller: RegisterCubit.get(context)!.phoneController,
                      validationMassage: conditionOfValidationPhone,
                      hintText: '01000000000',
                      textInputType: TextInputType.phone),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  state is CashedFirstRegisterUserDataLoading ||
                          state is VerifyMobileNumLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryKey,
                        ))
                      : CustomButtonLarge(
                          text:
                              AppLocalizations.of(context)!.followSubscription,
                          textColor: Colors.white,
                          function: () async {
                            if (RegisterCubit.get(context)!
                                .formFirstScreenRegisterKey
                                .currentState!
                                .validate()) {
                              RegisterCubit.get(context)!
                                  .cashedUserDataFirstScreen()
                                  .then((value) {
                                RegisterCubit.get(context)!.verifyMobileNum();
                              });
                            }
                          }),
                  SizedBox(
                    height: 50.h,
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
                          customGoAndDeleteNavigate(
                              context: context, path: AppRouter.kLoginScreen);
                        },
                        child: Text(AppLocalizations.of(context)!.login,
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
