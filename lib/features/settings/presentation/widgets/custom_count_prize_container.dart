import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomMyCountPriceContainer extends StatelessWidget {
  const CustomMyCountPriceContainer({
    super.key,
    required this.text,
    required this.count,
  });
  final String text;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        IntrinsicHeight(
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
                children: [
                  Text(text, style: Theme.of(context).textTheme.headlineSmall),
                  Text(count, style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
