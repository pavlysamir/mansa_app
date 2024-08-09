import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/core/utils/widgets/custom_listview_loading_indicator.dart';
import 'package:mansa_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_cointiner_olders.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_lawyer_data_item.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_title_appBar.dart';
import 'package:mansa_app/features/search/presentation/widgets/item_dating_listview_loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;
  bool isLoading = false;
  int pageNum = 2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    HomeCubit.get(context)!.getCurrentUserSorted();
    // HomeCubit.get(context)!
    //     .getAllUsers(pageNumber: pageNum); // Fetch initial data
    _scrollController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController!.position.pixels >=
            0.7 * _scrollController!.position.maxScrollExtent &&
        !isLoading) {
      if (HomeCubit.get(context)!.count! !=
          HomeCubit.get(context)!.users.length) {
        isLoading = true;
        if (kDebugMode) {
          print("bavlyyyyyyyyyyyyyy${++pageNum}");
        }
        await HomeCubit.get(context)!.getAllUsers(pageNum++);
        isLoading = false;
      } else {
        null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // You can handle additional state changes if necessary
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              forceMaterialTransparency: true,
              title: const CustomTitleAppBar(),
              actions: [
                IconButton(
                  icon: Icon(
                    IconlyLight.search,
                    size: 24.r,
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
                    size: 24.r,
                  ),
                  onPressed: () {
                    customJustGoNavigate(
                        context: context, path: AppRouter.kNotificationScreen);
                  },
                ),
                SizedBox(width: 10.w),
              ],
            ),
            body: state is GetAllUsersFailure
                ? const Center(
                    child: Text('There is a problem'),
                  )
                : state is GetAllUsersSuccess ||
                        state is GetMoreUsersLoading ||
                        state is GetCurrentUserSortedSuccess
                    ? SingleChildScrollView(
                        controller: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Ensure alignment
                            children: [
                              CustomHomeContainerOlders(
                                city: HomeCubit.get(context)!
                                        .userSortedModel!
                                        .city ??
                                    0,
                                registrationGrade: HomeCubit.get(context)!
                                    .userSortedModel!
                                    .registrationGrade,
                                controller1: HomeCubit.get(context)!
                                    .olderOfAppController,
                                controller2: HomeCubit.get(context)!
                                    .olderOfAreaController,
                                controller3: HomeCubit.get(context)!
                                    .olderOfSpisicController,
                              ),
                              SizedBox(height: 10.h),
                              const Divider(),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CustomLowyerDataItem(
                                    user: HomeCubit.get(context)!.users[index],
                                  );
                                },
                                itemCount: HomeCubit.get(context)!.users.length,
                              ),
                              // if (isLoading)
                              //   const Padding(
                              //     padding: EdgeInsets.all(8.0),
                              //     child: CircularProgressIndicator(
                              //         color: kPrimaryKey),
                              //   ),
                            ],
                          ),
                        ),
                      )
                    : const CustomListViewLoadingIndicator(
                        widget: ListViewItemLoadingIndicator(),
                      ));
      },
    );
  }
}
