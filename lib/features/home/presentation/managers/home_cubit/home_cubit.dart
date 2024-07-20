import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  static HomeCubit? get(context) => BlocProvider.of(context);

  late TextEditingController olderOfAppController = TextEditingController();

  late TextEditingController olderOfAreaController = TextEditingController();

  late TextEditingController olderOfSpisicController = TextEditingController();

  UserSortedModel? userSortedModel;
  getCurrentUserSorted() async {
    emit(GetCurrentUserSortedLoading());
    final response = await homeRepo.getCurrentUserSorted();

    response.fold(
      (errMessage) => emit(GetCurrentUserSortedFailure(message: errMessage)),
      (getCurrentUser) {
        userSortedModel = getCurrentUser;
        olderOfAppController = TextEditingController(
          text: getCurrentUser.generalSorting.toString(),
        );
        olderOfAreaController = TextEditingController(
          text: getCurrentUser.district.toString(),
        );
        olderOfSpisicController = TextEditingController(
          text: getCurrentUser.specializationField.toString(),
        );
        emit(GetCurrentUserSortedSuccess());
      },
    );
  }
}
