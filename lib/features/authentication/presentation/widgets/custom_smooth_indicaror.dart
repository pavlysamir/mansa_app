import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator(
      {super.key, required this.activeIndex, required this.count});

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: JumpingDotEffect(
          dotColor: Colors.grey,
          activeDotColor: kDarktBlue,
          dotHeight: 3.h,
          dotWidth: 30.w),
    );
  }
}
