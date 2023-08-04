class User {
  BigInt? id;
  String name;
  String? password;
  int roleId;
  String? roleName;

  User({
    this.id,
    required this.name,
    this.password,
    required this.roleId,
    this.roleName,
  });

  // Factory method to create a User object from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: BigInt.from(json['id']),
      name: json['name'],
      password: json['password'],
      roleId: json['role_id'],
      roleName: json['role_name'],
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'password': password,
      'role_id': roleId,
      'role_name': roleName,
    };
  }
}
