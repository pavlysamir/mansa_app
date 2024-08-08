import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomHomeContainerOlders extends StatelessWidget {
  const CustomHomeContainerOlders({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.registrationGrade,
    required this.city,
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final int registrationGrade;
  final int city;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(color: kDarktBlue),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.olderOfApp,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 5.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: controller1.text.length == 1
                  ? 40.w
                  : controller1.text.length < 3
                      ? 70.w
                      : 180.w,
              child: PinCodeTextField(
                  controller: controller1,
                  enableActiveFill: true,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).indicatorColor,
                  appContext: context,
                  length: controller1.text.length,
                  pinTheme: PinTheme(
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 1.w),
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40.h,
                    fieldWidth: 30.w,
                    activeColor: kDarktBlue,
                    selectedColor: kDarktBlue,
                    disabledColor: kDarktBlue,
                    inactiveColor: kDarktBlue,
                    activeFillColor: kDarktBlue,
                    selectedFillColor: kDarktBlue,
                    inactiveFillColor: kDarktBlue,
                    errorBorderColor: Colors.red,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.olderOfDistric,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 5.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: controller1.text.length == 1
                          ? 30.w
                          : controller2.text.length < 3
                              ? 70.w
                              : 180.w,
                      child: PinCodeTextField(
                          controller: controller2,
                          enableActiveFill: true,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).indicatorColor,
                          appContext: context,
                          length: controller2.text.length,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40.h,
                            fieldWidth: 30.w,
                            activeColor: kPrimaryKey,
                            selectedColor: kPrimaryKey,
                            disabledColor: kPrimaryKey,
                            inactiveColor: kPrimaryKey,
                            activeFillColor: kPrimaryKey,
                            selectedFillColor: kPrimaryKey,
                            inactiveFillColor: kPrimaryKey,
                            errorBorderColor: Colors.red,
                          ),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.olderOfSpacific,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 5.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: controller1.text.length == 1
                          ? 30.w
                          : controller3.text.length < 3
                              ? 70.w
                              : 180.w,
                      child: PinCodeTextField(
                          controller: controller3,
                          enableActiveFill: true,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).indicatorColor,
                          appContext: context,
                          length: controller3.text.length,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40.h,
                            fieldWidth: 30.w,
                            activeColor: kPrimaryKey,
                            selectedColor: kPrimaryKey,
                            disabledColor: kPrimaryKey,
                            inactiveColor: kPrimaryKey,
                            activeFillColor: kPrimaryKey,
                            selectedFillColor: kPrimaryKey,
                            inactiveFillColor: kPrimaryKey,
                            errorBorderColor: Colors.red,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  '${AppLocalizations.of(context)!.olderOfAst2naf} :$registrationGrade',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: Text(
                  '${AppLocalizations.of(context)!.olderOfGovernment} :$city',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
