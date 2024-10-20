part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetCurrentUserSortedLoading extends HomeState {}

final class GetCurrentUserSortedSuccess extends HomeState {}

final class GetCurrentUserSortedFailure extends HomeState {
  final String message;
  GetCurrentUserSortedFailure({required this.message});
}

final class GetAllUsersLoading extends HomeState {}

final class GetMoreUsersLoading extends HomeState {}

final class GetAllUsersSuccess extends HomeState {}

final class GetAllUsersFailure extends HomeState {
  final String message;
  GetAllUsersFailure({required this.message});
}

final class GetUserGivenPointsLoading extends HomeState {}

final class GetUserGivenPointsSuccess extends HomeState {}

final class GetUserGivenPointsFail extends HomeState {
  final String errorMessage;

  GetUserGivenPointsFail(this.errorMessage);
}
