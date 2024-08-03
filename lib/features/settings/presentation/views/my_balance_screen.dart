import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_count_prize_container.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_return_point_user_item.dart';

class MyBalanceScreen extends StatefulWidget {
  const MyBalanceScreen({super.key});

  @override
  State<MyBalanceScreen> createState() => _MyBalanceScreenState();
}

class _MyBalanceScreenState extends State<MyBalanceScreen> {
  SettingsCubit? settingsCubit;
  @override
  void initState() {
    settingsCubit = SettingsCubit.get(context);

    settingsCubit!.getMyBalanceData();

    settingsCubit!.getGivenUserPoints();

    super.initState();
  }

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
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetMyBalanceLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Text(
                          AppLocalizations.of(context)!.currentBalance,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 18.h),
                        SizedBox(
                          height: 120.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: settingsCubit!.myBalanceData!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomMyCountPriceContainer(
                                  balanceData:
                                      settingsCubit!.myBalanceData![index],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          '. مجموعة ذهبية تساوي 200 نقطة ',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: kDarktBlue),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '. مجموعة ذهبية تساوي 200 نقطة ',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: kDarktBlue),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '. مجموعة ذهبية تساوي 200 نقطة ',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: kDarktBlue),
                        ),
                        SizedBox(height: 18.h),
                        const SizedBox(
                          width: double.infinity,
                        ),
                        settingsCubit!.usersGivenPoints.isEmpty
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.collegues,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  SizedBox(height: 18.h),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CustomReturnPointUserItem(
                                        user: settingsCubit!
                                            .usersGivenPoints[index],
                                      );
                                    },
                                    itemCount:
                                        settingsCubit!.usersGivenPoints.length,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
