part of 'auth_bloc.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoadingState extends AuthState{}
class SuccessLoginState extends AuthState{}
class SuccessRegesterState extends AuthState{}
class Registererrstate extends AuthState {
  final String error;
  Registererrstate({
    required this.error,
  });

  
}


class ShowpasswordState extends AuthState{}