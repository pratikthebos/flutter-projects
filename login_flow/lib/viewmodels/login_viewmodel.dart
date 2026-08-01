import 'package:flutter/material.dart';

import '../repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository repository =
  AuthRepository();

  final usernameController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  bool loading = false;

  Future<bool> login() async {
    loading = true;

    notifyListeners();

    try {
      final response =
      await repository.login(
        username:
        usernameController.text.trim(),
        password:
        passwordController.text.trim(),
      );

      loading = false;

      notifyListeners();

      return response.statusCode == 200;
    } catch (e) {
      loading = false;

      notifyListeners();

      return false;
    }
  }
}