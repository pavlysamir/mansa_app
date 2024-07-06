part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterPasswordVisibleEye extends RegisterState {}

final class RegisterConfirmPasswordVisibleEye extends RegisterState {}

final class SuccessfulPickImage extends RegisterState {}

final class FailPickImage extends RegisterState {}

final class RemovePostImagePickedState extends RegisterState {}
