part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginPasswordVisibleEye extends LoginState {}

final class LoginConfirmPasswordVisibleEye extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

final class LoginLoading extends LoginState {}

final class ForgetPasswordSuccess extends LoginState {}

final class ForgetPasswordFailure extends LoginState {
  final String message;
  ForgetPasswordFailure({required this.message});
}

final class ForgetPasswordLoading extends LoginState {}

final class EditNewPasswordSuccess extends LoginState {}

final class EditNewPasswordFailure extends LoginState {
  final String message;
  EditNewPasswordFailure({required this.message});
}

final class EditNewPasswordLoading extends LoginState {}
