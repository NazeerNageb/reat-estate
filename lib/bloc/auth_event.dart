part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoignEvent extends AuthEvent {
 final String email;
 final String password;
  LoignEvent({
    required this.email,
    required this.password,
  });
}
class RegesterEvent extends AuthEvent {
 final String email;
 final String password;
 final String phone;
 RegesterEvent({
    required this.email,
    required this.password,
    required this.phone
  });
}

class ShowpasswordEvent extends AuthEvent {} 
