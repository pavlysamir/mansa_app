import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomUserdataRow extends StatelessWidget {
  const CustomUserdataRow(
      {super.key, required this.text, required this.img, this.isNull = false});

  final String text;
  final String img;
  final bool isNull;

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
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isNull ? Colors.grey : kBlackColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
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
