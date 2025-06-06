part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthDataMobileEntered extends AuthenticationEvent {
  const AuthDataMobileEntered(
    this.mobileNum,
  );

  final String mobileNum;
}

class AuthPassWordEntered extends AuthenticationEvent {
  const AuthPassWordEntered(this.password);

  final String password;
}

class AuthLoginRequested extends AuthenticationEvent {
  const AuthLoginRequested();
}

class AuthLogoutRequested extends AuthenticationEvent {
  const AuthLogoutRequested();
}

class AuthDataValidate extends AuthenticationEvent {
  const AuthDataValidate();
}
