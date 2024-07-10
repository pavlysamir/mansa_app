part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginPasswordVisibleEye extends LoginState {}

final class LoginConfirmPasswordVisibleEye extends LoginState {}
