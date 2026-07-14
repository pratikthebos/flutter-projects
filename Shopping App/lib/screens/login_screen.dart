// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../utils/colors.dart';
// import '../utils/constants.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_textfield.dart';
// import 'loading_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController usernameController = TextEditingController();
//
//   final TextEditingController passwordController = TextEditingController();
//
//   bool isPasswordHidden = true;
//
//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   void login() {
//     if (usernameController.text.trim() == "admin" &&
//         passwordController.text.trim() == "1234") {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const LoadingScreen(),
//         ),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const LoadingScreen(),
//         ),
//       );
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text("Invalid Username or Password"),
//       //     backgroundColor: Colors.red,
//       //   ),
//       // );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//
//               Lottie.asset(
//                 AppConstants.loginLottie,
//                 height: 360,
//               ),
//
//               const SizedBox(height: 20),
//
//               const Text(
//                 "Welcome Back",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const SizedBox(height: 8),
//
//               const Text(
//                 "Login to continue",
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//
//               const SizedBox(height: 35),
//
//               CustomTextField(
//                 controller: usernameController,
//                 hintText: "Username",
//                 icon: Icons.person,
//               ),
//
//               const SizedBox(height: 20),
//
//               TextField(
//                 controller: passwordController,
//                 obscureText: isPasswordHidden,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//
//                   prefixIcon: const Icon(Icons.lock),
//
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isPasswordHidden
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordHidden = !isPasswordHidden;
//                       });
//                     },
//                   ),
//
//                   filled: true,
//                   fillColor: Colors.white,
//
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//
//                   child: const Text(
//                     "Forgot Password?",
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               CustomButton(
//                 text: "LOGIN",
//                 onPressed: login,
//               ),
//
//               const SizedBox(height: 40),
//
//               // const Text(
//               //   "Demo Credentials",
//               //   style: TextStyle(
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               //
//               // const SizedBox(height: 8),
//               //
//               // const Text(
//               //   "Username : admin",
//               // ),
//               //
//               // const Text(
//               //   "Password : 1234",
//               // ),
//
//               const SizedBox(height: 40),
//
//               const Text(
//                 "Version 1.0.0",
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';
import 'loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final TextEditingController usernameController =
TextEditingController();

final TextEditingController passwordController =
TextEditingController();

bool isPasswordHidden = true;

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

void login() {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (_) => const LoadingScreen(),
),
);
}

InputDecoration inputDecoration(
String hint,
IconData icon,
) {
return InputDecoration(
hintText: hint,

hintStyle: const TextStyle(
color: Colors.grey,
fontSize: 15,
),

prefixIcon: Icon(
icon,
color: const Color(0xff1565C0),
),

suffixIcon: hint == "Password"
? IconButton(
icon: Icon(
isPasswordHidden
? Icons.visibility_outlined
: Icons.visibility_off_outlined,
),
onPressed: () {
setState(() {
isPasswordHidden =
!isPasswordHidden;
});
},
)
: null,

filled: true,

fillColor: Colors.white,

contentPadding:
const EdgeInsets.symmetric(
horizontal: 20,
vertical: 18,
),

enabledBorder:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(18),
borderSide: BorderSide.none,
),

focusedBorder:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(18),
borderSide:
const BorderSide(
color: Color(0xff1565C0),
width: 2,
),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,

body: Container(
width: double.infinity,

decoration: const BoxDecoration(
gradient: LinearGradient(
colors: [
Color(0xffffffff),
Color(0xfff5f5f5),
],
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
),
),

child: SafeArea(
child: SingleChildScrollView(
padding:
const EdgeInsets.symmetric(
horizontal: 25,
vertical: 20,
),

child: Column(
children: [

const SizedBox(height: 10),

Lottie.asset(
AppConstants.loginLottie,
height: 320,
),

const SizedBox(height: 20),

const Text(
"Welcome",
style: TextStyle(
fontSize: 34,
fontWeight:
FontWeight.bold,
),
),

const SizedBox(height: 10),

const Text(
"Sign in to continue",
style: TextStyle(
color: Colors.grey,
fontSize: 16,
),
),

const SizedBox(height: 40),

TextField(
controller:
usernameController,
decoration:
inputDecoration(
"Username",
Icons.person_outline,
),
),

const SizedBox(height: 20),

TextField(
controller:
passwordController,
obscureText:
isPasswordHidden,
decoration:
inputDecoration(
"Password",
Icons.lock_outline,
),
),

const SizedBox(height: 10),

Align(
alignment:
Alignment.centerRight,

child: TextButton(
onPressed: () {},

child: const Text(
"Forgot Password?",
style: TextStyle(
color:
Color(0xff1565C0),
fontWeight:
FontWeight.w600,
),
),
),
),

const SizedBox(height: 15),
  SizedBox(
    width: double.infinity,
    height: 58,
    child: ElevatedButton(
      onPressed: login,
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: const Color(0xff1565C0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login_rounded),
          SizedBox(width: 10),
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    ),
  ),

  const SizedBox(height: 40),

  const Divider(),

  const SizedBox(height: 20),

  // CircleAvatar(
  //   radius: 35,
  //   backgroundColor: Colors.white,
  //   child: Image.asset(
  //     AppConstants.logo,
  //     fit: BoxFit.contain,
  //   ),
  // ),

  const SizedBox(height: 15),

  const Text(
    "Enterprise Student Management",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
  ),

  const SizedBox(height: 8),

  const Text(
    "Powered by Flutter",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  ),

  const SizedBox(height: 30),

  Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Color(0xff1565C0),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "This is a demo login screen for the Student Management System.",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ),
      ],
    ),
  ),

  const SizedBox(height: 30),

  const Text(
    "Version 1.0.0",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  ),

  const SizedBox(height: 20),
],
),
),
),
),
);
}
}