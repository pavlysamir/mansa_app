import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  getAllGradesRegistration() async {
    emit(GetAllSubjectsRegistrationLoading());
    final response = await authRepository.getAllGradesRegistration();

    response.fold(
      (errMessage) => emit(GetAllGradesRegistrationFail(errMessage)),
      (allGrades) {
        allGradesRegistration = allGrades;
        for (var element in allGradesRegistration) {
          namesOfGrades.add(element.nameAr);
        }
        emit(GetAllGradesRegistrationSuccess());
      },
    );
  }

  String? grade;
  int? gradeId;

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
}
