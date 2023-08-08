part of 'auth_cubit.dart';

class AuthCubitState extends Equatable {
  final User? user;
  final DateTime? dateInLog;
  final String? token;
  final bool isLoading;
  final bool isLogout;
  final String? baseUrl;

  const AuthCubitState({
    this.user,
    this.dateInLog,
    this.token,
    this.isLoading = false,
    this.isLogout = false,
    this.baseUrl,
  });

  const AuthCubitState.init()
      : user = null,
        dateInLog = null,
        token = null,
        isLoading = false,
        isLogout = false,
        baseUrl = null;

  AuthCubitState copyWith(
      {User? user,
      DateTime? dateInLog,
      String? token,
      bool? isLoading,
      bool? isLogout,
      String? baseUrl}) {
    return AuthCubitState(
        user: user ?? this.user,
        dateInLog: dateInLog ?? this.dateInLog,
        token: token ?? this.token,
        isLoading: isLoading ?? this.isLoading,
        isLogout: isLogout ?? this.isLogout,
        baseUrl: baseUrl ?? this.baseUrl);
  }

  @override
  List<Object?> get props => [
        user,
        dateInLog,
        token,
        isLoading,
        isLogout,
        baseUrl,
      ];
}
