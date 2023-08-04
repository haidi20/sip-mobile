part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class AuthLogin extends AuthEvent {
  final String username;
  final String password;

  AuthLogin({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}
