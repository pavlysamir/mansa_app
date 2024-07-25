import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_count_prize_container.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_return_point_user_item.dart';

class MyBalanceScreen extends StatelessWidget {
  const MyBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.balance,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.dg),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(AppLocalizations.of(context)!.currentBalance,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomMyCountPriceContainer(
                    text: AppLocalizations.of(context)!.golden,
                    count: '10',
                  ),
                  CustomMyCountPriceContainer(
                    text: AppLocalizations.of(context)!.silver,
                    count: '5',
                  ),
                  CustomMyCountPriceContainer(
                    text: AppLocalizations.of(context)!.bronze,
                    count: '9',
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Text('. مجموعة ذهبية تساوي 200 نقطة ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: kDarktBlue)),
              SizedBox(
                height: 10.h,
              ),
              Text('. مجموعة ذهبية تساوي 200 نقطة ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: kDarktBlue)),
              SizedBox(
                height: 10.h,
              ),
              Text('. مجموعة ذهبية تساوي 200 نقطة ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: kDarktBlue)),
              SizedBox(
                height: 18.h,
              ),
              Text(AppLocalizations.of(context)!.collegues,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                height: 18.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CustomReturnPointUserItem();
                },
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
