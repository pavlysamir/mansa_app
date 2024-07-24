import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
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
}
