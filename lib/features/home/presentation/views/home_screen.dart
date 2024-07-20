import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_cointiner_olders.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_lawyer_data_item.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_title_appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const CustomTitleAppBar(),
            actions: [
              IconButton(
                icon: Icon(
                  IconlyLight.search,
                  size: 24.dg,
                ),
                onPressed: () {
                  customJustGoNavigate(
                      context: context, path: AppRouter.kSearchScreen);
                },
              ),
              SizedBox(width: 10.w),
              IconButton(
                icon: Icon(
                  IconlyLight.notification,
                  size: 24.dg,
                ),
                onPressed: () {
                  customJustGoNavigate(
                      context: context, path: AppRouter.kNotificationScreen);
                },
              ),
              SizedBox(width: 10.w),
            ],
          ),
          body: state is GetCurrentUserSortedLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: Column(
                      children: [
                        CustomHomeContainerOlders(
                          city: HomeCubit.get(context)!.userSortedModel!.city,
                          registrationGrade: HomeCubit.get(context)!
                              .userSortedModel!
                              .registrationGrade,
                          controller1:
                              HomeCubit.get(context)!.olderOfAppController,
                          controller2:
                              HomeCubit.get(context)!.olderOfAreaController,
                          controller3:
                              HomeCubit.get(context)!.olderOfSpisicController,
                        ),
                        SizedBox(height: 10.h),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const CustomLowyerDataItem();
                          },
                          itemCount: 10,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
