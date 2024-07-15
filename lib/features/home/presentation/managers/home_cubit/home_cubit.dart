import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit? get(context) => BlocProvider.of(context);

  late TextEditingController olderOfAppController = TextEditingController();

  late TextEditingController olderOfAreaController = TextEditingController();

  late TextEditingController olderOfSpisicController = TextEditingController();
}
