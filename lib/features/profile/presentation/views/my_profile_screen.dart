import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/profile/presentation/managers/cubit/profile_cubit.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_medal_groubs_container.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_userData_cointaner.dart';
import 'package:mansa_app/features/profile/presentation/widgets/icon_profile_appBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileCubit? profileCubit;
  @override
  void initState() {
    profileCubit = ProfileCubit.get(context);

    profileCubit!.getProfileData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconProfileAppBar(
              function: () {
                customJustGoNavigate(
                    context: context, path: AppRouter.kEditProfileScreen);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is GetProfileDataLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kPrimaryKey,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: kBlackColor,
                          radius: 50.r,
                          child: ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 80.r,
                              color: Colors.white,
                            ),

                            //  CachedNetworkImage(
                            //   width: double.infinity,
                            //   fit: BoxFit.fitHeight,
                            //   imageUrl: userModel!.image!,
                            //   placeholder: (context, url) => const Center(
                            //     child: CircularProgressIndicator(
                            //         color: kPrimaryKey, strokeWidth: 1),
                            //   ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          getIt
                              .get<CashHelperSharedPreferences>()
                              .getData(key: ApiKey.userName),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: kDarktBlue),
                        ),
                        Text('درجة القيد - التخصص الأ ساسي ',
                            style: Theme.of(context).textTheme.headlineLarge!),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(AppLocalizations.of(context)!.giftedGroubs,
                            style: Theme.of(context).textTheme.headlineLarge!),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: SizedBox(
                              height: 120.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: profileCubit!.giverCategoriesCount!
                                      .responseData.length,
                                  itemBuilder: (context, index) {
                                    return CustomMedalGroubsContainer(
                                      img: profileCubit!.medalImages[index],
                                      category:
                                          profileCubit!.categoryData[index],
                                    );
                                  }),
                            )),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: const Divider(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.horizontal,
                            itemCount: profileCubit!.myProfileData!.responseData
                                .profileData.availableWorks.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 30.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: profileCubit!
                                                      .myProfileData!
                                                      .responseData
                                                      .profileData
                                                      .availableWorks[index]
                                                      .name ==
                                                  'متاح للعمل'
                                              ? Colors.green
                                              : profileCubit!
                                                          .myProfileData!
                                                          .responseData
                                                          .profileData
                                                          .availableWorks[index]
                                                          .name ==
                                                      'متاح لانجاز مهمة'
                                                  ? kPrimaryKey
                                                  : profileCubit!
                                                              .myProfileData!
                                                              .responseData
                                                              .profileData
                                                              .availableWorks[
                                                                  index]
                                                              .name ==
                                                          'مطلوب للعمل '
                                                      ? Colors.red
                                                      : kDarktBlue,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          //user.availableWork[0] ?? '',
                                          profileCubit!
                                              .myProfileData!
                                              .responseData
                                              .profileData
                                              .availableWorks[index]
                                              .name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Expanded(
                                        child: Text(
                                          profileCubit!
                                                  .myProfileData!
                                                  .responseData
                                                  .profileData
                                                  .availableWorks[index]
                                                  .description ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomUserdataCointaner(
                          myProfileData:
                              profileCubit!.myProfileData!.responseData,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    );
            },
          ),
        ));
  }
}
