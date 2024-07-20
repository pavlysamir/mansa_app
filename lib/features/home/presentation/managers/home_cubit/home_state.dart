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
