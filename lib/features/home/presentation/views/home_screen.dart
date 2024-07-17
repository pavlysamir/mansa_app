import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mansa_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_cointiner_olders.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_lawyer_data_item.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_title_appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController olderOfAppController;
  late TextEditingController olderOfAreaController;
  late TextEditingController olderOfSpisicController;

  @override
  void initState() {
    super.initState();
    olderOfAppController = TextEditingController(text: '0000');
    olderOfAreaController = TextEditingController(text: '0000');
    olderOfSpisicController = TextEditingController(text: '0000');
  }

  // @override
  // void dispose() {
  //   olderOfAppController.dispose();
  //   olderOfAreaController.dispose();
  //   olderOfSpisicController.dispose();
  //   super.dispose();
  // }

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
                onPressed: () {},
              ),
              SizedBox(width: 10.w),
              IconButton(
                icon: Icon(
                  IconlyLight.notification,
                  size: 24.dg,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 10.w),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                children: [
                  CustomHomeContainerOlders(
                    controller1: olderOfAppController,
                    controller2: olderOfAreaController,
                    controller3: olderOfSpisicController,
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
