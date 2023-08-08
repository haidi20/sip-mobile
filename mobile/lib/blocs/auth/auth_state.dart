part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User? user;
  final DateTime? dateInLog;
  final String? token;
  final bool isLoading;
  final bool isLogout;
  final String? baseUrl;

  const AuthState({
    this.user,
    this.dateInLog,
    this.token,
    this.isLoading = false,
    this.isLogout = false,
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
    bool? isLogout,
    String? baseUrl,
  }) {
    return AuthState(
      user: user ?? this.user,
      dateInLog: dateInLog ?? this.dateInLog,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      isLogout: isLogout ?? this.isLogout,
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  List<Object?> get props =>
      [user, dateInLog, token, isLoading, isLogout, baseUrl];
}
