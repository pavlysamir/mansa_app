import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  static ProfileCubit? get(context) => BlocProvider.of(context);

  TextEditingController olderOfAppController =
      TextEditingController(text: '00');

  TextEditingController olderOfAreaController =
      TextEditingController(text: '00');

  TextEditingController olderOfSpisicController =
      TextEditingController(text: '00');

  PrrofileResponseData? myProfileData;
  Future<void> getProfileData() async {
    // emit(GetMyBalanceLoading());
    final response = await profileRepo.getProfileData();

    response.fold(
      (errMessage) => emit(GetProfileDataFail(errMessage)),
      (profileData) {
        myProfileData = profileData.responseData;

        emit(GetProfileDataSuccess());
      },
    );
  }
}
