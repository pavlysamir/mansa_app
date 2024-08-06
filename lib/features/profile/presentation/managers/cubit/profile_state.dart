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
