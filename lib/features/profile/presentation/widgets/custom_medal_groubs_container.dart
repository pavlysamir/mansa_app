import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMedalGroubsContainer extends StatelessWidget {
  const CustomMedalGroubsContainer(
      {super.key, required this.img, required this.text, required this.count});

  final String img;
  final String text;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(img),
            Text(text, style: Theme.of(context).textTheme.bodyMedium!),
            Text(count, style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
