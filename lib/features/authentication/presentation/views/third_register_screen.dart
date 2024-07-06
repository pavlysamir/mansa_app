import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_add_photo_button.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_smooth_indicaror.dart';

class ThirdRegisterScreen extends StatelessWidget {
  const ThirdRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
            key: RegisterCubit.get(context)!.formThirdScreenRegisterKey,
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
                      activeIndex: 2,
                      count: 3,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.cardImage,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.frontImage,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomAddPhotoButton(
                                function: () {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.backImage,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomAddPhotoButton(
                                function: () {},
                              )
                            ],
                          ),
                        )
                      ]),
                  SizedBox(
                    height: 130.h,
                  ),
                  CustomButtonLarge(
                      text: AppLocalizations.of(context)!.followSubscription,
                      textColor: Colors.white,
                      function: () {
                        if (RegisterCubit.get(context)!
                            .formThirdScreenRegisterKey
                            .currentState!
                            .validate()) {}
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
