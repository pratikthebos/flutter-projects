import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../services/aes_service.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../widgets/animated_output.dart';
import '../widgets/cyber_button.dart';
import '../widgets/cyber_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final TextEditingController controller =
TextEditingController();

String encryptedText = "";

String decryptedText = "";

bool encryptAnimation = false;

bool decryptAnimation = false;

bool isEncrypting = false;

bool isDecrypting = false;

Future<void> encrypt() async {

if (controller.text.trim().isEmpty) {
return;
}

setState(() {

isEncrypting = true;

encryptedText = "";

decryptedText = "";

encryptAnimation = false;

decryptAnimation = false;

});

await Future.delayed(
const Duration(seconds: 1),
);

final encrypted =
AESService.instance.encryptText(
controller.text,
);

setState(() {

  encryptedText = encrypted;

encryptAnimation = true;

isEncrypting = false;

});
}

Future<void> decrypt() async {

if (encryptedText.isEmpty) {
return;
}

setState(() {

isDecrypting = true;

decryptedText = "";

decryptAnimation = false;

});

await Future.delayed(
const Duration(seconds: 1),
);

final result =
AESService.instance.decryptText(
encryptedText,
);

setState(() {

decryptedText = result;

decryptAnimation = true;

isDecrypting = false;

});
}

void copy(String text) {

Clipboard.setData(
ClipboardData(text: text),
);

ScaffoldMessenger.of(context).showSnackBar(

const SnackBar(

content: Text("Copied Successfully"),

),

);
}

@override
Widget build(BuildContext context) {

return Scaffold(

body: Stack(

children: [

Container(

decoration: const BoxDecoration(

gradient: LinearGradient(

begin: Alignment.topLeft,

end: Alignment.bottomRight,

colors: [

Color(0xff050816),

Color(0xff10192F),

Color(0xff050816),

],

),

),

),

Positioned(

top: -120,

right: -100,

child: Container(

height: 260,

width: 260,

decoration: BoxDecoration(

shape: BoxShape.circle,

color: Colors.cyan.withOpacity(.18),

boxShadow: [

BoxShadow(

color: Colors.cyan.withOpacity(.30),

blurRadius: 180,

spreadRadius: 80,

)

],

),

),

),

Positioned(

bottom: -120,

left: -120,

child: Container(

height: 260,

width: 260,

decoration: BoxDecoration(

shape: BoxShape.circle,

color: Colors.purple.withOpacity(.18),

boxShadow: [

BoxShadow(

color: Colors.purple.withOpacity(.30),

blurRadius: 180,

spreadRadius: 80,

)

],

),

),

),

SafeArea(

child: SingleChildScrollView(

padding: const EdgeInsets.all(20),

child: Column(

crossAxisAlignment:
CrossAxisAlignment.start,

children: [

const SizedBox(height: 10),

Center(

child: Container(

height: 90,

width: 90,

decoration: const BoxDecoration(

shape: BoxShape.circle,

gradient: LinearGradient(

colors: [

Color(0xff00E5FF),

Color(0xff2196F3),

Color(0xff7C3AED),

],

),

),

child: const Icon(

Icons.security,

color: Colors.white,

size: 46,

),

)
.animate()
.scale(
duration:
700.ms,
)
.fade(),

),

const SizedBox(height: 20),

Center(

child: Text(

"CryptoShield",

style: Theme.of(context)
.textTheme
.headlineMedium
?.copyWith(

fontWeight:
FontWeight.bold,

),

)
.animate()
.fade()
.slideY(),

),

const SizedBox(height: 6),

Center(

child: Text(

"AES-256 Encryption Demo",

style: Theme.of(context)
.textTheme
.bodyLarge,

).animate().fade(),

),

const SizedBox(height: 40),

Text(

"Plain Text",

style: Theme.of(context)
.textTheme
.titleLarge,

),

const SizedBox(height: 12),

CyberCard(

child: TextField(

controller: controller,

maxLines: 6,

decoration: const InputDecoration(

border: InputBorder.none,

hintText:
"Enter your secret message...",

),

),

),

const SizedBox(height: 30),

CyberButton(

onTap: encrypt,

icon: Icons.lock,

title: isEncrypting
? "Encrypting..."
: "AES-256 Encrypt",

colors: const [

Color(0xff00E5FF),

Color(0xff2196F3),

Color(0xff7C3AED),

],

),
  const SizedBox(height: 35),

  Text(
    "Encrypted Data",
    style: Theme.of(context).textTheme.titleLarge,
  ),

  const SizedBox(height: 12),

  CyberCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AnimatedOutput(
          text: encryptedText.isEmpty
              ? "Encrypted text will appear here..."
              : encryptedText,
          animate: encryptAnimation,
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(

            onPressed: encryptedText.isEmpty
                ? null
                : () => copy(encryptedText),

            icon: const Icon(Icons.copy),

            label: const Text(
              "Copy Cipher",
            ),

          ),
        ),

      ],
    ),
  ),

  const SizedBox(height: 30),

  CyberButton(

    onTap: decrypt,

    icon: Icons.lock_open,

    title: isDecrypting
        ? "Decrypting..."
        : "AES-256 Decrypt",

    colors: const [

      Color(0xff22C55E),

      Color(0xff16A34A),

    ],

  ),

  const SizedBox(height: 35),

  Text(
    "Decrypted Text",
    style: Theme.of(context).textTheme.titleLarge,
  ),

  const SizedBox(height: 12),

  CyberCard(

    child: Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        AnimatedOutput(

          text: decryptedText.isEmpty
              ? "Original text will appear here..."
              : decryptedText,

          animate: decryptAnimation,

        ),

        const SizedBox(height: 20),

        SizedBox(

          width: double.infinity,

          child: OutlinedButton.icon(

            onPressed: decryptedText.isEmpty
                ? null
                : () => copy(decryptedText),

            icon: const Icon(Icons.copy),

            label: const Text(
              "Copy Plain Text",
            ),

          ),

        ),

      ],

    ),

  ),

  const SizedBox(height: 35),

  Text(
    "Security Details",
    style: Theme.of(context).textTheme.titleLarge,
  ),

  const SizedBox(height: 12),

  CyberCard(

    child: Column(

      children: [

        buildRow(
          "Algorithm",
          "AES-256",
        ),

        buildRow(
          "Mode",
          "CBC",
        ),

        buildRow(
          "Padding",
          "PKCS7",
        ),

        buildRow(
          "Encoding",
          "Base64",
        ),

        buildRow(
          "IV",
          "Random 16 Bytes",
        ),

        buildRow(
          "Key",
          "256 Bit",
        ),

      ],

    ),

  ),

  const SizedBox(height: 40),

],

),

),

),

],

),

);

}

Widget buildRow(
    String title,
    String value,
    ) {

  return Padding(

    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),

    child: Row(

      children: [

        Expanded(

          child: Text(

            title,

            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),

          ),

        ),

        Text(

          value,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),

        ),

      ],

    ),

  );


}

}