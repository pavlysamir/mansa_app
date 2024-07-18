import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration();
}
