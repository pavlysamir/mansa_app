import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';

class CustomMedalGroubsContainer extends StatelessWidget {
  const CustomMedalGroubsContainer(
      {super.key, required this.category, required this.img});

  final CategoryMedalData category;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
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
              Text(category.categoryName,
                  style: Theme.of(context).textTheme.bodyMedium!),
              Text('${category.count}',
                  style: Theme.of(context).textTheme.displayLarge),
            ],
          ),
        ),
      ),
    );
  }
}
