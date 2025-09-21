part of 'Auth.dart';

@immutable
abstract class AuthEvent {}

class RegisterSubmitted extends AuthEvent {
  final String email, codigo, password;
  RegisterSubmitted(this.email, this.codigo, this.password);
}

class LoginSubmitted extends AuthEvent {
  final String email, password;
  LoginSubmitted(this.email, this.password);
}

class LogoutRequested extends AuthEvent {}