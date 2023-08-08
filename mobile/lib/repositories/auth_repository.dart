import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepository {
  Future<AuthState> login({
    required String name,
    required String password,
  }) async {
    const String baseUrlEnv =
        String.fromEnvironment("BASE_URL", defaultValue: "");
    String baseUrl = dotenv.env['BASE_URL'] ?? "";
    String getBaseUrl = baseUrlEnv != "" ? baseUrlEnv : baseUrl;

    AuthState result = const AuthState();

    try {
      final dio = Dio();
      final response = await dio.post(
        "$getBaseUrl/v1/login",
        data: {
          'name': name,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // await Future.delayed(
        //   const Duration(seconds: 2),
        // );

        final responseData = response.data as Map<String, dynamic>;
        final VmResponse getResponse = VmResponse.fromJson(responseData);

        if (getResponse.status == EStatus.success) {
          User user = User(
            id: getResponse.data.user!.id,
            name: getResponse.data.user!.name,
            roleId: getResponse.data.user!.roleId,
          );

          result = AuthState(
            user: user,
            token: getResponse.data.token,
            isLoading: false,
            baseUrl: getBaseUrl,
          );
        } else {
          //
        }

        // debugPrint(getResponse.data.user!.toJson().toString());
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

enum EStatus {
  success,
  error,
}

extension EStatusExtension on EStatus {
  String toStringValue() {
    return toString().split('.').last;
  }

  static EStatus fromString(String value) {
    return EStatus.values.firstWhere(
      (status) => status.toStringValue() == value,
      orElse: () => EStatus.error,
    );
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}

class VmResponse {
  EStatus status;
  Data data;

  VmResponse({required this.data, required this.status});

  factory VmResponse.fromJson(Map<String, dynamic> json) {
    return VmResponse(
      status: EStatusExtension.fromString(json['status']),
      data: Data.fromJson(json['data']),
    );
  }
}
