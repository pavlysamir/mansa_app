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
