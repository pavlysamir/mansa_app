import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';
import 'package:mansa_app/features/profile/data/models/get_given_catagories_count_model.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';

abstract class ProfileRepo {
  Future<Either<String, PrrofileResponseData>> getProfileData();

  Future<Either<String, GetGivenCatagoriesCountModel>>
      getGiverCatagoriesCount();

  Future<Either<String, UserSortedModel>> getCurrentUserSorted();
}
