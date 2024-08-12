import 'package:flutter/material.dart';
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
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/core/utils/widgets/selcted_item_listView_drop_down.dart';
import 'package:mansa_app/core/utils/widgets/selected_drop_down_manager.dart';
import 'package:mansa_app/features/authentication/presentation/manager/register/register_cubit.dart';
import 'package:mansa_app/features/authentication/presentation/widgets/custom_smooth_indicaror.dart';

class SecondRegisterScreen extends StatelessWidget {
  const SecondRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectedDropDownManager manager = SelectedDropDownManager();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is CashedSecondRegisterUserDataSuccess) {
          customGoAndDeleteNavigate(
            context: context,
            path: AppRouter.kThirdRegisterScreen,
          );
        }
      },
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
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          PopUpDialogDropDown(
                                        context: context,
                                        function: () {
                                          Navigator.pop(context);
                                        },
                                        widget: Column(
                                          children: [
                                            SizedBox(
                                              height: 200.h,
                                              child: ListView.builder(
                                                  itemCount: RegisterCubit.get(
                                                          context)!
                                                      .namesOfGrades
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return SelectedDropDownItem(
                                                      manager: manager,
                                                      functionSelected: () {
                                                        RegisterCubit.get(
                                                                context)!
                                                            .selectGrade(
                                                                RegisterCubit.get(
                                                                        context)!
                                                                    .namesOfGrades[index]);
                                                      },
                                                      index: index,
                                                      name: RegisterCubit.get(
                                                              context)!
                                                          .namesOfGrades[index],
                                                    );
                                                  }),
                                            ),
                                            CustomButtonLarge(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .save,
                                                textColor: Colors.white,
                                                function: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ),
                                        function2: () {},
                                      ),
                                    );
                                    // PopUpDialogDropDown
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              RegisterCubit.get(context)!
                                                      .grade ??
                                                  'اختر درجة القيد ',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            const Icon(Icons.arrow_drop_down)
                                          ],
                                        ),
                                      ))),
                              // CustomDropDownMenu(
                              //   list: RegisterCubit.get(context)!.namesOfGrades,
                              //   value: RegisterCubit.get(context)!.grade,
                              //   onChanged: (String? newValue) {
                              //     RegisterCubit.get(context)!
                              //         .selectGrade(newValue!);
                              //   },
                              // )
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
                                  hintText: '000000000',
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
                        icon: Icon(RegisterCubit.get(context)!
                            .iconDataConfirmPassword),
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
                    height: 35.h,
                  ),
                  state is CashedSecondRegisterUserDataLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryKey,
                          ),
                        )
                      : CustomButtonLarge(
                          text:
                              AppLocalizations.of(context)!.followSubscription,
                          textColor: Colors.white,
                          function: () {
                            if (RegisterCubit.get(context)!
                                .formSecondScreenRegisterKey
                                .currentState!
                                .validate()) {
                              RegisterCubit.get(context)!
                                  .cashedUserDataSecondScreen();
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
