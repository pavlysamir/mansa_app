import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_smooth_indicaror.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneOtpRegisterScreen extends StatelessWidget {
  const VerifyPhoneOtpRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
              key: RegisterCubit.get(context)!.formVerifyOtpPhoneKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 41.h,
                    ),
                    const Center(
                      child: CustomSmoothIndicator(
                        activeIndex: 0,
                        count: 3,
                      ),
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.confirmPhoneNum,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Center(
                      child: Text(
                        getIt
                            .get<CashHelperSharedPreferences>()
                            .getData(key: ApiKey.mobNumber),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: kPrimaryKey),
                      ),
                    ),
                    Center(
                        child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.changePhoneNumber,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: kPrimaryKey),
                      ),
                    )),
                    SizedBox(
                      height: 24.h,
                    ),
                    PinCodeTextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).indicatorColor,
                        appContext: context,
                        length: 6,
                        controller:
                            RegisterCubit.get(context)!.verifyOtPhoneController,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.enterOtp;
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40.h,
                            fieldWidth: 32.w,
                            activeColor: Colors.grey,
                            selectedColor: Colors.grey,
                            inactiveColor: Colors.grey,
                            activeFillColor: Colors.white,
                            selectedFillColor: Colors.grey[200],
                            inactiveFillColor: Colors.grey[100],
                            errorBorderColor: Colors.red),
                        textStyle: TextStyle(
                          color: Theme.of(context).indicatorColor,
                        )),
                    Center(
                        child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: kDarktBlue),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    CustomButtonLarge(
                        text: AppLocalizations.of(context)!.submit,
                        textColor: Colors.white,
                        function: () {
                          if (RegisterCubit.get(context)!
                              .formVerifyOtpPhoneKey
                              .currentState!
                              .validate()) {
                            customGoAndDeleteNavigate(
                                context: context,
                                path: AppRouter.kSecondRegisterScreen);
                          }
                        }),
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
