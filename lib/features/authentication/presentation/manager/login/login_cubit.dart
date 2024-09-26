import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  final AuthRepo authRepository;

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

  login() async {
    emit(LoginLoading());
    final response = await authRepository.login(
        emailController.text, passwordController.text);

    response.fold(
      (errMessage) => emit(LoginFailure(message: errMessage)),
      (login) {
        emit(LoginSuccess());
      },
    );
  }

  forgetPassword() async {
    emit(ForgetPasswordLoading());
    getIt.get<CashHelperSharedPreferences>().saveData(
        key: ApiKey.resetPasswordNumber, value: resetPasswordController.text);
    final response = await authRepository.forgetPassword(
      mobileNo: resetPasswordController.text,
    );

    response.fold(
      (errMessage) => emit(ForgetPasswordFailure(message: errMessage)),
      (login) {
        emit(ForgetPasswordSuccess());
      },
    );
  }

  verifyNumberOtpforgetPassword() async {
    emit(EditNewPasswordLoading());

    final response = await authRepository.verifyForgetPasswordOtp(
      mobileNo: getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.resetPasswordNumber),
      newPassword: newPasswordController.text,
      otp: getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.resetPasswordNumberOtp),
    );

    response.fold(
      (errMessage) => emit(EditNewPasswordFailure(message: errMessage)),
      (login) {
        emit(EditNewPasswordSuccess());
        resetPasswordController.clear();
      },
    );
  }

  clearData() {
    emailController.clear();
    passwordController.clear();
    // resetPasswordController.clear();
    // verifyOtPhoneController.clear();
    // newPasswordController.clear();
    // confirmNewPasswordController.clear();
  }
}
