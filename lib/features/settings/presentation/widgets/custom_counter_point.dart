import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';

class CustomCounterPoint extends StatefulWidget {
  const CustomCounterPoint({super.key, required this.catagoryData});
  final CategoryData catagoryData;

  @override
  State<CustomCounterPoint> createState() => _CustomCounterPointState();
}

class _CustomCounterPointState extends State<CustomCounterPoint> {
  late num _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.catagoryData.count;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 48.h,
              width: 260.w,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: buttonGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Container(
                  height: 45.h,
                  width: 258.w,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          widget.catagoryData.categoryName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        _counter == 1
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30.r,
                                child: Icon(
                                  size: 23.h,
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              )
                            : CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {
                                    SettingsCubit.get(context)!
                                        .updateCount
                                        .removeWhere((element) =>
                                            element['categoryId'] ==
                                            widget.catagoryData.id);
                                    setState(() {
                                      _counter++;
                                      print(SettingsCubit.get(context)!
                                          .updateCount
                                          .toString());
                                    });
                                    SettingsCubit.get(context)!
                                        .updateCount
                                        .add({
                                      'categoryId': widget.catagoryData.id,
                                      'newCount': _counter,
                                    });
                                  },
                                  icon: const Icon(
                                    size: 23,
                                    Icons.add,
                                    color: kDarktBlue,
                                  ),
                                ),
                              ),
                        Text(
                          '$_counter',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kDarktBlue),
                        ),
                        _counter == 0
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30.r,
                                child: Icon(
                                  size: 23.h,
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                              )
                            : CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  iconSize: 23.h,
                                  onPressed: () {
                                    setState(() {
                                      _counter--;
                                      print(SettingsCubit.get(context)!
                                          .updateCount
                                          .toString());
                                    });
                                    SettingsCubit.get(context)!
                                        .updateCount
                                        .removeWhere((element) =>
                                            element['categoryId'] ==
                                            widget.catagoryData.id);
                                    SettingsCubit.get(context)!
                                        .updateCount
                                        .add({
                                      'categoryId': widget.catagoryData.id,
                                      'newCount': -1,
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
