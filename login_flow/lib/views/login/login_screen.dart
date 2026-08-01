import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

import '../../core/widgets/gradient_button.dart';

import '../../widgets/login_form.dart';

import '../../viewmodels/login_viewmodel.dart';

import '../flow/login_flow_screen.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(24),

          children: [

            const SizedBox(height: 20),

            Container(

              width: 90,

              height: 90,

              decoration: BoxDecoration(

                gradient: AppColors.primaryGradient,

                borderRadius: BorderRadius.circular(25),

              ),

              child: const Icon(

                Icons.login,

                color: Colors.white,

                size: 45,

              ),

            ),

            const SizedBox(height: 30),

            const Text(

              "Learn Login Flow",

              style: TextStyle(

                fontSize: 34,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            const Text(

              "Understand how Flutter, API, Backend, Database and JWT work together.",

              style: TextStyle(

                color: AppColors.subtitle,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 35),

            const LoginForm(),

            const SizedBox(height: 30),

            GradientButton(

              text: "Start Learning",

              loading: vm.loading,

              onTap: () async {

                bool ok = await vm.login();

                if(ok){

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_)=>const LoginFlowScreen(),

                    ),

                  );

                }

              },

            ),

            const SizedBox(height: 35),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(24),

              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    "Demo Credentials",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  SizedBox(height:12),

                  Text("Username : student"),

                  SizedBox(height:5),

                  Text("Password : 123456"),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}