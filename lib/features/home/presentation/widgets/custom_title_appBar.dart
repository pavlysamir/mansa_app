import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomTitleAppBar extends StatelessWidget {
  const CustomTitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.dg,
          child: const Icon(Icons.person),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'welcom',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: kPrimaryKey),
            ),
            Text(
              'John Doe',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: kDarktBlue),
            ),
          ],
        )
      ],
    );
  }
}
