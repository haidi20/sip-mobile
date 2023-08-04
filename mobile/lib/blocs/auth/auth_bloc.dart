import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
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

    authStateSubscription = stream.listen(_onAuthStateChange);
  }

  // Method to handle state changes
  void _onAuthStateChange(AuthState state) {
    // Handle the state change here, update UI or perform actions based on the state
    // debugPrint("ProductBloc State Change: $state");
  }

  Future<void> onLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    // Get the input from the form
    String username = event.username;
    String password = event.password;

    emit(
      state.copyWith(user: User(name: "", roleId: 0), isLoading: true),
    );

    // Call the login method in the AuthRepository
    AuthState getResponse = await _authRepository.login();

    emit(
      state.copyWith(
          user: getResponse.user, token: getResponse.token, isLoading: false),
    );
  }
}
