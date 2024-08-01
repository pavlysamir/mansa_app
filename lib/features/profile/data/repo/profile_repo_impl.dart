import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

  @override
  Future<Either<String, ProfileResponse>> getProfileData() async {
    try {
      final response =
          await api.get(EndPoint.getProfileDataEndPoint, queryParameters: {
        'userId':
            getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
      });

      ProfileResponse profileData = ProfileResponse.fromJson(response);
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.userName,
            value: profileData.responseData!.profileData!.name,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.address,
            value: profileData.responseData!.profileData!.address,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.email,
            value: profileData.responseData!.profileData!.email,
          );
      getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.mobNumber,
            value: profileData.responseData!.profileData!.mobileNo,
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
}
