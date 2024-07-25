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
