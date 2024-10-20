import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_counter_point.dart';

class CustomReturnPointUserItem extends StatelessWidget {
  const CustomReturnPointUserItem({
    super.key,
    required this.user,
  });
  final GivenUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    child: const Icon(Icons.person),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.userData.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: kDarktBlue),
                        ),
                        Text(
                          user.userData.registrationGrade,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: kPrimaryKey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: CustomButtonLarge(
                        text: AppLocalizations.of(context)!.returnGroubs,
                        textColor: Colors.white,
                        function: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                PopUpDialogReturnPoints(
                              context: context,
                              function: () {
                                SettingsCubit.get(context)!.updateCount.clear();
                                Navigator.pop(context);
                              },
                              widget: Column(
                                children: [
                                  ListView.builder(
                                    itemCount: user.categories?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          CustomCounterPoint(
                                            catagoryData:
                                                user.categories?[index],
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      );
                                    },
                                  ),
                                  state is UpdateGiverPointsLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: kPrimaryKey,
                                          ),
                                        )
                                      : CustomButtonLarge(
                                          text: AppLocalizations.of(context)!
                                              .save,
                                          textColor: Colors.white,
                                          function: () {
                                            if (SettingsCubit.get(context)!
                                                    .updateCount !=
                                                []) {
                                              SettingsCubit.get(context)!
                                                  .updateGiverCountPoints(
                                                      lowyerId:
                                                          user.userData.userId,
                                                      isRedeem: false)
                                                  .then((value) {
                                                SettingsCubit.get(context)!
                                                    .getMyBalanceData();

                                                SettingsCubit.get(context)!
                                                    .getGivenUserPoints();
                                                Navigator.pop(context);
                                              });
                                            } else {
                                              return;
                                            }
                                          })
                                ],
                              ),
                              function2: () {},
                            ),
                          );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
