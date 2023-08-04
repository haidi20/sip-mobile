part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User user;
  final DateTime? dateInLog;
  final String? token;
  final bool isLoading;

  const AuthState({
    required this.user,
    this.dateInLog,
    this.token,
    this.isLoading = false,
  });

  // Create an initial state with default values
  factory AuthState.init() {
    return AuthState(
      user: User(name: "", roleId: 0),
      dateInLog: null,
      token: null,
      isLoading: false,
    );
  }

  AuthState copyWith({
    required User user,
    DateTime? dateInLog,
    String? token,
    bool? isLoading,
  }) {
    return AuthState(
      user: this.user,
      dateInLog: dateInLog ?? this.dateInLog,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [user, dateInLog, token, isLoading];
}
