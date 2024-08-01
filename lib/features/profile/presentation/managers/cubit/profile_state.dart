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
