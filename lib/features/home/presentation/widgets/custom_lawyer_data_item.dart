import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomLowyerDataItem extends StatelessWidget {
  const CustomLowyerDataItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        // height: 121.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
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
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: kDarktBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      ' متاح لانجاز مهمة',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),
              Text("القانون هو الحضارة، وبغيابه نعود إلى البربرية",
                  style: Theme.of(context).textTheme.titleSmall!)
            ],
          ),
        ),
      ),
    );
  }
}
