part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeScreenState extends HomeState {
  final int val;
  ChangeScreenState({
    required this.val,
  });
}
