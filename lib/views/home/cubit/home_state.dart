part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class LoadingPosts extends HomeState {}

class SuccessPosts extends HomeState {}

class ErrorPosts extends HomeState {}
