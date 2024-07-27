import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class CustomCounterPoint extends StatefulWidget {
  const CustomCounterPoint({super.key, required this.text});
  final String text;

  @override
  State<CustomCounterPoint> createState() => _CustomCounterPointState();
}

class _CustomCounterPointState extends State<CustomCounterPoint> {
  int _counter = 0;
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
            Container(
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
                      widget.text,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          icon: const Icon(
                            size: 23,
                            Icons.add,
                            color: kDarktBlue,
                          )),
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
                                size: 23.h, Icons.remove, color: Colors.grey))
                        : CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                                iconSize: 23.h,
                                onPressed: () {
                                  setState(() {
                                    _counter--;
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
