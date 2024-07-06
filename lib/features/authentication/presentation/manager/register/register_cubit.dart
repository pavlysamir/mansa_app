import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

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
}
