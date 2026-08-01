import 'package:flutter/material.dart';

class JsonCard extends StatelessWidget {

  const JsonCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.only(bottom:20),

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: const [

            Text(
              "7. JSON Parsing",
              style: TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height:18),

            Text("LoginResponse.fromJson(json)"),

            SizedBox(height:8),

            Text("UserModel.fromJson(json)"),

            SizedBox(height:8),

            Text("✔ Models Created"),

          ],

        ),

      ),

    );

  }

}