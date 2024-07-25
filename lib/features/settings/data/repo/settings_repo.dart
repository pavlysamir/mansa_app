import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';

abstract class SettingsRepo {
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration();

  Future<Either<String, List<AvailibalityWorkModel>>> getAllAvailabalityWork();
  Future<Either<String, List<GovernmentDataModel>>> getAllGovernment();
  Future<Either<String, List<GovernmentDataModel>>> getAllDistrict();
  Future<Either<String, List<GovernmentDataModel>>> getAllBarAssociations();
  Future<Either<String, List<GovernmentDataModel>>> getAllGeneralLawBachelor();
  Future<Either<String, List<GovernmentDataModel>>> getAllGrantingUniversity();
  Future<Either<String, List<GovernmentDataModel>>> getAllPostgraduateStudy();
  Future<Either<String, List<GovernmentDataModel>>> getAllSpecializationField();
}