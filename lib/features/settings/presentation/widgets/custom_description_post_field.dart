import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomDescriptionPostField extends StatelessWidget {
  CustomDescriptionPostField(
      {super.key,
      required this.controller,
      this.validationMassage,
      required this.hintText,
      required this.textInputType});
  final TextEditingController controller;
  //final String validationMassage;
  final String hintText;
  final TextInputType textInputType;
  Function(String value)? validationMassage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: TextFormField(
        maxLines: 10,
        keyboardType: textInputType,
        controller: controller,
        validator: (value) {
          return validationMassage!(value!);
        },
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          filled: true,
          //fillColor: Colors.grey[200],
          enabledBorder: outlineInputBorder(context),
          focusedBorder: outlineInputBorder(context),
          hintText: hintText,
          hintStyle: Styles.textStyle14Grey,
        ),
      ),
    );
  }
}

InputBorder? outlineInputBorder(BuildContext context) {
  return Theme.of(context).inputDecorationTheme.enabledBorder;
}

OutlineInputBorder outlineInputBorderError() {
  return OutlineInputBorder(
    borderSide:
        const BorderSide(color: Colors.red), // Border color changes to red
    borderRadius: BorderRadius.circular(14),
  );
}
