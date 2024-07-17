import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';

abstract class AuthRepo {
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration();

  Future<void> login(String email, String password);

  Future<Either<String, String>> verifyMobileNum({required String mobileNo});

  Future<Either<String, String>> verifyOtpMobileNum(
      {required String mobileNo, required String otp});

  Future<Either<String, void>> resendOtp({required String mobileNo});

  Future<Either<String, String>> signUp(
      {required String userName,
      required String password,
      required String mobileNo,
      required int gradeId,
      required String kedNum,
      required String code});
}
