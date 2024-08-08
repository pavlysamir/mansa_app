import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_cointiner_olders.dart';
import 'package:mansa_app/features/profile/presentation/managers/cubit/profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_userData_cointaner.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_counter_point.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key, required this.user});
  final User user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ProfileCubit? profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context);
    profileCubit!.getUserProfileData(id: widget.user.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final profileData =
            profileCubit?.userProfileData?.responseData.profileData;
        final userPictureUrl = profileData?.picture?.url;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButtonLarge(
              text: AppLocalizations.of(context)!.supportWithGroubs,
              function: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUpDialogReturnPoints(
                    context: context,
                    function: () {
                      Navigator.pop(context);
                    },
                    widget: Column(
                      children: [
                        if (profileCubit != null &&
                            profileCubit!.categoryData.isNotEmpty)
                          ListView.builder(
                            itemCount: profileCubit!.categoryData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomCounterPoint(
                                    catagoryData: profileCubit!
                                        .usersGivenPoints[index]
                                        .categories[index],
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              );
                            },
                          ),
                        if (state is UpdateGiverPointsLoading)
                          const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kPrimaryKey,
                            ),
                          )
                        else
                          CustomButtonLarge(
                            text: AppLocalizations.of(context)!.save,
                            textColor: Colors.white,
                            function: () {
                              if (profileCubit != null &&
                                  profileCubit!.updateCount.isNotEmpty) {
                                profileCubit!
                                    .updateGiverCountPoints(
                                  lowyerId: widget.user.userId,
                                )
                                    .then((value) {
                                  profileCubit!.getGivenUserPoints();
                                  Navigator.pop(context);
                                });
                              } else {
                                return;
                              }
                            },
                          ),
                      ],
                    ),
                    function2: () {},
                  ),
                );
              },
              textColor: Colors.white,
            ),
          ),
          body: state is GetProfileDataLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryKey,
                ))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.h,
                        backgroundColor: kBlackColor,
                        child: userPictureUrl != null
                            ? ClipOval(
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                            color: kBlackColor,
                                          ),
                                        ),
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    imageUrl: userPictureUrl),
                              )
                            : Icon(
                                Icons.person,
                                size: 50.h,
                                color: Colors.white,
                              ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text(
                        widget.user.name,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: kDarktBlue),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text('درجة القيد - التخصص الأ ساسي ',
                          style: Theme.of(context).textTheme.headlineLarge!),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: CustomHomeContainerOlders(
                          city: ProfileCubit.get(context)!
                                  .userSortedModel!
                                  .city ??
                              0,
                          registrationGrade: ProfileCubit.get(context)!
                              .userSortedModel!
                              .registrationGrade,
                          controller1:
                              ProfileCubit.get(context)!.olderOfAppController,
                          controller2:
                              ProfileCubit.get(context)!.olderOfAreaController,
                          controller3: ProfileCubit.get(context)!
                              .olderOfSpisicController,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: const Divider(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      profileData?.availableWorks == []
                          ? const SizedBox()
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: profileData?.availableWorks.length,
                              itemBuilder: (context, index) {
                                final availableWork =
                                    profileData!.availableWorks[index];
                                return SizedBox(
                                  height: 40.h,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: availableWork.name ==
                                                        'متاح للعمل'
                                                    ? Colors.green
                                                    : availableWork.name ==
                                                            'متاح لانجاز مهمة'
                                                        ? kPrimaryKey
                                                        : availableWork.name ==
                                                                'مطلوب للعمل '
                                                            ? Colors.red
                                                            : kDarktBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                availableWork.name,
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
                                                        .userProfileData!
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
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomUserdataCointaner(
                        myProfileData:
                            profileCubit!.userProfileData!.responseData,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.contactWithMe,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('البريد',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Icon(
                                Icons.mail,
                                color: kDarktBlue,
                                size: 40.r,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              Uri mail = Uri.parse(
                                  "mailto:$email?subject=$subject&body= ");
                              if (await launchUrl(mail)) {
                                //email app opened
                              } else {
                                if (kDebugMode) {
                                  print('not working');
                                }
                              }
                            },
                            child: GestureDetector(
                              onTap: () async {
                                Uri mail =
                                    Uri.parse('tel:${widget.user.mobileNum}');
                                if (await launchUrl(mail)) {
                                  //email app opened
                                } else {
                                  if (kDebugMode) {
                                    print('not working');
                                  }
                                }
                              },
                              child: Column(
                                children: [
                                  Text('الهاتف',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  Icon(
                                    Icons.call,
                                    color: kDarktBlue,
                                    size: 40.r,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
