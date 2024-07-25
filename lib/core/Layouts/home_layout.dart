import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mansa_app/core/Layouts/home_layout_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            bottomNavigationBar: Container(
              height: 70.h,
              decoration: const BoxDecoration(
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Colors.grey,
                  //     width: 1.0,
                  //   ),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: BottomNavigationBar(
                mouseCursor: MouseCursor.defer,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      IconlyLight.setting,
                    ),
                    label: AppLocalizations.of(context)!.setting,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      IconlyLight.home,
                    ),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      IconlyLight.profile,
                    ),
                    label: AppLocalizations.of(context)!.profile,
                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
