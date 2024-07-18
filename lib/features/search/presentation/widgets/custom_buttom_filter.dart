import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';

class CustomButtomFilterSearch extends StatelessWidget {
  const CustomButtomFilterSearch({
    super.key,
    required this.function,
    required this.text,
    required this.id,
  });

  final Function() function;
  final String text;
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: function,
          child: Container(
            height: 30.h,
            width: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: SearchCubit.get(context)!.map[id] == true
                  ? kDarktBlue
                  : Colors.white,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Center(
              child: Text(
                text,
                style: SearchCubit.get(context)!.map[id] == true
                    ? Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white)
                    : Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        );
      },
    );
  }
}
