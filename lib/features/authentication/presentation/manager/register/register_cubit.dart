import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepository) : super(RegisterInitial());

  final AuthRepo authRepository;

  IconData iconDataPassword = Icons.visibility_off;

  IconData iconDataConfirmPassword = Icons.visibility_off;

  bool ifPasswordVisible = true;

  bool ifConfirmPasswordVisible = true;

  static RegisterCubit? get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController verifyOtPhoneController = TextEditingController();

  TextEditingController kedDegreeController = TextEditingController();

  TextEditingController kedNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController hostingCodeController = TextEditingController();

  var formFirstScreenRegisterKey = GlobalKey<FormState>();

  var formVerifyOtpPhoneKey = GlobalKey<FormState>();

  var formSecondScreenRegisterKey = GlobalKey<FormState>();

  var formThirdScreenRegisterKey = GlobalKey<FormState>();

  void isVisiblePasswordEye() {
    ifPasswordVisible = !ifPasswordVisible;
    iconDataPassword =
        ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(RegisterPasswordVisibleEye());
  }

  void isVisibleConformPasswordEye() {
    ifConfirmPasswordVisible = !ifConfirmPasswordVisible;
    iconDataConfirmPassword =
        ifConfirmPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(RegisterConfirmPasswordVisibleEye());
  }

  String? base64FrontImage;
  File? fileFront;

  String? base64BackImage;
  File? fileBack;

  Future<void> pickCameraImage(int index) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Read the image file
      final bytes = await File(image.path).readAsBytes();
      // Decode the image
      img.Image? originalImage = img.decodeImage(bytes);

      if (originalImage != null) {
        // Resize the image to a smaller size (e.g., width 600 pixels)
        img.Image resizedImage = img.copyResize(originalImage, width: 600);

        // Compress the image (optional)
        List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 30);

        if (index == 1) {
          base64FrontImage = base64Encode(compressedBytes);
          fileFront = File(image.path);
        } else if (index == 2) {
          base64BackImage = base64Encode(compressedBytes);
          fileBack = File(image.path);
        }

        // Emit success state
        emit(SuccessfulPickImage());
      } else {
        emit(FailPickImage());
      }
    } else {
      emit(FailPickImage());
    }
  }

  void removePostImageFromDevice(int numOfImg) {
    if (numOfImg == 1) {
      // postImage1 = null;
      fileFront = null;
      emit(RemovePostImagePickedState());
    } else if (numOfImg == 2) {
      //postImage2 = null;

      fileBack = null;
      emit(RemovePostImagePickedState());
    }
  }

  List<GradesRegistrationModel> allGradesRegistration = [];
  List<String> namesOfGrades = [];
  Future<void> getAllGradesRegistration() async {
    emit(GetAllSubjectsRegistrationLoading());
    final response = await authRepository.getAllGradesRegistration();

    response.fold(
      (errMessage) => emit(GetAllGradesRegistrationFail(errMessage)),
      (allGrades) {
        allGradesRegistration = allGrades;
        for (var element in allGradesRegistration) {
          namesOfGrades.add(element.nameAr);
        }
        grade = namesOfGrades.first;
        gradeId = allGradesRegistration.first.id;
        emit(GetAllGradesRegistrationSuccess());
      },
    );
  }

  late String grade;
  late int gradeId;

  void selectGrade(String grade) {
    this.grade = grade;
    for (var element in allGradesRegistration) {
      if (element.nameAr == grade) {
        gradeId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.grade}  ${gradeId.toString()}');
    }
    emit(SelectedGradRegistration());
  }

  Future<void> cashedUserDataFirstScreen() async {
    emit(CashedFirstRegisterUserDataLoading());
    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: ApiKey.firstName, value: nameController.text);

    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: ApiKey.mobNumber, value: phoneController.text);

    emit(CashedFirstRegisterUserDataSuccess());
  }

  verifyMobileNum() async {
    emit(VerifyMobileNumLoading());

    final response =
        await authRepository.verifyMobileNum(mobileNo: phoneController.text);

    response.fold(
      (errMessage) => emit(VerifyMobileNumFaluir(errMessage)),
      (message) {
        emit(VerifyMobileNumSuccess(message));
      },
    );
  }

  verifyOtpMobileNum() async {
    emit(VerifyOtpMobileNumLoading());
    print(
        'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${verifyOtPhoneController.text}');
    final response = await authRepository.verifyOtpMobileNum(
        mobileNo: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.mobNumber),
        otp: verifyOtPhoneController.text);

    response.fold(
      (errMessage) => emit(VerifyOtpMobileNumFaluir(errMessage)),
      (message) {
        emit(VerifyOtpMobileNumSuccess(message));
      },
    );
  }

  resendOtp() async {
    emit(ResendOtpLoading());
    final response = await authRepository.resendOtp(
        mobileNo: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.mobNumber));

    response.fold(
      (errMessage) => emit(ResendOtpFaluir(errMessage)),
      (message) {
        emit(ResendOtpSuccess());
      },
    );
  }

  Future<void> cashedUserDataSecondScreen() async {
    emit(CashedSecondRegisterUserDataSuccess());
    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: ApiKey.kedId, value: gradeId);

    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: ApiKey.keNumber, value: kedNumberController.text);

    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: ApiKey.password, value: passwordController.text);

    emit(CashedSecondRegisterUserDataLoading());
  }

  Future<void> signUp() async {
    emit(SignUpLoading());
    final response = await authRepository.signUp(
        userName: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.firstName),
        password: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.password),
        mobileNo: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.mobNumber),
        gradeId:
            getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.kedId),
        code: hostingCodeController.text,
        kedNum: getIt
            .get<CashHelperSharedPreferences>()
            .getData(key: ApiKey.keNumber));

    response.fold(
      (errMessage) => emit(SignUpFaluir(errMessage)),
      (message) {
        emit(SignUpSuccess(message));
      },
    );
  }

  addFile() async {
    emit(AddFileLoading());
    final response = await authRepository.addFile(
      userId: getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
      dataType: ['1', '1'],
      file: [fileFront, fileBack],
    );

    response.fold(
      (errMessage) => emit(AddFileFaluir(errMessage)),
      (message) {
        emit(AddFileSuccess());
      },
    );
  }
}
