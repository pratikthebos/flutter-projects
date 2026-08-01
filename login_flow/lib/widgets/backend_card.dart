import 'package:flutter/material.dart';

class BackendCard extends StatelessWidget {

  const BackendCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.only(bottom:20),

      child: const Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(

              "3. Backend Processing",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 22,

              ),

            ),

            SizedBox(height:15),

            Text("✔ Request Received"),

            Text("✔ JSON Parsed"),

            Text("✔ Validation Passed"),

            Text("✔ Calling Database"),

          ],

        ),

      ),

    );

  }

}