import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';

class IconProfileAppBar extends StatelessWidget {
  const IconProfileAppBar({
    super.key,
    required this.function,
  });
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: klightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.edit, size: 20, color: Colors.white)
                ],
              ),
            )));
  }
}
