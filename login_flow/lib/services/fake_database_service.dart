import '../models/user_model.dart';

class FakeDatabaseService {
  Future<UserModel?> verifyUser(
      String username,
      String password,
      ) async {
    // Simulate database query delay
    await Future.delayed(const Duration(seconds: 2));

    if (username == "student" && password == "123456") {
      return const UserModel(
        id: 101,
        username: "student",
        email: "student@company.com",
        role: "Flutter Developer",
        department: "Mobile Engineering",
        token: "",
      );
    }

    return null;
  }
}