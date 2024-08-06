import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
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
    emit(GetProfileDataLoading());
    final response = await profileRepo.getProfileData();

    response.fold(
      (errMessage) => emit(GetProfileDataFail(errMessage)),
      (profileData) async {
        myProfileData = profileData;

        await getGivenCatagoriesCount();

        emit(GetProfileDataSuccess());
      },
    );
  }

  GetGivenCatagoriesCountModel? giverCategoriesCount;
  List<CategoryMedalData> categoryData = [];
  Future<void> getGivenCatagoriesCount() async {
    final response = await profileRepo.getGiverCatagoriesCount();

    response.fold(
      (errMessage) => emit(GetGiverCategoriesCountFail(errMessage)),
      (giverCounts) {
        giverCategoriesCount = giverCounts;
        categoryData = giverCounts.responseData;
      },
    );
  }

  List<String> medalImages = [
    AssetsData.bronzeMedal,
    AssetsData.silverMedal,
    AssetsData.goldenMedal
  ];

  getNkabaName(int index) {
    for (var element in allBarAssociationsConst) {
      if (element.id == index) {
        return element.nameAr;
      } else {
        return '';
      }
    }
  }

  List<String> names = [];

  getSpacializationName(List<SpecializationField> specializationFields) {
    for (var element in specializationFields) {
      names.add(element.name);
    }
    return names.join('-');
  }

  getBacaloryName(int index) {
    for (var element in allGeneralLawConst) {
      if (element.id == index) {
        return element.nameAr;
      } else {
        return '';
      }
    }
  }
}
