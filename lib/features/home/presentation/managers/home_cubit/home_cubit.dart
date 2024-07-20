import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  static HomeCubit? get(context) => BlocProvider.of(context);

  TextEditingController olderOfAppController = TextEditingController();

  TextEditingController olderOfAreaController = TextEditingController();

  TextEditingController olderOfSpisicController = TextEditingController();

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
        getAllUsers(1);
      },
    );
  }

  List<User> users = [];
  getAllUsers(int pageNumber) async {
    if (pageNumber == 1) {
      emit(GetAllUsersLoading());
    } else {
      emit(GetMoreUsersLoading());
    }
    final response = await homeRepo.getAllUsers(pageNumber: pageNumber);
    response.fold((errMessage) => emit(GetAllUsersFailure(message: errMessage)),
        (getAllUsers) {
      users.addAll(getAllUsers.responseData.items);
      emit(GetAllUsersSuccess());
    });
  }
}
