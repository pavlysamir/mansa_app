import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';

abstract class AuthRepo {
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration();

  Future<void> login(String email, String password);
}
