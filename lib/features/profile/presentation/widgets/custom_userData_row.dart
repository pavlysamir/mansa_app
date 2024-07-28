import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomUserdataRow extends StatelessWidget {
  const CustomUserdataRow({super.key, required this.text, required this.img});

  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(img),
            SizedBox(
              width: 22.w,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                  ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
