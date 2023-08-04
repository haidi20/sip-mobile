import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/models/auth.dart';
import 'package:sip/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepository {
  Future<AuthState> login({
    required String username,
    required String password,
  }) async {
    User user = User(name: "", roleId: 0);
    AuthState result = AuthState(user: user, isLoading: true);

    final String baseUrl = dotenv.env['BASE_URL'] ?? '';

    try {
      final dio = Dio();
      final response = await dio.get("$baseUrl/v1/login");
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final VmResponse getResponse = VmResponse.fromJson(responseData);

        if (getResponse.success) {
          result = AuthState(
            user: getResponse.data,
            token: getResponse.data.token,
            isLoading: false,
          );
        }

        // debugPrint(getResponse.data.toString());
      } else {
        // Handle other status codes (e.g., 404, 500, etc.)
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request
      debugPrint("Exception: $e");
    }

    return result;
  }
}

class VmResponse {
  bool success;
  User data;

  VmResponse({required this.data, required this.success});

  factory VmResponse.fromJson(Map<String, dynamic> json) {
    return VmResponse(
      success: json['success'],
      data: User.fromJson(json['data']),
    );
  }
}
