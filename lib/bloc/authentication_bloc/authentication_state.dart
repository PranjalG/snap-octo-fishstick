part of 'authentication_bloc.dart';

final class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.mobileNum = '',
    this.password = '',
    this.isValid = false,
    this.error,
  });

  final String mobileNum;
  final String password;
  final bool isValid;
  final String? error;

  AuthenticationState copyWith({
    String? mobileNum,
    String? password,
    bool? isValid,
    String? error,
  }) {
    return AuthenticationState(
        mobileNum: mobileNum ?? this.mobileNum,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        mobileNum,
        password,
        isValid,
        error,
      ];
}

final class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess(
      {super.mobileNum, super.password, super.isValid, super.error});
}

final class AuthenticationFailure extends AuthenticationState {
  AuthenticationFailure({super.error});
}
