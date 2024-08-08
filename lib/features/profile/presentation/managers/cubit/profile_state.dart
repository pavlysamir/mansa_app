part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataSuccess extends ProfileState {}

final class GetProfileDataFail extends ProfileState {
  final String errMessage;
  GetProfileDataFail(this.errMessage);
}

final class GetProfileDataLoading extends ProfileState {}

final class GetGiverCategoriesCountSuccess extends ProfileState {}

final class GetGiverCategoriesCountFail extends ProfileState {
  final String errMessage;
  GetGiverCategoriesCountFail(this.errMessage);
}

final class GetGiverCategoriesCountLoading extends ProfileState {}

final class GetCurrentUserSortedLoading extends ProfileState {}

final class GetCurrentUserSortedSuccess extends ProfileState {}

final class GetCurrentUserSortedFailure extends ProfileState {
  final String message;
  GetCurrentUserSortedFailure({required this.message});
}

final class UpdateGiverPointsLoading extends ProfileState {}

final class UpdateGiverPointsSuccess extends ProfileState {
  final String message;

  UpdateGiverPointsSuccess(this.message);
}

final class UpdateGiverPointsFail extends ProfileState {
  final String errorMessage;

  UpdateGiverPointsFail(this.errorMessage);
}

final class GetUserGivenPointsLoading extends ProfileState {}

final class GetUserGivenPointsSuccess extends ProfileState {}

final class GetUserGivenPointsFail extends ProfileState {
  final String errorMessage;

  GetUserGivenPointsFail(this.errorMessage);
}
