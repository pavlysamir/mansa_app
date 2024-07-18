import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/authentication/data/models/login_user_moodel.dart';

abstract class AuthRepo {
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration();

  Future<Either<String, LoginUserModel>> login(
      String phoneNum, String password);

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

  Future<Either<String, void>> addFile({
    required String userId,
    required List<String> dataType,
    required List<dynamic> file,
  });

  Future<Either<String, String>> forgetPassword({required String mobileNo});

  Future<Either<String, String>> verifyForgetPasswordOtp(
      {required String mobileNo,
      required String otp,
      required String newPassword});
}
