class UserModel {
  final int id;
  final String username;
  final String email;
  final String role;
  final String department;
  final String token;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.department,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      role: json["role"],
      department: json["department"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "role": role,
      "department": department,
      "token": token,
    };
  }
}