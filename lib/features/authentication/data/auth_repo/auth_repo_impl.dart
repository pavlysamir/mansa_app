import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/authentication/data/models/login_user_moodel.dart';

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
  Future<Either<String, LoginUserModel>> login(
      String phoneNum, String password) async {
    try {
      final response = await api.post(EndPoint.login, data: {
        'phoneNumber': '${'+2'}$phoneNum',
        'password': password,
      });

      var data = LoginUserModel.fromJson(response['data']);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: data.id);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.userName, value: data.userName);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: data.token);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.mobNumber, value: data.phoneNumber);

      if (data.picture != null && data.picture!.fileTypetId == 1) {
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.profilePic, value: data.picture!.url);
      }

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
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
      final response = await api.post(EndPoint.verifyOtpMobileNum, data: {
        'toPhone': '${'+2'}$mobileNo',
        'otp': otp,
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, void>> resendOtp({required String mobileNo}) async {
    try {
      final response =
          await api.post(EndPoint.resendOtp, data: {'${'+2'}$mobileNo'});

      return Right(response);
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
      final response = await api.post(EndPoint.signUp, data: {
        "userName": userName,
        "password": password,
        "phoneNumber": '${'+2'}$mobileNo',
        "registeraionGradeId": gradeId,
        "registeraionNumber": kedNum,
        "code": code
      });
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: response['data']);
      return Right(response['data']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  // Future<Either<String, void>> addFile({
  //   required String userId,
  //   required List<String> dataType,
  //   required List<dynamic> file,
  // }) async {
  //   try {
  //     // Create a list of maps for files
  //     List<Map<String, dynamic>> filesList = [];

  //     for (int i = 0; i < file.length; i++) {
  //       filesList.add({
  //         "file.file[$i].file": file[i],
  //         "file.file[$i].fileTypeId": dataType[i],
  //       });
  //     }

  //     // Prepare the data map with userId and files list
  //     Map<String, dynamic> data = {
  //       "file.userid": userId,
  //       "files": filesList,
  //     };

  //     final response =
  //         await api.post(EndPoint.addFile, isFromData: true, data: data);

  //     return Right(response);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage!);
  //   }
  // }

  @override
  Future<Either<String, String>> forgetPassword(
      {required String mobileNo}) async {
    try {
      final response = await api.post(EndPoint.forgotPassword, data: {
        'phoneNumber': '${'+2'}$mobileNo',
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, String>> verifyForgetPasswordOtp(
      {required String mobileNo,
      required String otp,
      required String newPassword}) async {
    try {
      final response = await api.post(EndPoint.verfyForgetPasswordOtp, data: {
        'phoneNumber': '${'+2'}$mobileNo',
        'otp': otp,
        'newPassword': newPassword,
      });

      return Right(response['message']);
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
}
