part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class SuccessLoginState extends AuthState{}
class SuccessRegesterState extends AuthState{}
class ShowpasswordState extends AuthState{}