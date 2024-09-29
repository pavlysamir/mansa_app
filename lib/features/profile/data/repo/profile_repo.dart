import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';

abstract class ProfileRepo {
  Future<Either<String, PrrofileResponseData>> getProfileData(
      {required int id});

  Future<Either<String, PrrofileResponseData>> getUserProfileData(
      {required int id});

  Future<Either<String, GetGivenCatagoriesCountModel>>
      getGiverCatagoriesCount();

  Future<Either<String, UserSortedModel>> getCurrentUserSorted(
      {required int id});

  Future<Either<String, String>> updateCountPonts(
      {required num lowyerId, required bool isRedeem, required List<Map> data});

  Future<Either<String, GivenUsersResponseModel>> getGivenUserPoints();
}
