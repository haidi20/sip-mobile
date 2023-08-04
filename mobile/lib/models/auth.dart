import 'package:sip/models/user.dart';

class Auth {
  final User user;
  final DateTime? dateInLog;
  final String? token;
  final bool isLoading;

  Auth({
    required this.user,
    this.dateInLog,
    this.token,
    this.isLoading = false,
  });

  // Named constructor to create an Auth from JSON data
  Auth.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        dateInLog = json['dateInLog'],
        token = json['token'],
        isLoading = json['isLoading'];

  // Convert our Auth to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'dateInLog': dateInLog,
        'token': token,
        'isLoading': isLoading,
      };
}
