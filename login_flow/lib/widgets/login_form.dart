import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/login_viewmodel.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    // Prefill only once
    if (vm.usernameController.text.isEmpty) {
      vm.usernameController.text = "student";
    }

    if (vm.passwordController.text.isEmpty) {
      vm.passwordController.text = "123456";
    }

    return Column(
      children: [

        TextField(
          controller: vm.usernameController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "student",

            prefixIcon: const Icon(Icons.person),

            suffixIcon: const Icon(
              Icons.verified_user,
              color: Colors.green,
            ),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: vm.passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "123456",

            prefixIcon: const Icon(Icons.lock),

            suffixIcon: const Icon(
              Icons.visibility_off,
              color: Colors.grey,
            ),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Demo Credentials\nUsername : student@company.com\nPassword : Password@123",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}