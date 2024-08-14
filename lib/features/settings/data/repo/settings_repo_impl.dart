import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
import 'package:mansa_app/features/settings/data/models/balance_model.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';
import 'package:mansa_app/features/settings/data/models/profile_setting_model.dart';
import 'package:mansa_app/features/settings/data/repo/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  final ApiConsumer api;
  SettingsRepoImpl({required this.api});

  @override
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration() async {
    try {
      final response = await api.get(
        EndPoint.getAllGradesRegistration,
      );
      List<GradesRegistrationModel> allGradesRegistration = [];
      for (var element in response) {
        allGradesRegistration.add(GradesRegistrationModel.fromJson(element));
      }

      return Right(allGradesRegistration);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<AvailibalityWorkModel>>>
      getAllAvailabalityWork() async {
    try {
      final response = await api.get(
        EndPoint.getAllAvailabilityWork,
      );
      List<AvailibalityWorkModel> allAvailibalityWork = [];
      for (var element in response) {
        allAvailibalityWork.add(AvailibalityWorkModel.fromJson(element));
      }

      return Right(allAvailibalityWork);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>> getAllDistrict() async {
    try {
      final response = await api.get(
        EndPoint.getAllDistricts,
      );
      List<GovernmentDataModel> allDistricts = [];
      for (var element in response) {
        allDistricts.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allDistricts);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>> getAllGovernment() async {
    try {
      final response = await api.get(
        EndPoint.getAllGovernorate,
      );
      List<GovernmentDataModel> allGovernments = [];
      for (var element in response) {
        allGovernments.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allGovernments);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>>
      getAllBarAssociations() async {
    try {
      final response = await api.get(
        EndPoint.getAllBarAssociations,
      );
      List<GovernmentDataModel> allBarAssociations = [];
      for (var element in response) {
        allBarAssociations.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allBarAssociations);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>>
      getAllGeneralLawBachelor() async {
    try {
      final response = await api.get(
        EndPoint.getAllGeneralLawBachelor,
      );
      List<GovernmentDataModel> allGeneralLawBachelor = [];
      for (var element in response) {
        allGeneralLawBachelor.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allGeneralLawBachelor);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>>
      getAllGrantingUniversity() async {
    try {
      final response = await api.get(
        EndPoint.getAllGrantingUniversity,
      );
      List<GovernmentDataModel> allGrantingUniversity = [];
      for (var element in response) {
        allGrantingUniversity.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allGrantingUniversity);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>>
      getAllPostgraduateStudy() async {
    try {
      final response = await api.get(
        EndPoint.getAllPostgraduateStudy,
      );
      List<GovernmentDataModel> allPostgraduateStudy = [];
      for (var element in response) {
        allPostgraduateStudy.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allPostgraduateStudy);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, List<GovernmentDataModel>>>
      getAllSpecializationField() async {
    try {
      final response = await api.get(
        EndPoint.getAllSpecializationField,
      );
      List<GovernmentDataModel> allSpecializationField = [];
      for (var element in response) {
        allSpecializationField.add(GovernmentDataModel.fromJson(element));
      }

      return Right(allSpecializationField);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, ProfileSettingModel>> getProfileSettingsData() async {
    try {
      final response = await api.post(
        EndPoint.getProfileSetting,
      );
      ProfileSettingModel profileSettingsData =
          ProfileSettingModel.fromJson(response);
      // Additional processing if needed (e.g., caching, transforming data)

      return Right(profileSettingsData);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, BalanceModel>> getMybalance() async {
    try {
      final response = await api.get(
        EndPoint.getMyBalance,
      );
      BalanceModel myBalanceData = BalanceModel.fromJson(response);
      // Additional processing if needed (e.g., caching, transforming data)

      return Right(myBalanceData);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> deleteAccount() async {
    try {
      final response = await api.delete(EndPoint.deleteAccount,
          queryParameters: {
            'userId':
                getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id)
          });

      return Right(response['message']);
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
  Future<Either<String, String>> updateCountPonts(
      {required num lowyerId, required List<Map> data}) async {
    try {
      final response = await api.put(EndPoint.updateCategoryCount,
          data: {"toLawyerId": lowyerId, "categories": data});

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, void>> updateProfileSettings(
      {required Map<String, dynamic> data}) async {
    try {
      // Map<String, dynamic> data = lawyerData.toMap();
      final response = await api.put(EndPoint.updateUserData, data: data);

      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, void>> addFile(
      {required String userId,
      required List<String> dataType,
      required List<File> file}) async {
    try {
      // Create FormData
      FormData formData = FormData();

      // Add userId field
      formData.fields.add(MapEntry("file.userid", userId));

      // Add files and their types
      for (int i = 0; i < file.length; i++) {
        formData.fields.add(MapEntry("file.file[$i].fileTypeId", dataType[i]));
        formData.files.add(
          MapEntry(
            "file.file[$i].file",
            await MultipartFile.fromFile(file[i].path,
                filename: file[i].path.split('/').last),
          ),
        );
      }

      // Sending the request
      final response = await Dio()
          .post('http://16.171.141.127/File/AddFile', data: formData);

      // Check the response and return accordingly
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left('Failed to upload files');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }

  @override
  Future<Either<String, void>> getFile({
    required int userId,
  }) async {
    try {
      final response = await api.post(
        EndPoint.getFile,
        queryParameters: {
          'filetypeId': '1',
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, void>> updateFile(
      {required String userId,
      required List<String> dataType,
      required List<File> file}) async {
    try {
      // Create FormData
      FormData formData = FormData();

      // Add userId field
      formData.fields.add(MapEntry("file.userid", userId));

      // Add files and their types
      for (int i = 0; i < file.length; i++) {
        formData.fields.add(MapEntry("file.file[$i].fileTypeId", dataType[i]));
        formData.files.add(
          MapEntry(
            "file.file[$i].file",
            await MultipartFile.fromFile(file[i].path,
                filename: file[i].path.split('/').last),
          ),
        );
      }

      // Sending the request
      final response = await Dio()
          .put('http://16.171.141.127/File/UpdateFile', data: formData);

      // Check the response and return accordingly
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left('Failed to upload files');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }
}
