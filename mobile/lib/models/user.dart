class User {
  int? id;
  String? name;
  String? password;
  int? roleId;
  String? roleName;
  List<String>? permissions;

  User({
    this.id = 0,
    this.name = "",
    this.password = "",
    this.roleId = 0,
    this.roleName = "",
    this.permissions = const [],
  });

  // Factory method to create a User object from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'no name',
      password: json['password'] ?? '',
      roleId: json['role_id'] ?? 0,
      roleName: json['role_name'] ?? '',
      permissions: List<String>.from(json['permissions'] ?? []),
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'password': password,
      'role_id': roleId.toString(),
      'role_name': roleName,
      'permissions': permissions,
    };
  }
}
