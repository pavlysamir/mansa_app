part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SuccessfulPickImage extends SettingsState {}

final class FailPickImage extends SettingsState {}

final class SelectedGradRegistration extends SettingsState {}

final class GetAllGradesRegistrationSuccess extends SettingsState {}

final class GetAllGradesRegistrationFail extends SettingsState {
  final String errorMessage;

  GetAllGradesRegistrationFail(this.errorMessage);
}

final class GetAllSubjectsRegistrationLoading extends SettingsState {}

final class ClearData extends SettingsState {}

final class GetAllAvalabalityOfWorkSuccess extends SettingsState {}

final class GetAllAvalabalityOfWorkFail extends SettingsState {
  final String errorMessage;

  GetAllAvalabalityOfWorkFail(this.errorMessage);
}

final class GetAllAvalabalityOfWorkLoading extends SettingsState {}

final class GetAllGovernmentsSuccess extends SettingsState {}

final class GetAllGovernmentsFail extends SettingsState {
  final String errorMessage;

  GetAllGovernmentsFail(this.errorMessage);
}

final class GetAllGovernmentsLoading extends SettingsState {}

final class GetAllDistrictsSuccess extends SettingsState {}

final class GetAllDistrictsFail extends SettingsState {
  final String errorMessage;

  GetAllDistrictsFail(this.errorMessage);
}

final class GetAllDistrictsLoading extends SettingsState {}

final class SelectedGovernment extends SettingsState {}

final class SelectedDistrict extends SettingsState {}

final class SelectedAssociation extends SettingsState {}

final class SelectedSpecializationField extends SettingsState {}

final class SelectedPostgraduateStudy extends SettingsState {}

final class SelectedGrantingUniversity extends SettingsState {}

final class SelectedGeneralLawBachelor extends SettingsState {}

final class TriggerFunctionSuccess extends SettingsState {}

final class TriggerFunctionLoading extends SettingsState {}

final class SearchClick extends SettingsState {}

final class ChangeLanguageSuccess extends SettingsState {}

final class ChangeThemeSuccess extends SettingsState {}

final class GetProfileSettingLoading extends SettingsState {}

final class GetProfileSettingSuccess extends SettingsState {}

final class GetProfileSettingFail extends SettingsState {
  final String errorMessage;

  GetProfileSettingFail(this.errorMessage);
}

final class GetMyBalanceLoading extends SettingsState {}

final class GetMyBalanceSuccess extends SettingsState {}

final class GetMyBalanceFail extends SettingsState {
  final String errorMessage;

  GetMyBalanceFail(this.errorMessage);
}

final class GetUserGivenPointsLoading extends SettingsState {}

final class GetUserGivenPointsSuccess extends SettingsState {}

final class GetUserGivenPointsFail extends SettingsState {
  final String errorMessage;

  GetUserGivenPointsFail(this.errorMessage);
}

final class LogOutLoading extends SettingsState {}

final class LogOutSuccess extends SettingsState {}

final class LogOutFail extends SettingsState {
  final String errorMessage;

  LogOutFail(this.errorMessage);
}

final class UpdateGiverPointsLoading extends SettingsState {}

final class UpdateGiverPointsSuccess extends SettingsState {
  final String message;

  UpdateGiverPointsSuccess(this.message);
}

final class UpdateGiverPointsFail extends SettingsState {
  final String errorMessage;

  UpdateGiverPointsFail(this.errorMessage);
}

final class UpdateLaawyerDataLoading extends SettingsState {}

final class UpdateLaawyerDataSuccess extends SettingsState {}

final class UpdateLaawyerDatatsFail extends SettingsState {
  final String errorMessage;

  UpdateLaawyerDatatsFail(this.errorMessage);
}

final class CheckFauild extends SettingsState {}

final class AddFileLoading extends SettingsState {}

final class AddFileFaluir extends SettingsState {
  final String errorMessage;

  AddFileFaluir(this.errorMessage);
}

final class AddFileSuccess extends SettingsState {}

final class GetFileLoading extends SettingsState {}

final class GetFileFaluir extends SettingsState {
  final String errorMessage;

  GetFileFaluir(this.errorMessage);
}

final class GetFileSuccess extends SettingsState {}

final class DeleteAccountLoading extends SettingsState {}

final class DeleteAccountFaluir extends SettingsState {
  final String errorMessage;

  DeleteAccountFaluir(this.errorMessage);
}

final class DeleteAccountSuccess extends SettingsState {
  final String message;

  DeleteAccountSuccess(this.message);
}

final class SearchInDistricSuccessfully extends SettingsState {}
