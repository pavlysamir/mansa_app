import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      required this.list,
      required this.value,
      required this.onChanged});
  final List<String> list;
  final String value;
  final Function(String? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: DropdownButton<String>(
          elevation: 0,
          value: value,
          hint: Text(list.first),
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
