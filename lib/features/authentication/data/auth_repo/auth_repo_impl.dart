import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

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
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> verifyMobileNum(
      {required String mobileNo}) async {
    try {
      final response =
          await api.post(EndPoint.verifyMobileNum, queryParameters: {
        'MobileNo': '${'+2'}$mobileNo',
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> verifyOtpMobileNum(
      {required String mobileNo, required String otp}) async {
    try {
      final response = await api.post(EndPoint.verifyMobileNum, data: {
        'toPhone': '${'+2'}$mobileNo',
        'otp': otp,
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> resendOtp({required String mobileNo}) async {
    try {
      final response =
          await api.post(EndPoint.resendOtp, data: '${'+2'}$mobileNo');

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> signUp(
      {required String userName,
      required String password,
      required String mobileNo,
      required int gradeId,
      required String kedNum,
      required String code}) async {
    try {
      final response = await api.post(EndPoint.verifyMobileNum, data: {
        "userName": userName,
        "password": password,
        "phoneNumber": '${'+2'}$mobileNo',
        "registeraionGradeId": gradeId,
        "registeraionNumber": kedNum,
        "code": code
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
