part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User? user;
  final DateTime? dateInLog;
  final String? token;
  final bool isLoading;
  final String? baseUrl;

  const AuthState({
    this.user,
    this.dateInLog,
    this.token,
    this.isLoading = false,
    this.baseUrl,
  });

  // Create an initial state with default values
  factory AuthState.init() {
    return AuthState(
      user: User(name: "", roleId: 0),
      dateInLog: null,
      token: null,
      isLoading: false,
      baseUrl: null, // Initialize with your desired base URL
    );
  }

  AuthState copyWith({
    User? user,
    DateTime? dateInLog,
    String? token,
    bool? isLoading,
    String? baseUrl,
  }) {
    return AuthState(
      user: this.user,
      dateInLog: dateInLog ?? this.dateInLog,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  List<Object?> get props => [user, dateInLog, token, isLoading, baseUrl];
}
