import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  IconData iconDataPassword = Icons.visibility_off;

  IconData iconDataConfirmPassword = Icons.visibility_off;

  bool ifPasswordVisible = true;

  bool ifConfirmPasswordVisible = true;

  void isVisiblePasswordEye() {
    ifPasswordVisible = !ifPasswordVisible;
    iconDataPassword =
        ifPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(LoginPasswordVisibleEye());
  }

  void isVisibleConformPasswordEye() {
    ifConfirmPasswordVisible = !ifConfirmPasswordVisible;
    iconDataConfirmPassword =
        ifConfirmPasswordVisible ? Icons.visibility_off : Icons.remove_red_eye;
    emit(LoginConfirmPasswordVisibleEye());
  }

  static LoginCubit? get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController resetPasswordController = TextEditingController();

  TextEditingController verifyOtPhoneController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  var formScreenLoginrKey = GlobalKey<FormState>();

  var formScreenResetPasswordKey = GlobalKey<FormState>();

  var formVerifyOtpPhoneKey = GlobalKey<FormState>();

  var formVerifyPhoneKey = GlobalKey<FormState>();
}
