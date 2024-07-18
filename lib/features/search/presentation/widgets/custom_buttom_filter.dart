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
    required this.isSelected,
  });

  final Function() function;
  final String text;
  final int id;
  final bool isSelected;
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
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: isSelected == true ? kDarktBlue : Colors.white,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Center(
              child: Text(
                text,
                style: isSelected == true
                    ? Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white)
                    : Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: kDarktBlue),
              ),
            ),
          ),
        );
      },
    );
  }
}
