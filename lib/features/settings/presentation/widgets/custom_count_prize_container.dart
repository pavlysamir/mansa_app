import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/settings/data/models/balance_model.dart';

class CustomMyCountPriceContainer extends StatelessWidget {
  const CustomMyCountPriceContainer({
    super.key,
    this.balanceData,
  });
  final ResponseBalanceData? balanceData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: buttonGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          IntrinsicWidth(
            child: Container(
              height: 98.h,
              width: 98.w,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      balanceData!.categoryName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '${balanceData!.count}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
