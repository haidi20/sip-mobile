part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class AuthLogin extends AuthEvent {
  final String name;
  final String password;

  AuthLogin({required this.name, required this.password});

  @override
  List<Object?> get props => [name, password];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class AuthIsLogin extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}
