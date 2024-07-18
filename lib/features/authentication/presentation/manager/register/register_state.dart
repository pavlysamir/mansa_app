part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterPasswordVisibleEye extends RegisterState {}

final class RegisterConfirmPasswordVisibleEye extends RegisterState {}

final class SuccessfulPickImage extends RegisterState {}

final class FailPickImage extends RegisterState {}

final class RemovePostImagePickedState extends RegisterState {}

final class GetAllGradesRegistrationSuccess extends RegisterState {}

final class GetAllGradesRegistrationFail extends RegisterState {
  final String errorMessage;

  GetAllGradesRegistrationFail(this.errorMessage);
}

final class GetAllSubjectsRegistrationLoading extends RegisterState {}

final class SelectedGradRegistration extends RegisterState {}

final class CashedFirstRegisterUserDataSuccess extends RegisterState {}

final class CashedFirstRegisterUserDataLoading extends RegisterState {}

final class VerifyMobileNumSuccess extends RegisterState {
  final String message;

  VerifyMobileNumSuccess(this.message);
}

final class VerifyMobileNumLoading extends RegisterState {}

final class VerifyMobileNumFaluir extends RegisterState {
  final String errorMessage;

  VerifyMobileNumFaluir(this.errorMessage);
}

final class VerifyOtpMobileNumSuccess extends RegisterState {
  final String message;

  VerifyOtpMobileNumSuccess(this.message);
}

final class VerifyOtpMobileNumLoading extends RegisterState {}

final class VerifyOtpMobileNumFaluir extends RegisterState {
  final String errorMessage;

  VerifyOtpMobileNumFaluir(this.errorMessage);
}

final class ResendOtpSuccess extends RegisterState {}

final class ResendOtpLoading extends RegisterState {}

final class ResendOtpFaluir extends RegisterState {
  final String errorMessage;

  ResendOtpFaluir(this.errorMessage);
}

final class CashedSecondRegisterUserDataSuccess extends RegisterState {}

final class CashedSecondRegisterUserDataLoading extends RegisterState {}

final class SignUpSuccess extends RegisterState {
  final String message;

  SignUpSuccess(this.message);
}

final class SignUpLoading extends RegisterState {}

final class SignUpFaluir extends RegisterState {
  final String errorMessage;

  SignUpFaluir(this.errorMessage);
}

final class AddFileLoading extends RegisterState {}

final class AddFileFaluir extends RegisterState {
  final String errorMessage;

  AddFileFaluir(this.errorMessage);
}

final class AddFileSuccess extends RegisterState {}
