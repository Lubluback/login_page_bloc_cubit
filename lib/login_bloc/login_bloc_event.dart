part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocEvent {}

class LoginSubmitted extends LoginBlocEvent {
  final String email;
  final String password;
  LoginSubmitted(this.email, this.password);
}

class EmailChanged extends LoginBlocEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginBlocEvent {
  final String password;
  PasswordChanged(this.password);
}

class PasswordVisibility extends LoginBlocEvent {
  final bool isPasswordVisible;
  PasswordVisibility(this.isPasswordVisible);
}
