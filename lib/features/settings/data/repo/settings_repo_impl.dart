import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
import 'package:mansa_app/features/settings/data/models/balance_model.dart';
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
  Future<Either<String, List<GovernmentDataModel>>> getAllGovernment() async {
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
}
