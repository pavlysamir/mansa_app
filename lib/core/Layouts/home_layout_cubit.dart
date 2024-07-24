import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/home/presentation/views/home_screen.dart';
import 'package:mansa_app/features/profile/presentation/views/profile_screen.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:mansa_app/features/settings/presentation/views/settings_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;
  List screens = [
    const SettingsScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(HomeChaneNavBar());
  }
}
