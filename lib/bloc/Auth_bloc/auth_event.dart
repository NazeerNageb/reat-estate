part of 'auth_bloc.dart';


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
 final File ?image;
 RegesterEvent({
    required this.email,
    required this.password,
    required this.phone,
     this.image
  });
}

class ShowpasswordEvent extends AuthEvent {} 
