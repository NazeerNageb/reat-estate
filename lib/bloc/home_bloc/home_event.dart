part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangeScreenEvent extends HomeEvent {
 final int val;
  ChangeScreenEvent({
    required this.val,
  });
}
