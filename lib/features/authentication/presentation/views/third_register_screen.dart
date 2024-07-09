import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/styles.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_add_photo_button.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_smooth_indicaror.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_view_photo_from_device.dart';

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
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.frontImage,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RegisterCubit.get(context)!.fileFront == null
                                  ? CustomAddPhotoButton(
                                      function: () {
                                        RegisterCubit.get(context)!
                                            .pickCameraImage(1);
                                      },
                                    )
                                  : CustomViewPhotoFromDevice(
                                      file:
                                          RegisterCubit.get(context)!.fileFront,
                                      function: () {
                                        RegisterCubit.get(context)!
                                            .removePostImageFromDevice(1);
                                      },
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.backImage,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RegisterCubit.get(context)!.fileBack == null
                                  ? CustomAddPhotoButton(
                                      function: () {
                                        RegisterCubit.get(context)!
                                            .pickCameraImage(2);
                                      },
                                    )
                                  : CustomViewPhotoFromDevice(
                                      file:
                                          RegisterCubit.get(context)!.fileBack,
                                      function: () {
                                        RegisterCubit.get(context)!
                                            .removePostImageFromDevice(2);
                                      },
                                    ),
                            ],
                          ),
                        )
                      ]),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.hintCardImage,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.hostCode,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomFormField(
                      textInputType: TextInputType.text,
                      hintText: 'MN111',
                      controller:
                          RegisterCubit.get(context)!.hostingCodeController,
                      validationMassage: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)!.hostCode;
                        }
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButtonLarge(
                      text: AppLocalizations.of(context)!.signUp,
                      textColor: Colors.white,
                      function: () {
                        if (RegisterCubit.get(context)!
                            .formThirdScreenRegisterKey
                            .currentState!
                            .validate()) {
                          customGoAndDeleteNavigate(
                              context: context, path: AppRouter.kLoginScreen);
                        }
                      }),
                  SizedBox(
                    height: 20.h,
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
                          customJustGoNavigate(
                              context: context, path: AppRouter.kLoginScreen);
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
