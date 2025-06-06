import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layout/main.dart';

import '../../resources/constants.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState()) {
    on<AuthDataMobileEntered>(_onAuthMobileEntered);
    on<AuthPassWordEntered>(_onAuthPassWordEntered);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthDataValidate>(_onAuthDataValidate);
  }

  void _onAuthMobileEntered(
      AuthDataMobileEntered event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(mobileNum: event.mobileNum));
    add(AuthDataValidate());
  }

  void _onAuthPassWordEntered(
      AuthPassWordEntered event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(password: event.password));
    add(AuthDataValidate());
  }

  void _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthenticationState> emit) {
    if (state.mobileNum == '1234567890' && state.password == 'Password1!') {
      emit(AuthenticationSuccess());
      prefs.setBool(isLoggedIn, true);
    } else {
      emit(AuthenticationFailure(error: 'Login Failed'));
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthenticationState> emit) {
    prefs.setBool(isLoggedIn, false);
    prefs.clear();
    emit(AuthenticationFailure(error: 'You have logged out'));
  }

  void _onAuthDataValidate(
      AuthDataValidate event, Emitter<AuthenticationState> emit) {
    String validationError;
    bool isEnabled = false;

    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

    if (state.mobileNum.isEmpty || state.password.isEmpty) {
      validationError = 'Empty Field';
    } else if (!regex.hasMatch(state.password)) {
      validationError =
          'Please use at least 1 capital letter, 1 small letter, 1 symbol, 1 number, and make password 8 characters long';
    } else if (state.mobileNum.length < 10) {
      validationError = 'Mobile Number Invalid';
    } else {
      validationError = '';
      isEnabled = true;
    }
    emit(state.copyWith(error: validationError, isValid: isEnabled));
  }
}
