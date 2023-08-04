part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class AuthLogin extends AuthEvent {
  final String username;
  final String password;

  AuthLogin(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
