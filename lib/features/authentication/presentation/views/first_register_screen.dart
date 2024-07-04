import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/assets.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Image.asset(AssetsData.logo),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'jjjj',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ))),
    );
  }
}
