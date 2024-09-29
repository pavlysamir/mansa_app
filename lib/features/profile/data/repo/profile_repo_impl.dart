import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

  @override
  Future<Either<String, PrrofileResponseData>> getProfileData(
      {required int id}) async {
    try {
      final response =
          await api.get(EndPoint.getProfileDataEndPoint, queryParameters: {
        'userId': id
        // getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
      });

      PrrofileResponseData profileData =
          PrrofileResponseData.fromJson(response);
      if (kDebugMode) {
        print(
            '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${profileData.responseData.profileData.name}');
      }
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.userName,
            value: profileData.responseData.profileData.name,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.address,
            value: profileData.responseData.profileData.address,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.email,
            value: profileData.responseData.profileData.email,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.mobNumber,
            value: profileData.responseData.profileData.mobileNo,
          );

      // getIt.get<CashHelperSharedPreferences>().saveData(
      //       key: ApiKey.specialization,
      //       value: profileData.responseData!.profileData!.specializationFields,
      //     );

      return Right(profileData);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, GetGivenCatagoriesCountModel>>
      getGiverCatagoriesCount() async {
    try {
      final response =
          await api.get(EndPoint.getGivenCategoriesCount, queryParameters: {
        'userId':
            getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
      });
      GetGivenCatagoriesCountModel categorisCount =
          GetGivenCatagoriesCountModel.fromJson(response);

      return Right(categorisCount);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, UserSortedModel>> getCurrentUserSorted(
      {required int id}) async {
    try {
      final response = await api
          .post(EndPoint.getCurrentUserSorted, queryParameters: {'userId': id});

      return Right(UserSortedModel.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> updateCountPonts(
      {required num lowyerId,
      required bool isRedeem,
      required List<Map> data}) async {
    try {
      final response = await api.put(EndPoint.updateCategoryCount, data: {
        "toLawyerId": lowyerId,
        "isRedeem": isRedeem,
        "categories": data
      });

      return Right(response['message'] ?? "");
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, GivenUsersResponseModel>> getGivenUserPoints() async {
    try {
      final response = await api.get(
        EndPoint.getUsersGivenPoints,
      );

      GivenUsersResponseModel givenUsersResponseModel =
          GivenUsersResponseModel.fromJson(response);

      return Right(givenUsersResponseModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, PrrofileResponseData>> getUserProfileData(
      {required int id}) async {
    try {
      final response =
          await api.get(EndPoint.getProfileDataEndPoint, queryParameters: {
        'userId': id
        // getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
      });

      PrrofileResponseData profileData =
          PrrofileResponseData.fromJson(response);

      return Right(profileData);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
