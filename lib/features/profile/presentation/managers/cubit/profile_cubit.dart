import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';
import 'package:meta/meta.dart';
import '../../../../../constants.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  static ProfileCubit? get(context) => BlocProvider.of(context);

  TextEditingController olderOfAppController = TextEditingController();

  TextEditingController olderOfAreaController = TextEditingController();

  TextEditingController olderOfSpisicController = TextEditingController();

  UserSortedModel? userSortedModel;
  getCurrentUserSorted({required int id}) async {
    // emit(GetCurrentUserSortedLoading());
    final response = await profileRepo.getCurrentUserSorted(id: id);

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
        // emit(GetCurrentUserSortedSuccess());
        //  getAllUsers(1);
      },
    );
  }

  PrrofileResponseData? myProfileData;
  Future<void> getProfileData() async {
    emit(GetProfileDataLoading());

    // // Retrieve the id from shared preferences and convert it to an integer
    // final String idString =
    //     getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id);
    // final int id =
    //     int.tryParse(idString) ?? 0; // Default to 0 or handle error if parsing fails

    final response = await profileRepo.getProfileData(
        id: getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id));

    response.fold(
      (errMessage) => emit(GetProfileDataFail(errMessage)),
      (profileData) async {
        myProfileData = profileData;

        await getGivenCatagoriesCount();
        await getCurrentUserSorted(
            id: getIt
                .get<CashHelperSharedPreferences>()
                .getData(key: ApiKey.id));

        emit(GetProfileDataSuccess());
      },
    );
  }

  PrrofileResponseData? userProfileData;
  Future<void> getUserProfileData({required int id}) async {
    emit(GetProfileDataLoading());
    final response = await profileRepo.getUserProfileData(id: id);

    response.fold(
      (errMessage) => emit(GetProfileDataFail(errMessage)),
      (profileData) async {
        userProfileData = profileData;

        // await getGivenCatagoriesCount();
        await getCurrentUserSorted(id: id);

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

  GetGivenCatagoriesCountModel? giverUserCategoriesCount;
  List<CategoryMedalData> categoryUserData = [];
  Future<void> getUserGivenCatagoriesCount() async {
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
    names = [];
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

  getAddressDistric(int index) {
    for (var element in allDistrictConst) {
      if (element.id == index) {
        return element.nameAr;
      } else {
        return '';
      }
    }
  }

  getAddressGovernment(int index) {
    for (var element in allGovernmentConst) {
      if (element.id == index) {
        return element.nameAr;
      } else {
        return '';
      }
    }
  }

  List<Map> updateCount = [];

  Future<void> updateGiverCountPoints({
    required num lowyerId,
  }) async {
    emit(UpdateGiverPointsLoading());

    final response = await profileRepo.updateCountPonts(
      lowyerId: lowyerId,
      data: updateCount,
    );
    response.fold(
      (errMessage) {
        emit(UpdateGiverPointsFail(errMessage));
        updateCount = [];
      },
      (response) {
        emit(UpdateGiverPointsSuccess(response));
        updateCount = [];
      },
    );
  }

  GivenUsersResponseModel? givenUsersResponseModel;
  List<GivenUser> usersGivenPoints = [];

  Future<void> getGivenUserPoints() async {
    emit(GetUserGivenPointsLoading());
    final response = await profileRepo.getGivenUserPoints();

    response.fold(
      (errMessage) => emit(GetUserGivenPointsFail(errMessage)),
      (usersGiven) {
        givenUsersResponseModel = usersGiven;
        usersGivenPoints = usersGiven.responseData.givenUsers;

        emit(GetUserGivenPointsSuccess());
      },
    );
  }
}
