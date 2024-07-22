part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchClick extends SearchState {}

final class GetAllGradesRegistrationSuccess extends SearchState {}

final class GetAllGradesRegistrationFail extends SearchState {
  final String errorMessage;

  GetAllGradesRegistrationFail(this.errorMessage);
}

final class GetAllSubjectsRegistrationLoading extends SearchState {}

final class GetAllAvalabalityOfWorkSuccess extends SearchState {}

final class GetAllAvalabalityOfWorkFail extends SearchState {
  final String errorMessage;

  GetAllAvalabalityOfWorkFail(this.errorMessage);
}

final class GetAllAvalabalityOfWorkLoading extends SearchState {}

final class GetAllGovernmentsSuccess extends SearchState {}

final class GetAllGovernmentsFail extends SearchState {
  final String errorMessage;

  GetAllGovernmentsFail(this.errorMessage);
}

final class GetAllGovernmentsLoading extends SearchState {}

final class GetAllDistrictsSuccess extends SearchState {}

final class GetAllDistrictsFail extends SearchState {
  final String errorMessage;

  GetAllDistrictsFail(this.errorMessage);
}

final class GetAllDistrictsLoading extends SearchState {}

final class SelectedGovernment extends SearchState {}

final class SelectedDistrict extends SearchState {}

final class TriggerFunctionSuccess extends SearchState {}

final class TriggerFunctionLoading extends SearchState {}

final class GetSearchedUsersLoading extends SearchState {}

final class GetMoreUsersLoading extends SearchState {}

final class GetSearchedUsersSuccess extends SearchState {}

final class GetMoreSearchedUsersSuccess extends SearchState {}

final class GetSearchedUsersFailure extends SearchState {
  final String message;
  GetSearchedUsersFailure({required this.message});
}

final class ClearData extends SearchState {}
