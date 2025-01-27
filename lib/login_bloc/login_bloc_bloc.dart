import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocState.initial()) {
    on<EmailChanged>(_handleEmailChanged);
    on<PasswordChanged>(_handlePasswordChanged);
    on<LoginSubmitted>(_handleLoginSubmitted);
    on<PasswordVisibility>(isPasswordVisible);
  }

  void _handleEmailChanged(EmailChanged event, Emitter<LoginBlocState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _handlePasswordChanged(
      PasswordChanged event, Emitter<LoginBlocState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _handleLoginSubmitted(
      LoginSubmitted event, Emitter<LoginBlocState> emit) {
    emit(
        state.copyWith( isFailure: false, isSuccess: false));

    if (state.email == event.email && state.password == event.password) {
      emit(state.copyWith( isSuccess: true));
    } else {
      emit(state.copyWith( isFailure: true));
    }
  }

  void isPasswordVisible(
      PasswordVisibility event, Emitter<LoginBlocState> emit) {
    emit(state.copyWith(
      isPasswordVisible: event.isPasswordVisible,
    ));
  }
}
