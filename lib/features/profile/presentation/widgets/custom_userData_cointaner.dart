import 'package:flutter/material.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_userData_row.dart';

class CustomUserdataCointaner extends StatelessWidget {
  const CustomUserdataCointaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMoreLightBlue,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomUserdataRow(
              img: AssetsData.nkaba,
              text: 'نقابة الاسكندرية',
            ),
            CustomUserdataRow(
              img: AssetsData.mizan,
              text: 'ليسانس حقوق عام ',
            ),
            CustomUserdataRow(
              img: AssetsData.address,
              text: '8 ش العصيمي - حي الزيتون',
            ),
            CustomUserdataRow(
              img: AssetsData.kady,
              text: 'جنائي - استئناف - جنائي',
            ),
            CustomUserdataRow(
              img: AssetsData.call,
              text: '01270347065',
            ),
          ],
        ),
      ),
    );
  }
}
