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
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(color: kDarktBlue),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Text(
            AppLocalizations.of(context)!.olderOfApp,
            style: const TextStyle(color: kBlackColor),
          ),
          SizedBox(height: 5.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: 132.w,
              child: PinCodeTextField(
                  controller: controller1,
                  enableActiveFill: true,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).indicatorColor,
                  appContext: context,
                  length: 4,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40.h,
                    fieldWidth: 32.w,
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
                    AppLocalizations.of(context)!.olderOfApp,
                    style: const TextStyle(color: kBlackColor),
                  ),
                  SizedBox(height: 5.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: 132.w,
                      child: PinCodeTextField(
                          controller: controller2,
                          enableActiveFill: true,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).indicatorColor,
                          appContext: context,
                          length: 4,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40.h,
                            fieldWidth: 32.w,
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
                          )),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const Text(
                    'ترتيبك علي القاهرة : 150',
                    style: TextStyle(color: kBlackColor),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.olderOfApp,
                    style: const TextStyle(color: kBlackColor),
                  ),
                  SizedBox(height: 5.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: 132.w,
                      child: PinCodeTextField(
                          controller: controller3,
                          enableActiveFill: true,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).indicatorColor,
                          appContext: context,
                          length: 4,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40.h,
                            fieldWidth: 32.w,
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
                          )),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const Text(
                    'ترتيبك علي القاهرة : 150',
                    style: TextStyle(color: kBlackColor),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
