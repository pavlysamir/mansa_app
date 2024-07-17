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
