import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/models/user.dart';
import 'package:sip/repositories/auth_repository.dart';

part "auth_cubit_state.dart";

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepository _authRepository;

  AuthCubit({
    AuthRepository? authRepository,
  })  : _authRepository = AuthRepository(),
        super(const AuthCubitState.init()) {
    init();
  }

  void init() {
    emit(const AuthCubitState.init());
  }

  Future<void> onLogin(
    User user,
  ) async {
    // Get the input from the form
    String? name = user.name ?? "";
    String? password = user.password ?? "";

    emit(
      state.copyWith(isLoading: true),
    );

    // Call the login method in the AuthRepository
    AuthCubitState getResponse = await _authRepository.login(
      name: name,
      password: password,
    );

    emit(
      state.copyWith(
        user: getResponse.user,
        token: getResponse.token,
        isLoading: false,
        isLogout: false,
        baseUrl: getResponse.baseUrl,
      ),
    );
  }

  void onLogout() async {
    emit(
      state.copyWith(
        user: User(),
        token: "",
        baseUrl: null,
        isLogout: true,
      ),
    );
  }
}
