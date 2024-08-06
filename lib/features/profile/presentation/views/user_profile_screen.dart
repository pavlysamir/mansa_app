import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_cointiner_olders.dart';
import 'package:mansa_app/features/profile/presentation/managers/cubit/profile_cubit.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_userData_cointaner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_counter_point.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController? olderOfAppController;
  TextEditingController? olderOfAreaController;
  TextEditingController? olderOfSpisicController;
  @override
  void initState() {
    olderOfAppController = TextEditingController(text: '00');

    olderOfAreaController = TextEditingController(text: '00');

    olderOfSpisicController = TextEditingController(text: '00');
    super.initState();
  }

  @override
  void dispose() {
    olderOfAppController!.dispose();
    olderOfAreaController!.dispose();
    olderOfSpisicController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      widget: const SizedBox(), function2: () {},
                      // const Column(
                      //   children: [
                      //     CustomCounterPoint(
                      //       text: 'مجموعة ذهبية',
                      //     ),
                      //     SizedBox(height: 10),
                      //     CustomCounterPoint(
                      //       text: 'مجموعة فضية',
                      //     ),
                      //     SizedBox(height: 10),
                      //     CustomCounterPoint(
                      //       text: 'مجموعة برونزية',
                      //     ),
                      //     SizedBox(height: 10),
                      //   ],
                      // ),
                    ),
                  );
                },
                textColor: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
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
                    'User Name',
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: CustomHomeContainerOlders(
                      city: 0,
                      registrationGrade: 0,
                      controller1: olderOfAppController!,
                      controller2: olderOfAreaController!,
                      controller3: olderOfSpisicController!,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color:

                                //  user.availableWork[0] == 'متاح للعمل'
                                //     ? Colors.green
                                //     : user.availableWork[0] == 'متاح لانجاز مهمة'
                                //         ? kPrimaryKey
                                //         : user.availableWork[0] == 'مطلوب للعمل '
                                //             ? Colors.red
                                //             :
                                kDarktBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            //user.availableWork[0] ?? '',
                            'متاح لانجاز مهمة',
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
                            '“ متاح لانجاز مهمة خلال ايام الاحد و الاثنين و الجمعة من  الساعة 7 صباحاً “',
                            style: Theme.of(context).textTheme.bodyMedium!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  // const CustomUserdataCointaner(),
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
                              style: Theme.of(context).textTheme.bodyMedium),
                          Icon(
                            Icons.mail,
                            color: kDarktBlue,
                            size: 40.r,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('الهاتف',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Icon(
                            Icons.call,
                            color: kDarktBlue,
                            size: 40.r,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
