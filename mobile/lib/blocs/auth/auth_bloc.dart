import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sip/models/user.dart';
import 'package:sip/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription<AuthState> authStateSubscription;
  final AuthRepository _authRepository;

  AuthBloc({
    AuthRepository? authRepository,
  })  : _authRepository = AuthRepository(),
        super(AuthState.init()) {
    on<AuthLogin>(onLogin);
    on<AuthLogout>(onLogout);

    authStateSubscription = stream.listen(_onAuthStateChange);
  }

  // Method to handle state changes
  void _onAuthStateChange(AuthState state) {
    // Handle the state change here, update UI or perform actions based on the state
    // print("$state");
  }

  Future<void> onLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    // Get the input from the form
    String username = event.username;
    String password = event.password;

    emit(
      state.copyWith(isLoading: true),
    );

    // Call the login method in the AuthRepository
    AuthState getResponse = await _authRepository.login(
      username: username,
      password: password,
    );

    emit(
      state.copyWith(
        user: getResponse.user,
        token: getResponse.token,
        isLoading: false,
        baseUrl: getResponse.baseUrl,
      ),
    );
  }

  void onLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(user: User(name: "", roleId: 0), token: null),
    );
  }
}
