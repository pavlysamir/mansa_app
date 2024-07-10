import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/functions/validation_handling.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyPhoneResetPasswprd extends StatelessWidget {
  const VerifyPhoneResetPasswprd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Form(
                key: LoginCubit.get(context)!.formVerifyPhoneKey,
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
                            AppLocalizations.of(context)!.phoneNumber,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              controller: LoginCubit.get(context)!
                                  .resetPasswordController,
                              validationMassage: conditionOfValidationPhone,
                              hintText: '01000000000',
                              textInputType: TextInputType.phone),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.42,
                          ),
                          CustomButtonLarge(
                              text: AppLocalizations.of(context)!.send,
                              textColor: Colors.white,
                              function: () async {
                                if (LoginCubit.get(context)!
                                    .formVerifyPhoneKey
                                    .currentState!
                                    .validate()) {
                                  await getIt
                                      .get<CashHelperSharedPreferences>()
                                      .saveData(
                                          key: ApiKey.mobNumber,
                                          value: LoginCubit.get(context)!
                                              .resetPasswordController
                                              .text)
                                      .then((value) {
                                    customGoAndDeleteNavigate(
                                        context: context,
                                        path: AppRouter
                                            .kVerifyOtpResetPasswordScreen);
                                  });
                                }
                              }),
                        ]))),
          )),
        );
      },
    );
  }
}
